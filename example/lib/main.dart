import 'package:flutter/material.dart';
import 'package:optimize_battery/optimize_battery.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String isBatterIgnoredText = 'Unknown';

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: const Text('Optimize Battery Plugin Example'),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Check if app is ignoring battery optimizations
                ElevatedButton(
                    child:
                        const Text("Check if battery optimization is enabled"),
                    onPressed: () async {
                      //Check if battery optimization is enabled
                      final isIgnored = await OptimizeBattery
                          .isIgnoringBatteryOptimizations();
                      setState(() {
                        isBatterIgnoredText =
                            isIgnored ? "Ignored" : "Not Ignored";
                      });
                    }),
                Text("Battery Optimization is $isBatterIgnoredText"),
                const SizedBox(height: 20),

                // Open battery optimization settings
                ElevatedButton(
                  child: const Text("Open Battery Optimisation Settings"),
                  onPressed: () =>
                      // Open battery optimization settings
                      OptimizeBattery.openBatteryOptimizationSettings(),
                ),
                const SizedBox(height: 20),

                //Disable battery optimization
                ElevatedButton(
                    child: const Text("Disable Battery Optimisation"),
                    onPressed: () async {
                      //Stops the battery optimization
                      await OptimizeBattery.stopOptimizingBatteryUsage();
                      setState(() {
                        isBatterIgnoredText = "Unknown";
                      });
                    }),
              ],
            ),
          )),
    );
  }
}
