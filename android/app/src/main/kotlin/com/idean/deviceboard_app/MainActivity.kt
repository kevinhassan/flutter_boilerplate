package com.example.flutter_boilerplate

import android.content.Context
import android.os.Build
import android.os.Bundle
import android.telephony.TelephonyManager


import io.flutter.app.FlutterActivity
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugins.GeneratedPluginRegistrant

class MainActivity: FlutterActivity() {
    private val mainChannelIdentifier = "flutter_boilerplate"
    private val channelIdentifier = "NAME_YOUR_CHANNEL"

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        GeneratedPluginRegistrant.registerWith(this)
        MethodChannel(flutterView, "$mainChannelIdentifier/$channelIdentifier").setMethodCallHandler { call, result ->
            when (call.method) {
                "NAME_YOUR_METHOD" -> {
                    result.success()
                }
                else -> {
                    result.notImplemented()
                }
            }
        }
    }
}
