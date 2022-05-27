import 'package:route/route.dart';

/// A user's geographic location
class UserLocation {
  const UserLocation._(this.location, this.isOld);

  /// Create a new [UserLocation] at the given location
  const UserLocation(LatLng location) : this._(location, false);

  /// The geographic coordinate
  final LatLng location;

  /// Describes whether this location has been expired
  final bool isOld;

  /// Mark this location as "stale" or outdated
  UserLocation expire() => UserLocation._(location, true);
}
