import 'package:distance/distance.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/plugin_api.dart';
import 'package:latlong/latlong.dart' show LatLng;
import 'package:location/location.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:snap_path/models/saved_route.dart';

class AppState extends ChangeNotifier {
  final Location _location;
  final MapController mapController;
  final String mapKey;
  SharedPreferences _preferences;
  
  LatLng userLocation;
  LatLng selectedLocation;
  List<SavedRouteData> savedRoutes;
  ThemeMode themeMode;
  bool canGetLocation = false;
  bool controlsVisible = true;
  bool initialized = false;
  bool showIntro = true;

  bool isMetric = false;
  double metersPerSecond = 3.3528;

  AppState({@required Location location, @required this.mapController, @required this.mapKey})
    : _location = location {
      Future.wait([
        _initializePreferences(),
        _initializeLocation()
      ]).then((_) => notifyListeners());
  }

  /// Set the [userLocation] based on the given locationData
  void _setLocation(LocationData locationData) {
    userLocation = LatLng(locationData.latitude, locationData.longitude);
  }

  /// Read the shared preferences and initialize fields
  Future<void> _initializePreferences() async {
    _preferences = await SharedPreferences.getInstance();

    isMetric = _preferences.getBool('isMetric')?? isMetric;
    metersPerSecond = _preferences.getDouble('metersPerSecond')?? metersPerSecond;
    showIntro = _preferences.getBool('showIntro')?? showIntro;
    themeMode = ThemeMode.values[_preferences.getInt('themeMode')?? 0];
    savedRoutes = _preferences.getStringList('savedRoutes')?.map((d) => SavedRouteData.decode(d))?.toList(growable: false)?? List(0);
  }

  /// Check if the location permission is granted, if so go to the current location, otherwise set
  /// [initialized] to true
  Future<void> _initializeLocation() async {
    switch (await _location.hasPermission()) {
      case PermissionStatus.granted:
        canGetLocation = true;
        _setLocation(await _location.getLocation());
        
        goToUserLocation(ask: false);

        _location.changeSettings(
          accuracy: LocationAccuracy.balanced,
          interval: 5000,
        );

        _location.onLocationChanged.listen((locationData) {
          _setLocation(locationData);

          notifyListeners();
        });
        break;
      case PermissionStatus.deniedForever:
        canGetLocation = false;
        break;
      case PermissionStatus.denied:
        canGetLocation = true;
        break;
    }

    initialized = true;
  }

  /// Toggle the state of control visibility
  void toggleControls(bool state) {
    controlsVisible = state;

    notifyListeners();
  }

  /// Move the map to the current user location
  /// 
  /// If location permission is not granted and [ask] is true, then request permission
  void goToUserLocation({bool ask = true}) {
    if (userLocation == null) {
      if (ask) {
        _location.requestPermission().then((_) => _initializeLocation());
      }
    } else if (userLocation != null && mapController.ready) {
      mapController.move(userLocation, 14);
    }
  }

  /// Select the given location and show it with the given bounds
  void selectLocation(LatLng center, LatLngBounds bounds) {
    moveToShow(bounds: bounds, padding: EdgeInsets.all(20));

    selectedLocation = center;
    notifyListeners();
  }

  /// Save the given path
  void saveRoute(List<LatLng> coordinates, Distance elevationGain) {
    savedRoutes = [SavedRouteData(coordinates, elevationGain), ...savedRoutes];
    notifyListeners();

    updatePreference('savedRoutes', savedRoutes.map((r) => r.encoded).toList());
  }

  /// Delete any saved routes with the given polyline
  void deleteRoute(int indexToRemove) {
    savedRoutes = List.generate(savedRoutes.length - 1, (index) {
      if (index < indexToRemove) {
        return savedRoutes[index];
      } else {
        return savedRoutes[index + 1];
      }
    });
    notifyListeners();

    updatePreference('savedRoutes', savedRoutes.map((r) => r.encoded).toList());
  }

  /// Move the map to show the given bounds
  void moveToShow({LatLngBounds bounds, EdgeInsets padding}) {
    var moveMap = ([Null _]) => mapController.fitBounds(bounds, options: FitBoundsOptions(padding: padding));
    if (mapController.ready) {
      moveMap();
    } else {
      mapController.onReady.then(moveMap);
    }
  }

  /// Update the given preference to the given value
  void updatePreference(String key, dynamic value) {
    if (value is bool) {
      _preferences.setBool(key, value);
    } else if (value is int) {
      _preferences.setInt(key, value);
    } else if (value is double) {
      _preferences.setDouble(key, value);
    } else if (value is String) {
      _preferences.setString(key, value);
    } else if (value is List<String>) {
      _preferences.setStringList(key, value);
    }
    
    // Actions to perform based on certain preferences being set (namely updating state)
    switch (key) {
      case 'isMetric':
        isMetric = value as bool;
        notifyListeners();
        break;
      case 'metersPerSecond':
        metersPerSecond = value as double;
        notifyListeners();
        break;
      case 'showIntro':
        showIntro = value as bool;
        notifyListeners();
        break;
      case 'themeMode':
        themeMode = ThemeMode.values[value];
        notifyListeners();
        break;
    }
  }
}