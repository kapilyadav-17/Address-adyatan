//
//  Generated file. Do not edit.
//

// clang-format off

#import "GeneratedPluginRegistrant.h"

#if __has_include(<location_permissions/LocationPermissionsPlugin.h>)
#import <location_permissions/LocationPermissionsPlugin.h>
#else
@import location_permissions;
#endif

#if __has_include(<path_provider/FLTPathProviderPlugin.h>)
#import <path_provider/FLTPathProviderPlugin.h>
#else
@import path_provider;
#endif

#if __has_include(<safe_device/SafeDevicePlugin.h>)
#import <safe_device/SafeDevicePlugin.h>
#else
@import safe_device;
#endif

@implementation GeneratedPluginRegistrant

+ (void)registerWithRegistry:(NSObject<FlutterPluginRegistry>*)registry {
  [LocationPermissionsPlugin registerWithRegistrar:[registry registrarForPlugin:@"LocationPermissionsPlugin"]];
  [FLTPathProviderPlugin registerWithRegistrar:[registry registrarForPlugin:@"FLTPathProviderPlugin"]];
  [SafeDevicePlugin registerWithRegistrar:[registry registrarForPlugin:@"SafeDevicePlugin"]];
}

@end
