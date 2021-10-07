#import "MoonPhasePlugin.h"
#if __has_include(<moon_phase/moon_phase-Swift.h>)
#import <moon_phase/moon_phase-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "moon_phase-Swift.h"
#endif

@implementation MoonPhasePlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftMoonPhasePlugin registerWithRegistrar:registrar];
}
@end
