//
//  Generated file. Do not edit.
//

import FlutterMacOS
import Foundation

import app_settings
import geolocator_apple
import path_provider_foundation
import shared_preferences_foundation
import sqflite_darwin

func RegisterGeneratedPlugins(registry: FlutterPluginRegistry) {
  AppSettingsPlugin.register(with: registry.registrar(forPlugin: "AppSettingsPlugin"))
  GeolocatorPlugin.register(with: registry.registrar(forPlugin: "GeolocatorPlugin"))
  PathProviderPlugin.register(with: registry.registrar(forPlugin: "PathProviderPlugin"))
  SharedPreferencesPlugin.register(with: registry.registrar(forPlugin: "SharedPreferencesPlugin"))
  SqflitePlugin.register(with: registry.registrar(forPlugin: "SqflitePlugin"))
}
