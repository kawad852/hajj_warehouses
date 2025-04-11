import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:shared/src/helper/translation_extension.dart';
import 'package:shared/src/widgets/extensions/snackbar_extension.dart';

import '../helper/app_over_loader.dart';

class LocationProvider extends ChangeNotifier {
  double? latitude;
  double? longitude;
  bool isLoading = false;

  bool get isLocationGranted => latitude != null && longitude != null;

  void _toggleLoading(bool status) {
    isLoading = status;
    notifyListeners();
  }

  Future<void> determinePosition(
    BuildContext context, {
    Function()? onPermissionGranted,
    bool showSnackBar = false,
    bool withOverLayLoader = false,
  }) async {
    try {
      bool serviceEnabled;
      LocationPermission permission;

      if (withOverLayLoader) {
        AppOverlayLoader.show();
        _toggleLoading(true);
      }

      serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled && context.mounted && showSnackBar) {
        _showLocationErrorBanner(context);
        return;
      }

      permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          if (context.mounted && showSnackBar) {
            _showLocationErrorBanner(context);
          }
          return;
        }
      }

      if (permission == LocationPermission.deniedForever) {
        if (context.mounted && showSnackBar) {
          _showLocationErrorBanner(context);
        }
        return;
      }

      // ignore: deprecated_member_use
      final position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.best);
      latitude = position.latitude;
      longitude = position.longitude;
      notifyListeners();
      // debugPrint("Position:: Latitude:: $latitude Longitude:: $longitude");
      if (onPermissionGranted != null) {
        onPermissionGranted();
      }
    } catch (e) {
      debugPrint("PositionError:: $e");
    } finally {
      if (withOverLayLoader) {
        AppOverlayLoader.hide();
        _toggleLoading(false);
      }
    }
  }

  void _showLocationErrorBanner(BuildContext context) {
    context.showSnackBar(
      context.appLocalization.locationServiceDisabledMsg,
      action:
          !kIsWeb
              ? SnackBarAction(
                label: context.appLocalization.enable,
                onPressed: () {
                  Geolocator.openLocationSettings();
                },
              )
              : null,
    );
  }
}
