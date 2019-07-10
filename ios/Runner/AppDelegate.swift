import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?
  ) -> Bool {
    guard let flutterViewController = window?.rootViewController as? FlutterViewController else {
        return false
    }
    let DeviceIdentifierChannel: FlutterMethodChannel = FlutterMethodChannel(name: "flutter_boilerplate/NAME_YOUR_CHANNEL", binaryMessenger: flutterViewController)
    DeviceIdentifierChannel.setMethodCallHandler { (call: FlutterMethodCall, result: FlutterResult) in
        switch call.method {
        case "NAME_YOUR_METHOD":
            result("")
        default:
            result(FlutterMethodNotImplemented)
        }
    }
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}

