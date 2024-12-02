


import android.content.BroadcastReceiver
import android.content.Context
import android.content.Intent
import android.content.IntentFilter
import android.media.MediaRecorder
import android.os.Environment
import android.telephony.TelephonyManager
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import java.io.File

class MainActivity : FlutterActivity() {
    private val CHANNEL = "call_recorder"
    private var recorder: MediaRecorder? = null
    private var isRecording = false

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler { call, result ->
            when (call.method) {
                "startRecording" -> {
                    startCallRecording()
                    result.success(null)
                }
                "stopRecording" -> {
                    stopCallRecording()
                    result.success(null)
                }
                else -> result.notImplemented()
            }
        }
    }

    private fun startCallRecording() {
        try {
            val outputDir = File(Environment.getExternalStorageDirectory(), "CallRecordings")
            if (!outputDir.exists()) outputDir.mkdirs()

            val outputFilePath = "${outputDir.absolutePath}/call_${System.currentTimeMillis()}.mp4"

            recorder = MediaRecorder().apply {
                setAudioSource(MediaRecorder.AudioSource.VOICE_COMMUNICATION)
                setOutputFormat(MediaRecorder.OutputFormat.MPEG_4)
                setAudioEncoder(MediaRecorder.AudioEncoder.AAC)
                setOutputFile(outputFilePath)
                prepare()
                start()
            }

            isRecording = true
        } catch (e: Exception) {
            e.printStackTrace()
        }
    }

    private fun stopCallRecording() {
        try {
            if (isRecording) {
                recorder?.stop()
                recorder?.release()
                recorder = null
                isRecording = false
            }
        } catch (e: Exception) {
            e.printStackTrace()
        }
    }
}
