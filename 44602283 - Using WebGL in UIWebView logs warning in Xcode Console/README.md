# Using WebGL in UIWebView logs warning in Xcode Console

## Description
When using WebGL in a `UIWebView`, the following warning will be logged to the Xcode console:

```
2018-09-19 16:02:43.073254+0200 WebGLDemo[1791:105094] CoreAnimation: [EAGLContext renderbufferStorage:fromDrawable:] was called from a non-main thread in an implicit transaction! Note that this may be unsafe without an explicit CATransaction or a call to [CATransaction flush].
```

This warning will not be logged when using `WKWebView`.

This behavior may result in a crash, when the application will be send to the background. Please refer to the attached crash logs.

## Steps
1. Open the attached demo project
2. Tap on “WebGL with UIWebView”

## Expected
No warning will be logged.

## Actual
The following warning will be logged:

```
2018-09-19 16:02:43.073254+0200 WebGLDemo[1791:105094] CoreAnimation: [EAGLContext renderbufferStorage:fromDrawable:] was called from a non-main thread in an implicit transaction! Note that this may be unsafe without an explicit CATransaction or a call to [CATransaction flush].
```

## Notes
Notice that `UIWebView` is deprecated since iOS 12.0, but Google-Mobile-Ads-SDK [supports iOS 6 with v7.33.1][1] and still uses `UIWebView`.

[1]: https://github.com/CocoaPods/Specs/blob/master/Specs/5/9/a/Google-Mobile-Ads-SDK/7.33.1/Google-Mobile-Ads-SDK.podspec.json