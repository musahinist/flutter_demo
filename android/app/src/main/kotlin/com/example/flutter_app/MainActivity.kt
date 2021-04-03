package com.example.flutter_app

import android.os.Build
import androidx.annotation.NonNull
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import kotlin.collections.HashMap


class MainActivity: FlutterActivity() {
    private val CHANNEL = "deviceInfo"

    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler { call, result ->
            if (call.method == "getDeviceInfo") {
                    result.success(getDeviceInfo())
            } else {
            result.notImplemented()
        }
        }
    }

    fun getDeviceInfo():MutableMap<String, Any> {
            val build: MutableMap<String, Any> = HashMap()
            build["board"] = Build.BOARD
            build["bootloader"] = Build.BOOTLOADER
            build["brand"] = Build.BRAND
            build["device"] = Build.DEVICE
            build["display"] = Build.DISPLAY
            build["fingerprint"] = Build.FINGERPRINT
            build["hardware"] = Build.HARDWARE
            build["host"] = Build.HOST
            build["id"] = Build.ID
            build["manufacturer"] = Build.MANUFACTURER
            build["model"] = Build.MODEL
            build["product"] = Build.PRODUCT
            build["tags"] = Build.TAGS
            build["type"] = Build.TYPE
        return build;
    }
}
