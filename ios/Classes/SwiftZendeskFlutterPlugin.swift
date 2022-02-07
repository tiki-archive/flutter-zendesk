import Flutter
import UIKit

let channel : String = "com.mytiki.zendesk_flutter"
let zendeskApi = ZendeskApi()

public class SwiftZendeskFlutterPlugin: NSObject, FlutterPlugin {

  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: channel, binaryMessenger: registrar.messenger())
    let instance = SwiftZendeskFlutterPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
    }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    switch call.method {
            case "getZendeskCategories" : self.zendeskApi.getZendeskCategories(result: result)
            case "getZendeskSections" : self.zendeskApi.getZendeskSections(call: call, result: result)
            case "getZendeskArticles" : self.zendeskApi.getZendeskArticles(call: call, result: result)
            case "getZendeskArticle" : self.zendeskApi.getZendeskArticle(call: call, result: result)
            default : result(FlutterError(code: "-1", message: "Not implemented", details: nil))
          }
  }
}
