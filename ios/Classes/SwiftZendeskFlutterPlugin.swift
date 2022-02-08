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
            case "getZendeskCategories" : zendeskApi.getZendeskCategories(result: result)
            case "getZendeskSections" : zendeskApi.getZendeskSections(call: call, result: result)
            case "getZendeskArticles" : zendeskApi.getZendeskArticles(call: call, result: result)
            case "getZendeskArticle" : zendeskApi.getZendeskArticle(call: call, result: result)
            default : result(FlutterError(code: "-1", message: "Not implemented", details: nil))
          }
  }
}
