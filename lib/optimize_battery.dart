import 'dart:async';
import 'package:flutter/services.dart';

class OptimizeBattery {
  static const MethodChannel _channel = MethodChannel('optimize_battery');

  // check if the app ignoring BatteryOptimizations
  static Future<bool> isIgnoringBatteryOptimizations() async {
    final reading =
        await _channel.invokeMethod('isIgnoringBatteryOptimizations');
    return reading!;
  }

  // open BatteryOptimizations setting page
  static Future<bool> openBatteryOptimizationSettings() async {
    final reading =
        await _channel.invokeMethod('openBatteryOptimizationSettings');
    return reading!;
  }

  // stop battery optimization
  static Future<bool> stopOptimizingBatteryUsage() async {
    final reading = await _channel.invokeMethod('stopOptimizingBatteryUsage');
    return reading!;
  }
}
