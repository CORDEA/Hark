import AVFoundation
import Flutter
import UIKit

@main
@objc class AppDelegate: FlutterAppDelegate, FlutterImplicitEngineDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }

  func didInitializeImplicitFlutterEngine(_ engineBridge: FlutterImplicitEngineBridge) {
    GeneratedPluginRegistrant.register(with: engineBridge.pluginRegistry)
    AlarmPlugin.register(with: engineBridge.pluginRegistry.registrar(forPlugin: "AlarmPlugin")!)
  }
}

/// Bridges the Dart `hark/alarm` MethodChannel.
///
/// `startCriticalAlarm` loops `alarm.caf` (bundled with the app) on the
/// playback audio session so the sound plays even in silent mode. On devices
/// with the Critical Alerts entitlement, the OS also plays the APNs
/// `sound.critical` payload — this local loop covers the case when the app is
/// already in the foreground when the alert arrives.
class AlarmPlugin: NSObject, FlutterPlugin {
  private var player: AVAudioPlayer?

  static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(
      name: "hark/alarm",
      binaryMessenger: registrar.messenger()
    )
    let instance = AlarmPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    switch call.method {
    case "startCriticalAlarm":
      start(result: result)
    case "stopAlarm":
      stop(result: result)
    default:
      result(FlutterMethodNotImplemented)
    }
  }

  private func start(result: FlutterResult) {
    do {
      try AVAudioSession.sharedInstance().setCategory(
        .playback, mode: .default, options: [.duckOthers])
      try AVAudioSession.sharedInstance().setActive(true)

      if let url = Bundle.main.url(forResource: "alarm", withExtension: "caf")
        ?? Bundle.main.url(forResource: "alarm", withExtension: "wav")
      {
        player = try AVAudioPlayer(contentsOf: url)
        player?.numberOfLoops = -1
        player?.volume = 1.0
        player?.play()
      } else {
        // No bundled alarm asset — fall back to a system sound so testers
        // hear something during development.
        AudioServicesPlaySystemSound(1005)
      }
      result(nil)
    } catch {
      result(FlutterError(code: "audio", message: "\(error)", details: nil))
    }
  }

  private func stop(result: FlutterResult) {
    player?.stop()
    player = nil
    try? AVAudioSession.sharedInstance().setActive(
      false, options: [.notifyOthersOnDeactivation])
    result(nil)
  }
}
