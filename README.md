# LaunchDarklyTakeHome

**Files to check:**
- LDPagination+Ext.swift
- LDItemViewFlip+Ext.swift
- UserInfoVC: getUserInfo()
- FollowerListVC: getFollowers()

**Branches**
- gettingStarted: Contains initial integration/testing of LaunchDarkly platform.
- LaunchDarklyGHFollowers: Production app that uses the Production mobile key.
- LaunchDarklyGHFollowersTest: Test app that uses the Test mobile key.

I started with a simple test project based off the Hello LaunchDarkly for iOS project.

![beginning1_adobespark](https://user-images.githubusercontent.com/10967353/136870025-87ccbc08-2bbf-45fc-9109-cfe0a1fb69a1.png)

I decided on using simple conditional functions for changing the labels and then went with the use of a ternary operator shown in the checkFeaturevalue() function to update all of the labels at once once I activated the feature flag.

After, I began thinking through what the best way to utilize and integrate this platform. One of the main ideas I wanted to tackle was to see how we accomodate for UI changes and the bugs/errors that may occur when moving them around. For this reason, I decided it would be best if I used a course project I have been recently working on in order to test the LaunchDarkly SDK in a more full featured app. I felt as though this would allow me to focus more on the integration of the platform and try to find solid solutions to abstract some of the functions required for LaunchDarkly services away from the view controller. 

I felt as though the best way to achieve this was to create extensions on the view controllers and classes that needed feature flagging. I began with changing the pagination values for the GitHub followers API utilizing the String variation to create different cases.

![pagination1_adobespark](https://user-images.githubusercontent.com/10967353/136869949-4e606e63-183e-4bf2-8ac1-11bf1d559a56.png)


I also decided to create the custom struct due to stored properties not being allowed inside of extensions. This way, we do not have to jump around files when the feature flag is ready to be fully implemented and archived and we only have to delete the function at the call site.

The pagination switch statement simply changes the followersPerPage located in the NetworkManager. When the configureLDFeatureFlagOnMainThread() is called, it will change the followersPerPage to the appropriate value depending on the variation chosen in the dashboard.

![pagination3_adobespark](https://user-images.githubusercontent.com/10967353/136870089-63e8b6e7-eb65-42ef-b133-922dd64871b0.png)


Here, I have decided to insert the configureLDFeatureFlagOnMainThread() upon the success case whenever users are retrieved from the server. This way it will update as you scroll through a list of users.

![pagination 4](https://user-images.githubusercontent.com/10967353/136869390-b79e16c0-4c83-4eeb-a512-dcef44b6dbd8.png)


I then wanted to see how I can change UI elements in the app. I decided to do this in the UserInfoVC by creating the configureItemVCFlipLDFeatureFlag() at the call site for when a single user is sucessfully retrieved and is about to have their information displayed. 

![ItemView1_adobespark](https://user-images.githubusercontent.com/10967353/136870317-659c2160-c77c-49f3-865b-939f21ca5197.png)

All of the functions required for the switching of the ItemViews are listed in the LDItemViewFlip+Ext. This is the result when activating the feature flag.

![Screen Recording 2021-10-11 at 5 28 24 PM](https://user-images.githubusercontent.com/10967353/136871052-4110d17e-fc56-467c-8ac8-aabc844d2eb2.gif)

I wanted to focus on allowing the de-integration of feature flags in the future being extremely easily, and because of this only have one function needed at each respective call site.
