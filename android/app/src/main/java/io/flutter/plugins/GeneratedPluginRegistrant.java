package io.flutter.plugins;

import androidx.annotation.Keep;
import androidx.annotation.NonNull;
import io.flutter.Log;

import io.flutter.embedding.engine.FlutterEngine;

/**
 * Generated file. Do not edit.
 * This file is generated by the Flutter tool based on the
 * plugins that support the Android platform.
 */
@Keep
public final class GeneratedPluginRegistrant {
  private static final String TAG = "GeneratedPluginRegistrant";
  public static void registerWith(@NonNull FlutterEngine flutterEngine) {
    try {
      flutterEngine.getPlugins().add(new com.baseflow.location_permissions.LocationPermissionsPlugin());
    } catch(Exception e) {
      Log.e(TAG, "Error registering plugin location_permissions, com.baseflow.location_permissions.LocationPermissionsPlugin", e);
    }
    try {
      flutterEngine.getPlugins().add(new io.flutter.plugins.pathprovider.PathProviderPlugin());
    } catch(Exception e) {
      Log.e(TAG, "Error registering plugin path_provider, io.flutter.plugins.pathprovider.PathProviderPlugin", e);
    }
    try {
      flutterEngine.getPlugins().add(new com.xamdesign.safe_device.SafeDevicePlugin());
    } catch(Exception e) {
      Log.e(TAG, "Error registering plugin safe_device, com.xamdesign.safe_device.SafeDevicePlugin", e);
    }
    try {
      flutterEngine.getPlugins().add(new com.wongpiwat.trust_location.TrustLocationPlugin());
    } catch(Exception e) {
      Log.e(TAG, "Error registering plugin trust_location, com.wongpiwat.trust_location.TrustLocationPlugin", e);
    }
  }
}
