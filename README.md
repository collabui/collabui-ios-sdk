# CollabUI iOS SDK

## Overview
CollabUI iOS SDK integrates your ObjectiveC iOS app with the CollabUI platform.

## Terminology

#### Session
Session is a connection between your CollabUI account and a version of your iOS app integrated with CollabUI. You initiate a session within your web browser. The connection is established when you navigate to the session URL by scanning a QR code or when you manually open the session URL on your mobile device.

#### Snapshot
Snapshot is a combination of:
* Screenshot of a specific screen in your app
* Hierarchy of the UI controls displayed on the screen
* Properties of the UI controls displayed on the screen

Each session can have multiple snapshots. A snapshot is created when you click the 'Take a snapshot' button in the CollabUI web app.

## Integration

To integrate with CollabUI:
* Create a CollabUI account
* Get your API key from your account settings page
* Download the CollabUI iOS framework from our GitHub page
* Change your `didFinishLaunchingWithOptions` application delegate method:
```objectiveC
[[CollabUI sharedInstance] initializeWithApiKey:@"<your_api_key>"];
```
* Edit the info.plist of your mobile app to handle collabui:// URLs:
    * Add a new item into the URL types collection
    * Set CFBundleURLTypes to 'Viewer'
    * Set URL identifier to 'com.collabui'
    * Set URL schemes collection to have a single entry 'collabui'
* Change your `willFinishLaunchingWithOptions` application delegate method:
```objectiveC
if ([launchOptions valueForKey:UIApplicationLaunchOptionsURLKey] != nil)
{
    return YES;
}
```
* Change your `openURL` application delegate method
```objectiveC
if ([[CollabUI sharedInstance] openURL:url])
{
    return YES;
}
```
* Make sure you only integrate with CollabUI in debug and preview builds. We do not recommend to keep the integration active in production builds of your app.
* Use the provided SampleApp as an example of the integration

## Taking snapshots
If you don't have a session established then connect your first session:
* Click the 'Connect' button on the Sessions page of the CollabUI web site.
* Scan the QR code with the mobile device that has your app installed. 
    * Alternatively, you can connect a session by tapping the URL next to the QR code when browsing CollabUI web site on a mobile device.

Next, take a snapshot of your app:
* Navigate to the active session on the Sessions page.
* Click 'Create new' link. Please note that your app needs to be running in foreground when taking a snapshot.