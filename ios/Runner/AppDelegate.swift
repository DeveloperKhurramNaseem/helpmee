import Flutter
import UIKit
import SafariServices

@main
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)
    let controller = window?.rootViewController as! FlutterViewController
      let safariChannel = FlutterMethodChannel(
        name: "native_safari_sheet",
        binaryMessenger: controller.binaryMessenger
      )
      safariChannel.setMethodCallHandler { call, result in
        if call.method == "openSafariSheet" {
          guard
            let args = call.arguments as? [String: Any],
            let urlString = args["url"] as? String,
            let url = URL(string: urlString)
          else {
            result(FlutterError(code: "INVALID_URL", message: "Invalid URL", details: nil))
            return
          }

          let safariVC = SFSafariViewController(url: url)

          // 👇 THIS IS THE KEY LINE
          safariVC.modalPresentationStyle = .pageSheet

          // Optional (recommended)
          safariVC.preferredControlTintColor = UIColor.systemBlue
          safariVC.dismissButtonStyle = .close

          controller.present(safariVC, animated: true)
          result(nil)
        }
      }
      
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
