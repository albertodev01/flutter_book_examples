package com.example.platform_datetime

import androidx.annotation.NonNull
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import java.time.LocalDateTime

class MainActivity: FlutterActivity() {
    private val CHANNEL = "fluttercompletereference.com/date-time"

    override fun configureFlutterEngine(@NonNull flutterEngine:FlutterEngine){
        super.configureFlutterEngine(flutterEngine)

        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL)
            .setMethodCallHandler {call, result ->
                if (call.method == "getDateAndTime") {
                    result.success(LocalDateTime.now().toString());
                } else {
                    result.notImplemented()
                }
            }
    }
}
