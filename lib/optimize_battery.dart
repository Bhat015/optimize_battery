import 'dart:async';
import 'package:flutter/services.dart';

class OptimizeBattery {
  static const MethodChannel _channel = MethodChannel('optimize_battery');

  /// checks if the app is ignoring BatteryOptimization.
  /// 
  /// returns true if the app is ignoring BatteryOptimization.
  /// returns false if the app is not ignoring BatteryOptimization.
  static Future<bool> isIgnoringBatteryOptimizations() async {
    final reading =
        await _channel.invokeMethod('isIgnoringBatteryOptimizations');
    return reading!;
  }

  /// opens BatteryOptimizations setting page
  /// Lets the user to navigate to the app and enable/disable BatteryOptimizations.
  /// 
  /// returns true if the settings page is opened
  static Future<bool> openBatteryOptimizationSettings() async {
    final reading =
        await _channel.invokeMethod('openBatteryOptimizationSettings');
    return reading!;
  }

  /// stops battery optimization
  /// 
  /// To use this method you need to have the following permissions in mainfest file:
  /// 
  /// `<uses-permission  android:name="android.permission.REQUEST_IGNORE_BATTERY_OPTIMIZATIONS"/>`
  /// 
  /// WARNING: It uses the intent(ACTION_REQUEST_IGNORE_BATTERY_OPTIMIZATIONS). 
  /// Which is not recommended unless its an excemtion case. 
  /// 
  /// Read more here : https://developer.android.com/training/monitoring-device-state/doze-standby#exemption-cases
  /// 
  /// returns true if stop optimization dialog is shown
  static Future<bool> stopOptimizingBatteryUsage() async {
    final reading = await _channel.invokeMethod('stopOptimizingBatteryUsage');
    return reading!;
  }
}
