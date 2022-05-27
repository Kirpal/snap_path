// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'draw_route_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$DrawRouteEventTearOff {
  const _$DrawRouteEventTearOff();

  _Cleared cleared() {
    return const _Cleared();
  }

  _Ended ended() {
    return const _Ended();
  }

  _PointAdded pointAdded(LatLng point) {
    return _PointAdded(
      point,
    );
  }

  _RouteReplaced routeReplaced(Route route) {
    return _RouteReplaced(
      route,
    );
  }

  _RouteMatched routeMatched(int index, Route route) {
    return _RouteMatched(
      index,
      route,
    );
  }

  _ElevationFetched elevationFetched(int index, Route route) {
    return _ElevationFetched(
      index,
      route,
    );
  }
}

/// @nodoc
const $DrawRouteEvent = _$DrawRouteEventTearOff();

/// @nodoc
mixin _$DrawRouteEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() cleared,
    required TResult Function() ended,
    required TResult Function(LatLng point) pointAdded,
    required TResult Function(Route route) routeReplaced,
    required TResult Function(int index, Route route) routeMatched,
    required TResult Function(int index, Route route) elevationFetched,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? cleared,
    TResult Function()? ended,
    TResult Function(LatLng point)? pointAdded,
    TResult Function(Route route)? routeReplaced,
    TResult Function(int index, Route route)? routeMatched,
    TResult Function(int index, Route route)? elevationFetched,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Cleared value) cleared,
    required TResult Function(_Ended value) ended,
    required TResult Function(_PointAdded value) pointAdded,
    required TResult Function(_RouteReplaced value) routeReplaced,
    required TResult Function(_RouteMatched value) routeMatched,
    required TResult Function(_ElevationFetched value) elevationFetched,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Cleared value)? cleared,
    TResult Function(_Ended value)? ended,
    TResult Function(_PointAdded value)? pointAdded,
    TResult Function(_RouteReplaced value)? routeReplaced,
    TResult Function(_RouteMatched value)? routeMatched,
    TResult Function(_ElevationFetched value)? elevationFetched,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DrawRouteEventCopyWith<$Res> {
  factory $DrawRouteEventCopyWith(
          DrawRouteEvent value, $Res Function(DrawRouteEvent) then) =
      _$DrawRouteEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$DrawRouteEventCopyWithImpl<$Res>
    implements $DrawRouteEventCopyWith<$Res> {
  _$DrawRouteEventCopyWithImpl(this._value, this._then);

  final DrawRouteEvent _value;
  // ignore: unused_field
  final $Res Function(DrawRouteEvent) _then;
}

/// @nodoc
abstract class _$ClearedCopyWith<$Res> {
  factory _$ClearedCopyWith(_Cleared value, $Res Function(_Cleared) then) =
      __$ClearedCopyWithImpl<$Res>;
}

/// @nodoc
class __$ClearedCopyWithImpl<$Res> extends _$DrawRouteEventCopyWithImpl<$Res>
    implements _$ClearedCopyWith<$Res> {
  __$ClearedCopyWithImpl(_Cleared _value, $Res Function(_Cleared) _then)
      : super(_value, (v) => _then(v as _Cleared));

  @override
  _Cleared get _value => super._value as _Cleared;
}

/// @nodoc

class _$_Cleared with DiagnosticableTreeMixin implements _Cleared {
  const _$_Cleared();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'DrawRouteEvent.cleared()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties..add(DiagnosticsProperty('type', 'DrawRouteEvent.cleared'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _Cleared);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() cleared,
    required TResult Function() ended,
    required TResult Function(LatLng point) pointAdded,
    required TResult Function(Route route) routeReplaced,
    required TResult Function(int index, Route route) routeMatched,
    required TResult Function(int index, Route route) elevationFetched,
  }) {
    return cleared();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? cleared,
    TResult Function()? ended,
    TResult Function(LatLng point)? pointAdded,
    TResult Function(Route route)? routeReplaced,
    TResult Function(int index, Route route)? routeMatched,
    TResult Function(int index, Route route)? elevationFetched,
    required TResult orElse(),
  }) {
    if (cleared != null) {
      return cleared();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Cleared value) cleared,
    required TResult Function(_Ended value) ended,
    required TResult Function(_PointAdded value) pointAdded,
    required TResult Function(_RouteReplaced value) routeReplaced,
    required TResult Function(_RouteMatched value) routeMatched,
    required TResult Function(_ElevationFetched value) elevationFetched,
  }) {
    return cleared(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Cleared value)? cleared,
    TResult Function(_Ended value)? ended,
    TResult Function(_PointAdded value)? pointAdded,
    TResult Function(_RouteReplaced value)? routeReplaced,
    TResult Function(_RouteMatched value)? routeMatched,
    TResult Function(_ElevationFetched value)? elevationFetched,
    required TResult orElse(),
  }) {
    if (cleared != null) {
      return cleared(this);
    }
    return orElse();
  }
}

abstract class _Cleared implements DrawRouteEvent {
  const factory _Cleared() = _$_Cleared;
}

/// @nodoc
abstract class _$EndedCopyWith<$Res> {
  factory _$EndedCopyWith(_Ended value, $Res Function(_Ended) then) =
      __$EndedCopyWithImpl<$Res>;
}

/// @nodoc
class __$EndedCopyWithImpl<$Res> extends _$DrawRouteEventCopyWithImpl<$Res>
    implements _$EndedCopyWith<$Res> {
  __$EndedCopyWithImpl(_Ended _value, $Res Function(_Ended) _then)
      : super(_value, (v) => _then(v as _Ended));

  @override
  _Ended get _value => super._value as _Ended;
}

/// @nodoc

class _$_Ended with DiagnosticableTreeMixin implements _Ended {
  const _$_Ended();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'DrawRouteEvent.ended()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties..add(DiagnosticsProperty('type', 'DrawRouteEvent.ended'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _Ended);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() cleared,
    required TResult Function() ended,
    required TResult Function(LatLng point) pointAdded,
    required TResult Function(Route route) routeReplaced,
    required TResult Function(int index, Route route) routeMatched,
    required TResult Function(int index, Route route) elevationFetched,
  }) {
    return ended();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? cleared,
    TResult Function()? ended,
    TResult Function(LatLng point)? pointAdded,
    TResult Function(Route route)? routeReplaced,
    TResult Function(int index, Route route)? routeMatched,
    TResult Function(int index, Route route)? elevationFetched,
    required TResult orElse(),
  }) {
    if (ended != null) {
      return ended();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Cleared value) cleared,
    required TResult Function(_Ended value) ended,
    required TResult Function(_PointAdded value) pointAdded,
    required TResult Function(_RouteReplaced value) routeReplaced,
    required TResult Function(_RouteMatched value) routeMatched,
    required TResult Function(_ElevationFetched value) elevationFetched,
  }) {
    return ended(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Cleared value)? cleared,
    TResult Function(_Ended value)? ended,
    TResult Function(_PointAdded value)? pointAdded,
    TResult Function(_RouteReplaced value)? routeReplaced,
    TResult Function(_RouteMatched value)? routeMatched,
    TResult Function(_ElevationFetched value)? elevationFetched,
    required TResult orElse(),
  }) {
    if (ended != null) {
      return ended(this);
    }
    return orElse();
  }
}

abstract class _Ended implements DrawRouteEvent {
  const factory _Ended() = _$_Ended;
}

/// @nodoc
abstract class _$PointAddedCopyWith<$Res> {
  factory _$PointAddedCopyWith(
          _PointAdded value, $Res Function(_PointAdded) then) =
      __$PointAddedCopyWithImpl<$Res>;
  $Res call({LatLng point});
}

/// @nodoc
class __$PointAddedCopyWithImpl<$Res> extends _$DrawRouteEventCopyWithImpl<$Res>
    implements _$PointAddedCopyWith<$Res> {
  __$PointAddedCopyWithImpl(
      _PointAdded _value, $Res Function(_PointAdded) _then)
      : super(_value, (v) => _then(v as _PointAdded));

  @override
  _PointAdded get _value => super._value as _PointAdded;

  @override
  $Res call({
    Object? point = freezed,
  }) {
    return _then(_PointAdded(
      point == freezed
          ? _value.point
          : point // ignore: cast_nullable_to_non_nullable
              as LatLng,
    ));
  }
}

/// @nodoc

class _$_PointAdded with DiagnosticableTreeMixin implements _PointAdded {
  const _$_PointAdded(this.point);

  @override
  final LatLng point;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'DrawRouteEvent.pointAdded(point: $point)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'DrawRouteEvent.pointAdded'))
      ..add(DiagnosticsProperty('point', point));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _PointAdded &&
            (identical(other.point, point) ||
                const DeepCollectionEquality().equals(other.point, point)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(point);

  @JsonKey(ignore: true)
  @override
  _$PointAddedCopyWith<_PointAdded> get copyWith =>
      __$PointAddedCopyWithImpl<_PointAdded>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() cleared,
    required TResult Function() ended,
    required TResult Function(LatLng point) pointAdded,
    required TResult Function(Route route) routeReplaced,
    required TResult Function(int index, Route route) routeMatched,
    required TResult Function(int index, Route route) elevationFetched,
  }) {
    return pointAdded(point);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? cleared,
    TResult Function()? ended,
    TResult Function(LatLng point)? pointAdded,
    TResult Function(Route route)? routeReplaced,
    TResult Function(int index, Route route)? routeMatched,
    TResult Function(int index, Route route)? elevationFetched,
    required TResult orElse(),
  }) {
    if (pointAdded != null) {
      return pointAdded(point);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Cleared value) cleared,
    required TResult Function(_Ended value) ended,
    required TResult Function(_PointAdded value) pointAdded,
    required TResult Function(_RouteReplaced value) routeReplaced,
    required TResult Function(_RouteMatched value) routeMatched,
    required TResult Function(_ElevationFetched value) elevationFetched,
  }) {
    return pointAdded(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Cleared value)? cleared,
    TResult Function(_Ended value)? ended,
    TResult Function(_PointAdded value)? pointAdded,
    TResult Function(_RouteReplaced value)? routeReplaced,
    TResult Function(_RouteMatched value)? routeMatched,
    TResult Function(_ElevationFetched value)? elevationFetched,
    required TResult orElse(),
  }) {
    if (pointAdded != null) {
      return pointAdded(this);
    }
    return orElse();
  }
}

abstract class _PointAdded implements DrawRouteEvent {
  const factory _PointAdded(LatLng point) = _$_PointAdded;

  LatLng get point => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$PointAddedCopyWith<_PointAdded> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$RouteReplacedCopyWith<$Res> {
  factory _$RouteReplacedCopyWith(
          _RouteReplaced value, $Res Function(_RouteReplaced) then) =
      __$RouteReplacedCopyWithImpl<$Res>;
  $Res call({Route route});
}

/// @nodoc
class __$RouteReplacedCopyWithImpl<$Res>
    extends _$DrawRouteEventCopyWithImpl<$Res>
    implements _$RouteReplacedCopyWith<$Res> {
  __$RouteReplacedCopyWithImpl(
      _RouteReplaced _value, $Res Function(_RouteReplaced) _then)
      : super(_value, (v) => _then(v as _RouteReplaced));

  @override
  _RouteReplaced get _value => super._value as _RouteReplaced;

  @override
  $Res call({
    Object? route = freezed,
  }) {
    return _then(_RouteReplaced(
      route == freezed
          ? _value.route
          : route // ignore: cast_nullable_to_non_nullable
              as Route,
    ));
  }
}

/// @nodoc

class _$_RouteReplaced with DiagnosticableTreeMixin implements _RouteReplaced {
  const _$_RouteReplaced(this.route);

  @override
  final Route route;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'DrawRouteEvent.routeReplaced(route: $route)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'DrawRouteEvent.routeReplaced'))
      ..add(DiagnosticsProperty('route', route));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _RouteReplaced &&
            (identical(other.route, route) ||
                const DeepCollectionEquality().equals(other.route, route)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(route);

  @JsonKey(ignore: true)
  @override
  _$RouteReplacedCopyWith<_RouteReplaced> get copyWith =>
      __$RouteReplacedCopyWithImpl<_RouteReplaced>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() cleared,
    required TResult Function() ended,
    required TResult Function(LatLng point) pointAdded,
    required TResult Function(Route route) routeReplaced,
    required TResult Function(int index, Route route) routeMatched,
    required TResult Function(int index, Route route) elevationFetched,
  }) {
    return routeReplaced(route);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? cleared,
    TResult Function()? ended,
    TResult Function(LatLng point)? pointAdded,
    TResult Function(Route route)? routeReplaced,
    TResult Function(int index, Route route)? routeMatched,
    TResult Function(int index, Route route)? elevationFetched,
    required TResult orElse(),
  }) {
    if (routeReplaced != null) {
      return routeReplaced(route);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Cleared value) cleared,
    required TResult Function(_Ended value) ended,
    required TResult Function(_PointAdded value) pointAdded,
    required TResult Function(_RouteReplaced value) routeReplaced,
    required TResult Function(_RouteMatched value) routeMatched,
    required TResult Function(_ElevationFetched value) elevationFetched,
  }) {
    return routeReplaced(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Cleared value)? cleared,
    TResult Function(_Ended value)? ended,
    TResult Function(_PointAdded value)? pointAdded,
    TResult Function(_RouteReplaced value)? routeReplaced,
    TResult Function(_RouteMatched value)? routeMatched,
    TResult Function(_ElevationFetched value)? elevationFetched,
    required TResult orElse(),
  }) {
    if (routeReplaced != null) {
      return routeReplaced(this);
    }
    return orElse();
  }
}

abstract class _RouteReplaced implements DrawRouteEvent {
  const factory _RouteReplaced(Route route) = _$_RouteReplaced;

  Route get route => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$RouteReplacedCopyWith<_RouteReplaced> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$RouteMatchedCopyWith<$Res> {
  factory _$RouteMatchedCopyWith(
          _RouteMatched value, $Res Function(_RouteMatched) then) =
      __$RouteMatchedCopyWithImpl<$Res>;
  $Res call({int index, Route route});
}

/// @nodoc
class __$RouteMatchedCopyWithImpl<$Res>
    extends _$DrawRouteEventCopyWithImpl<$Res>
    implements _$RouteMatchedCopyWith<$Res> {
  __$RouteMatchedCopyWithImpl(
      _RouteMatched _value, $Res Function(_RouteMatched) _then)
      : super(_value, (v) => _then(v as _RouteMatched));

  @override
  _RouteMatched get _value => super._value as _RouteMatched;

  @override
  $Res call({
    Object? index = freezed,
    Object? route = freezed,
  }) {
    return _then(_RouteMatched(
      index == freezed
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
      route == freezed
          ? _value.route
          : route // ignore: cast_nullable_to_non_nullable
              as Route,
    ));
  }
}

/// @nodoc

@visibleForTesting
class _$_RouteMatched with DiagnosticableTreeMixin implements _RouteMatched {
  const _$_RouteMatched(this.index, this.route);

  @override
  final int index;
  @override
  final Route route;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'DrawRouteEvent.routeMatched(index: $index, route: $route)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'DrawRouteEvent.routeMatched'))
      ..add(DiagnosticsProperty('index', index))
      ..add(DiagnosticsProperty('route', route));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _RouteMatched &&
            (identical(other.index, index) ||
                const DeepCollectionEquality().equals(other.index, index)) &&
            (identical(other.route, route) ||
                const DeepCollectionEquality().equals(other.route, route)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(index) ^
      const DeepCollectionEquality().hash(route);

  @JsonKey(ignore: true)
  @override
  _$RouteMatchedCopyWith<_RouteMatched> get copyWith =>
      __$RouteMatchedCopyWithImpl<_RouteMatched>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() cleared,
    required TResult Function() ended,
    required TResult Function(LatLng point) pointAdded,
    required TResult Function(Route route) routeReplaced,
    required TResult Function(int index, Route route) routeMatched,
    required TResult Function(int index, Route route) elevationFetched,
  }) {
    return routeMatched(index, route);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? cleared,
    TResult Function()? ended,
    TResult Function(LatLng point)? pointAdded,
    TResult Function(Route route)? routeReplaced,
    TResult Function(int index, Route route)? routeMatched,
    TResult Function(int index, Route route)? elevationFetched,
    required TResult orElse(),
  }) {
    if (routeMatched != null) {
      return routeMatched(index, route);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Cleared value) cleared,
    required TResult Function(_Ended value) ended,
    required TResult Function(_PointAdded value) pointAdded,
    required TResult Function(_RouteReplaced value) routeReplaced,
    required TResult Function(_RouteMatched value) routeMatched,
    required TResult Function(_ElevationFetched value) elevationFetched,
  }) {
    return routeMatched(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Cleared value)? cleared,
    TResult Function(_Ended value)? ended,
    TResult Function(_PointAdded value)? pointAdded,
    TResult Function(_RouteReplaced value)? routeReplaced,
    TResult Function(_RouteMatched value)? routeMatched,
    TResult Function(_ElevationFetched value)? elevationFetched,
    required TResult orElse(),
  }) {
    if (routeMatched != null) {
      return routeMatched(this);
    }
    return orElse();
  }
}

abstract class _RouteMatched implements DrawRouteEvent {
  const factory _RouteMatched(int index, Route route) = _$_RouteMatched;

  int get index => throw _privateConstructorUsedError;
  Route get route => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$RouteMatchedCopyWith<_RouteMatched> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$ElevationFetchedCopyWith<$Res> {
  factory _$ElevationFetchedCopyWith(
          _ElevationFetched value, $Res Function(_ElevationFetched) then) =
      __$ElevationFetchedCopyWithImpl<$Res>;
  $Res call({int index, Route route});
}

/// @nodoc
class __$ElevationFetchedCopyWithImpl<$Res>
    extends _$DrawRouteEventCopyWithImpl<$Res>
    implements _$ElevationFetchedCopyWith<$Res> {
  __$ElevationFetchedCopyWithImpl(
      _ElevationFetched _value, $Res Function(_ElevationFetched) _then)
      : super(_value, (v) => _then(v as _ElevationFetched));

  @override
  _ElevationFetched get _value => super._value as _ElevationFetched;

  @override
  $Res call({
    Object? index = freezed,
    Object? route = freezed,
  }) {
    return _then(_ElevationFetched(
      index == freezed
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
      route == freezed
          ? _value.route
          : route // ignore: cast_nullable_to_non_nullable
              as Route,
    ));
  }
}

/// @nodoc

@visibleForTesting
class _$_ElevationFetched
    with DiagnosticableTreeMixin
    implements _ElevationFetched {
  const _$_ElevationFetched(this.index, this.route);

  @override
  final int index;
  @override
  final Route route;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'DrawRouteEvent.elevationFetched(index: $index, route: $route)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'DrawRouteEvent.elevationFetched'))
      ..add(DiagnosticsProperty('index', index))
      ..add(DiagnosticsProperty('route', route));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ElevationFetched &&
            (identical(other.index, index) ||
                const DeepCollectionEquality().equals(other.index, index)) &&
            (identical(other.route, route) ||
                const DeepCollectionEquality().equals(other.route, route)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(index) ^
      const DeepCollectionEquality().hash(route);

  @JsonKey(ignore: true)
  @override
  _$ElevationFetchedCopyWith<_ElevationFetched> get copyWith =>
      __$ElevationFetchedCopyWithImpl<_ElevationFetched>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() cleared,
    required TResult Function() ended,
    required TResult Function(LatLng point) pointAdded,
    required TResult Function(Route route) routeReplaced,
    required TResult Function(int index, Route route) routeMatched,
    required TResult Function(int index, Route route) elevationFetched,
  }) {
    return elevationFetched(index, route);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? cleared,
    TResult Function()? ended,
    TResult Function(LatLng point)? pointAdded,
    TResult Function(Route route)? routeReplaced,
    TResult Function(int index, Route route)? routeMatched,
    TResult Function(int index, Route route)? elevationFetched,
    required TResult orElse(),
  }) {
    if (elevationFetched != null) {
      return elevationFetched(index, route);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Cleared value) cleared,
    required TResult Function(_Ended value) ended,
    required TResult Function(_PointAdded value) pointAdded,
    required TResult Function(_RouteReplaced value) routeReplaced,
    required TResult Function(_RouteMatched value) routeMatched,
    required TResult Function(_ElevationFetched value) elevationFetched,
  }) {
    return elevationFetched(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Cleared value)? cleared,
    TResult Function(_Ended value)? ended,
    TResult Function(_PointAdded value)? pointAdded,
    TResult Function(_RouteReplaced value)? routeReplaced,
    TResult Function(_RouteMatched value)? routeMatched,
    TResult Function(_ElevationFetched value)? elevationFetched,
    required TResult orElse(),
  }) {
    if (elevationFetched != null) {
      return elevationFetched(this);
    }
    return orElse();
  }
}

abstract class _ElevationFetched implements DrawRouteEvent {
  const factory _ElevationFetched(int index, Route route) = _$_ElevationFetched;

  int get index => throw _privateConstructorUsedError;
  Route get route => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$ElevationFetchedCopyWith<_ElevationFetched> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
class _$DrawRouteStateTearOff {
  const _$DrawRouteStateTearOff();

  _DrawRouteState call(
      {@visibleForTesting List<Route> routes = const [],
      @visibleForTesting Route routeInProgress = const Route()}) {
    return _DrawRouteState(
      routes: routes,
      routeInProgress: routeInProgress,
    );
  }
}

/// @nodoc
const $DrawRouteState = _$DrawRouteStateTearOff();

/// @nodoc
mixin _$DrawRouteState {
  @visibleForTesting
  List<Route> get routes => throw _privateConstructorUsedError;
  @visibleForTesting
  Route get routeInProgress => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DrawRouteStateCopyWith<DrawRouteState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DrawRouteStateCopyWith<$Res> {
  factory $DrawRouteStateCopyWith(
          DrawRouteState value, $Res Function(DrawRouteState) then) =
      _$DrawRouteStateCopyWithImpl<$Res>;
  $Res call(
      {@visibleForTesting List<Route> routes,
      @visibleForTesting Route routeInProgress});
}

/// @nodoc
class _$DrawRouteStateCopyWithImpl<$Res>
    implements $DrawRouteStateCopyWith<$Res> {
  _$DrawRouteStateCopyWithImpl(this._value, this._then);

  final DrawRouteState _value;
  // ignore: unused_field
  final $Res Function(DrawRouteState) _then;

  @override
  $Res call({
    Object? routes = freezed,
    Object? routeInProgress = freezed,
  }) {
    return _then(_value.copyWith(
      routes: routes == freezed
          ? _value.routes
          : routes // ignore: cast_nullable_to_non_nullable
              as List<Route>,
      routeInProgress: routeInProgress == freezed
          ? _value.routeInProgress
          : routeInProgress // ignore: cast_nullable_to_non_nullable
              as Route,
    ));
  }
}

/// @nodoc
abstract class _$DrawRouteStateCopyWith<$Res>
    implements $DrawRouteStateCopyWith<$Res> {
  factory _$DrawRouteStateCopyWith(
          _DrawRouteState value, $Res Function(_DrawRouteState) then) =
      __$DrawRouteStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {@visibleForTesting List<Route> routes,
      @visibleForTesting Route routeInProgress});
}

/// @nodoc
class __$DrawRouteStateCopyWithImpl<$Res>
    extends _$DrawRouteStateCopyWithImpl<$Res>
    implements _$DrawRouteStateCopyWith<$Res> {
  __$DrawRouteStateCopyWithImpl(
      _DrawRouteState _value, $Res Function(_DrawRouteState) _then)
      : super(_value, (v) => _then(v as _DrawRouteState));

  @override
  _DrawRouteState get _value => super._value as _DrawRouteState;

  @override
  $Res call({
    Object? routes = freezed,
    Object? routeInProgress = freezed,
  }) {
    return _then(_DrawRouteState(
      routes: routes == freezed
          ? _value.routes
          : routes // ignore: cast_nullable_to_non_nullable
              as List<Route>,
      routeInProgress: routeInProgress == freezed
          ? _value.routeInProgress
          : routeInProgress // ignore: cast_nullable_to_non_nullable
              as Route,
    ));
  }
}

/// @nodoc

class _$_DrawRouteState extends _DrawRouteState with DiagnosticableTreeMixin {
  _$_DrawRouteState(
      {@visibleForTesting this.routes = const [],
      @visibleForTesting this.routeInProgress = const Route()})
      : super._();

  @JsonKey(defaultValue: const [])
  @override
  @visibleForTesting
  final List<Route> routes;
  @JsonKey(defaultValue: const Route())
  @override
  @visibleForTesting
  final Route routeInProgress;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'DrawRouteState(routes: $routes, routeInProgress: $routeInProgress)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'DrawRouteState'))
      ..add(DiagnosticsProperty('routes', routes))
      ..add(DiagnosticsProperty('routeInProgress', routeInProgress));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _DrawRouteState &&
            (identical(other.routes, routes) ||
                const DeepCollectionEquality().equals(other.routes, routes)) &&
            (identical(other.routeInProgress, routeInProgress) ||
                const DeepCollectionEquality()
                    .equals(other.routeInProgress, routeInProgress)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(routes) ^
      const DeepCollectionEquality().hash(routeInProgress);

  @JsonKey(ignore: true)
  @override
  _$DrawRouteStateCopyWith<_DrawRouteState> get copyWith =>
      __$DrawRouteStateCopyWithImpl<_DrawRouteState>(this, _$identity);
}

abstract class _DrawRouteState extends DrawRouteState {
  factory _DrawRouteState(
      {@visibleForTesting List<Route> routes,
      @visibleForTesting Route routeInProgress}) = _$_DrawRouteState;
  _DrawRouteState._() : super._();

  @override
  @visibleForTesting
  List<Route> get routes => throw _privateConstructorUsedError;
  @override
  @visibleForTesting
  Route get routeInProgress => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$DrawRouteStateCopyWith<_DrawRouteState> get copyWith =>
      throw _privateConstructorUsedError;
}
