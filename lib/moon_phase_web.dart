import 'dart:async';
// In order to *not* need this ignore, consider extracting the "web" version
// of your plugin as a separate package, instead of inlining it in the same
// package as the core of your plugin.
import 'package:web/web.dart' as web;

import 'package:flutter/services.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';
export 'moon_painter.dart' show MoonPainter;
export 'moon_widget.dart' show MoonWidget;
export 'moon_phase.dart' show MoonPhase;

/// A web implementation of the MoonPhase plugin.
class MoonPhaseWeb {
  static void registerWith(Registrar registrar) {
    final MethodChannel channel = MethodChannel(
      'moon_phase',
      const StandardMethodCodec(),
      registrar,
    );

    final pluginInstance = MoonPhaseWeb();
    channel.setMethodCallHandler(pluginInstance.handleMethodCall);
  }

  /// Handles method calls over the MethodChannel of this plugin.
  /// Note: Check the "federated" architecture for a new way of doing this:
  /// https://flutter.dev/go/federated-plugins
  Future<dynamic> handleMethodCall(MethodCall call) async {
    switch (call.method) {
      case 'getPlatformVersion':
        return getPlatformVersion();
      default:
        throw PlatformException(
          code: 'Unimplemented',
          details: 'moon_phase for web doesn\'t implement \'${call.method}\'',
        );
    }
  }

  /// Returns a [String] containing the version of the platform.
  Future<String> getPlatformVersion() {
    final version = web.window.navigator.userAgent;
    return Future.value(version);
  }
}
