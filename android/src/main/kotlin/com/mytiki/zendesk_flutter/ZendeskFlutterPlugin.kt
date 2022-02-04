package com.mytiki.zendesk_flutter

import androidx.annotation.NonNull

import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import io.flutter.plugin.common.MethodChannel

class ZendeskFlutterPlugin: FlutterPlugin, MethodCallHandler {
  private lateinit var channel : MethodChannel
  private lateinit var zendeskApi: ZendeskApi

  override fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
    channel = MethodChannel(flutterPluginBinding.binaryMessenger, "com.mytiki.zendesk_flutter")
    channel.setMethodCallHandler(this)
    zendeskApi = ZendeskApi()
    zendeskApi.initZendesk(flutterPluginBinding.applicationContext)
  }

  override fun onMethodCall(@NonNull call: MethodCall, @NonNull result: Result) {
    channel.setMethodCallHandler { call, result ->
      when (call.method) {
        "getZendeskCategories" -> zendeskApi.getZendeskCategories(result)
        "getZendeskSections" -> zendeskApi.getZendeskSections(call, result)
        "getZendeskArticles" -> zendeskApi.getZendeskArticles(call, result)
        "getZendeskArticle" -> zendeskApi.getZendeskArticle(call, result)
        else -> result.notImplemented()
      }
    }
  }

  override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
    channel.setMethodCallHandler(null)
  }
}
