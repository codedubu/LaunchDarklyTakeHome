# LaunchDarklyTakeHome

**Files to check:**
- LDPagination+Ext.swift
- LDItemViewFlip+Ext.swift
- FollowerListVC: getFollowers()
- - UserInfoVC: getUserInfo()

**Branches**
- gettingStarted: Contains initial integration/testing of LaunchDarkly platform.
- LaunchDarklyGHFollowers: Production app that uses the Production mobile key.
- LaunchDarklyGHFollowersTest: Test app that uses the Test mobile key.



I started with a simple test project based off the Hello LaunchDarkly for iOS project.

![beginning1_adobespark](https://user-images.githubusercontent.com/10967353/136870025-87ccbc08-2bbf-45fc-9109-cfe0a1fb69a1.png)

I decided on using conditional functions for changing the labels and then went with the use of a ternary operator shown in the checkFeaturevalue() function to update all of the labels at once once I activated the feature flag.

After, I began thinking through what the best way to utilize and integrate the platform would be. One of the main ideas I wanted to tackle was to see how we accomodate for UI changes to see the bugs/errors that may occur when moving them around. For this reason, I decided it would be best if I used a course project I have been recently working on in order to test the LaunchDarkly SDK in a more full featured app. I felt as though this would allow me to focus more on the integration of the platform and try to find solid solutions to abstract some of the logic required for the LaunchDarkly services away from the view controllers. 

I felt as though the best way to achieve this was to create extensions on the view controllers and classes that needed feature flagging.

I started with changing the pagination values for the GitHub followers API utilizing the String variation to create different cases.

![pagination1_adobespark](https://user-images.githubusercontent.com/10967353/136869949-4e606e63-183e-4bf2-8ac1-11bf1d559a56.png)


I decided to create the custom featureFlag struct due to stored properties not being allowed inside of extensions. This way, we dont need to keep the stored properties on the views that will be feature flagged and instead keep all of the LaunchDarkly methods in one extension. This would allow us to only have to delete the extension and the function at the call site when it comes time to fully integrate the feature into the application and archive the feature flag in the platform.

The pagination switch statement changes the followersPerPage located in the NetworkManager. When the configureLDFeatureFlagOnMainThread() is called, it will change the followersPerPage to the appropriate value depending on the variation chosen in the dashboard. I included the third variation to test a feature flag with more than two variations.

![pagination3_adobespark](https://user-images.githubusercontent.com/10967353/136870089-63e8b6e7-eb65-42ef-b133-922dd64871b0.png)


Here, I have decided to insert the configureLDFeatureFlagOnMainThread() upon the success case whenever users are retrieved from the server. This way it will update as you scroll through a list of users.

![pagination 4](https://user-images.githubusercontent.com/10967353/136869390-b79e16c0-4c83-4eeb-a512-dcef44b6dbd8.png)

The pagination feature flag is much easier to see while using the app. I recommend searching the user "twostraws" in the main view controller to see a large list of followers.

I then wanted to see how I can change UI elements in the app. I decided to do this in the UserInfoVC by using configureItemVCFlipLDFeatureFlag() at the call site for when a single user is sucessfully retrieved and is about to have their information displayed. 

![ItemView1_adobespark](https://user-images.githubusercontent.com/10967353/136870317-659c2160-c77c-49f3-865b-939f21ca5197.png)

This is the result when activating the ItemView flipping feature flag.

![ScreenRecordingSample](https://user-images.githubusercontent.com/10967353/136880834-424cb273-ddba-41f6-a461-f03424967dd4.gif)
