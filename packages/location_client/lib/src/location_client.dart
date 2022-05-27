import 'dart:async';

import 'package:async/async.dart';
import 'package:location/location.dart';
import 'package:route/route.dart';
import 'package:rxdart/rxdart.dart';

import '../models/models.dart';

extension on Future<PermissionStatus> {
  Future<bool> get isGranted async {
    final status = await this;

    return status == PermissionStatus.granted ||
        status == PermissionStatus.grantedLimited;
  }
}

/// {@template location_client}
/// A client that deals with user location
/// {@endtemplate}
class LocationClient {
  /// {@macro location_client}
  LocationClient({Location? location})
      : _location = location ?? Location(),
        _userLocationSubject = BehaviorSubject() {
    _userLocationTimeout = RestartableTimer(
      _expirationTime,
      _expireLocation,
    );
  }

  static const _expirationTime = Duration(minutes: 5);

  final Location _location;
  final BehaviorSubject<UserLocation> _userLocationSubject;
  late RestartableTimer _userLocationTimeout;
  Future<PermissionStatus>? _permissionStatus;
  StreamSubscription<LocationData>? _locationSubscription;

  /// The latest retrieved [UserLocation]
  ///
  /// Will be null if the location has not been retrieved yet
  UserLocation? get latestLocation => _userLocationSubject.valueOrNull;

  /// A stream of updated [UserLocation]
  Stream<UserLocation> get userLocation => _userLocationSubject.stream;

  /// Does the app have permission to get the user location?
  Future<bool> get canGetLocation =>
      (_permissionStatus ??= _location.hasPermission()).isGranted;

  /// Request permission to access the user location
  ///
  /// Does nothing if permission is granted
  Future<bool> requestPermission() {
    _permissionStatus = _location.requestPermission();
    return canGetLocation;
  }

  /// Initialize the location client, requesting permission if it hasn't already
  /// been granted
  ///
  /// Returns true if the location was successfully intitialized
  Future<bool> initialize() async {
    if (await requestPermission()) {
      try {
        _onLocationUpdate(
            await _location.getLocation().timeout(Duration(seconds: 2)));
      } catch (e) {
        print(e);
      }

      _locationSubscription =
          _location.onLocationChanged.listen(_onLocationUpdate);

      return true;
    }

    return false;
  }

  void _expireLocation() {
    if (_userLocationSubject.hasValue) {
      _userLocationSubject.add(_userLocationSubject.value.expire());
    }
  }

  /// Dispose of all resources used by this client
  void dispose() {
    _userLocationSubject.close();
    _userLocationTimeout.cancel();
    _locationSubscription?.cancel();
  }

  void _onLocationUpdate(LocationData locationData) {
    if (locationData.latitude != null && locationData.longitude != null) {
      _userLocationSubject.add(UserLocation(LatLng(
        locationData.latitude!,
        locationData.longitude!,
      )));

      _userLocationTimeout.reset();
    }
  }
}
