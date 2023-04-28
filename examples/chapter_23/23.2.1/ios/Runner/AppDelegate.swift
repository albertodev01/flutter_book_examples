import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    let vc = window?.rootViewController as! FlutterViewController
    let channel = FlutterMethodChannel(
      name: "fluttercompletereference.com/date-time",
      binaryMessenger: vc.binaryMessenger)

    channel.setMethodCallHandler({
      (call: FlutterMethodCall, result: FlutterResult) -> Void in
      guard call.method == "getDateAndTime" else {
        result(FlutterMethodNotImplemented)
        return
      }
      let formatter = DateFormatter()
      formatter.dateStyle = .short
      result(formatter.string(from: Date.now))
    })

    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
