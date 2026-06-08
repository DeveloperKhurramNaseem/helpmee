package com.helpmee.app.help_mee

import android.net.Uri
import androidx.browser.customtabs.CustomTabsIntent
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import androidx.core.net.toUri

class MainActivity : FlutterActivity(){

    private val CHANNEL = "native_safari_sheet"

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        MethodChannel(
            flutterEngine.dartExecutor.binaryMessenger,
            CHANNEL
        ).setMethodCallHandler { call, result ->

            when (call.method) {

                "openChromeTab" -> {
                    val url = call.argument<String>("url")

                    if (url.isNullOrEmpty()) {
                        result.error(
                            "INVALID_URL",
                            "URL is null or empty",
                            null
                        )
                        return@setMethodCallHandler
                    }

                    val customTabsIntent = CustomTabsIntent.Builder()
                        .setShowTitle(true)
                        .build()

                    customTabsIntent.launchUrl(
                        this,
                        url.toUri()
                    )

                    result.success(null)
                }

                else -> result.notImplemented()
            }
        }

    }
}
