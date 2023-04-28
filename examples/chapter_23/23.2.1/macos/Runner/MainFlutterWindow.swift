import Cocoa
import FlutterMacOS

class MainFlutterWindow: NSWindow {
  override func awakeFromNib() {
    let flutterViewController = FlutterViewController()
    let windowFrame = self.frame
    self.contentViewController = flutterViewController
    self.setFrame(windowFrame, display: true)

    // Create the channel
    let registrar = flutterViewController.registrar(forPlugin: "DateAndTime")
    let channel = FlutterMethodChannel(
      name: "fluttercompletereference.com/date-time",
      binaryMessenger: registrar.messenger)

    // Add the listener
    channel.setMethodCallHandler({
      (call: FlutterMethodCall, result: FlutterResult) -> Void in
      guard call.method == "getDateAndTime" else {
        result(FlutterMethodNotImplemented)
        return
      }
      let formatter = DateFormatter()
      formatter.dateStyle = .short
      result(formatter.string(from: Date()))
    })

    RegisterGeneratedPlugins(registry: flutterViewController)

    super.awakeFromNib()
  }
}
