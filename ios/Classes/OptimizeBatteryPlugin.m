#import "OptimizeBatteryPlugin.h"
#if __has_include(<optimize_battery/optimize_battery-Swift.h>)
#import <optimize_battery/optimize_battery-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "optimize_battery-Swift.h"
#endif

@implementation OptimizeBatteryPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftOptimizeBatteryPlugin registerWithRegistrar:registrar];
}
@end
