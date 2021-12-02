import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:optimize_battery/optimize_battery.dart';

void main() {
  const MethodChannel channel = MethodChannel('optimize_battery');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('isOptimised', () async {
    expect(await OptimizeBattery.stopOptimizingBatteryUsage(), true);
  });
}
