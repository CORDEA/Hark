package jp.cordea.hark

import android.media.AudioAttributes
import android.media.AudioManager
import android.media.MediaPlayer
import android.media.RingtoneManager
import android.net.Uri
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity : FlutterActivity() {
    private var player: MediaPlayer? = null

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, "hark/alarm")
            .setMethodCallHandler { call, result ->
                when (call.method) {
                    "startCriticalAlarm" -> {
                        try {
                            startAlarm()
                            result.success(null)
                        } catch (t: Throwable) {
                            result.error("audio", t.message, null)
                        }
                    }
                    "stopAlarm" -> {
                        stopAlarm()
                        result.success(null)
                    }
                    else -> result.notImplemented()
                }
            }
    }

    // MediaPlayer with USAGE_ALARM bypasses ringer/DND. If no custom alarm
    // asset is bundled, we fall back to the system default alarm URI so
    // testers hear something without any extra setup.
    private fun startAlarm() {
        if (player != null) return
        val uri: Uri = RingtoneManager.getDefaultUri(RingtoneManager.TYPE_ALARM)
            ?: RingtoneManager.getDefaultUri(RingtoneManager.TYPE_NOTIFICATION)
        player = MediaPlayer().apply {
            setAudioAttributes(
                AudioAttributes.Builder()
                    .setUsage(AudioAttributes.USAGE_ALARM)
                    .setContentType(AudioAttributes.CONTENT_TYPE_SONIFICATION)
                    .build()
            )
            setDataSource(this@MainActivity, uri)
            isLooping = true
            setVolume(1f, 1f)
            prepare()
            start()
        }
        // Nudge alarm volume to a usable level in case the user has it low.
        val am = getSystemService(AUDIO_SERVICE) as AudioManager
        val max = am.getStreamMaxVolume(AudioManager.STREAM_ALARM)
        am.setStreamVolume(AudioManager.STREAM_ALARM, (max * 0.7f).toInt(), 0)
    }

    private fun stopAlarm() {
        player?.let {
            try { it.stop() } catch (_: Throwable) {}
            it.release()
        }
        player = null
    }

    override fun onDestroy() {
        stopAlarm()
        super.onDestroy()
    }
}
