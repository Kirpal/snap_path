// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'share_and_save_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$ShareAndSaveEventTearOff {
  const _$ShareAndSaveEventTearOff();

  _Started started() {
    return const _Started();
  }

  _RoutesUpdated routesUpdated(List<Route> routes) {
    return _RoutesUpdated(
      routes,
    );
  }

  _RouteSaved routeSaved(Route route) {
    return _RouteSaved(
      route,
    );
  }

  _RouteDeleted routeDeleted(Route route) {
    return _RouteDeleted(
      route,
    );
  }
}

/// @nodoc
const $ShareAndSaveEvent = _$ShareAndSaveEventTearOff();

/// @nodoc
mixin _$ShareAndSaveEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(List<Route> routes) routesUpdated,
    required TResult Function(Route route) routeSaved,
    required TResult Function(Route route) routeDeleted,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(List<Route> routes)? routesUpdated,
    TResult Function(Route route)? routeSaved,
    TResult Function(Route route)? routeDeleted,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_RoutesUpdated value) routesUpdated,
    required TResult Function(_RouteSaved value) routeSaved,
    required TResult Function(_RouteDeleted value) routeDeleted,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_RoutesUpdated value)? routesUpdated,
    TResult Function(_RouteSaved value)? routeSaved,
    TResult Function(_RouteDeleted value)? routeDeleted,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShareAndSaveEventCopyWith<$Res> {
  factory $ShareAndSaveEventCopyWith(
          ShareAndSaveEvent value, $Res Function(ShareAndSaveEvent) then) =
      _$ShareAndSaveEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$ShareAndSaveEventCopyWithImpl<$Res>
    implements $ShareAndSaveEventCopyWith<$Res> {
  _$ShareAndSaveEventCopyWithImpl(this._value, this._then);

  final ShareAndSaveEvent _value;
  // ignore: unused_field
  final $Res Function(ShareAndSaveEvent) _then;
}

/// @nodoc
abstract class _$StartedCopyWith<$Res> {
  factory _$StartedCopyWith(_Started value, $Res Function(_Started) then) =
      __$StartedCopyWithImpl<$Res>;
}

/// @nodoc
class __$StartedCopyWithImpl<$Res> extends _$ShareAndSaveEventCopyWithImpl<$Res>
    implements _$StartedCopyWith<$Res> {
  __$StartedCopyWithImpl(_Started _value, $Res Function(_Started) _then)
      : super(_value, (v) => _then(v as _Started));

  @override
  _Started get _value => super._value as _Started;
}

/// @nodoc

class _$_Started with DiagnosticableTreeMixin implements _Started {
  const _$_Started();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ShareAndSaveEvent.started()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties..add(DiagnosticsProperty('type', 'ShareAndSaveEvent.started'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _Started);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(List<Route> routes) routesUpdated,
    required TResult Function(Route route) routeSaved,
    required TResult Function(Route route) routeDeleted,
  }) {
    return started();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(List<Route> routes)? routesUpdated,
    TResult Function(Route route)? routeSaved,
    TResult Function(Route route)? routeDeleted,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_RoutesUpdated value) routesUpdated,
    required TResult Function(_RouteSaved value) routeSaved,
    required TResult Function(_RouteDeleted value) routeDeleted,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_RoutesUpdated value)? routesUpdated,
    TResult Function(_RouteSaved value)? routeSaved,
    TResult Function(_RouteDeleted value)? routeDeleted,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class _Started implements ShareAndSaveEvent {
  const factory _Started() = _$_Started;
}

/// @nodoc
abstract class _$RoutesUpdatedCopyWith<$Res> {
  factory _$RoutesUpdatedCopyWith(
          _RoutesUpdated value, $Res Function(_RoutesUpdated) then) =
      __$RoutesUpdatedCopyWithImpl<$Res>;
  $Res call({List<Route> routes});
}

/// @nodoc
class __$RoutesUpdatedCopyWithImpl<$Res>
    extends _$ShareAndSaveEventCopyWithImpl<$Res>
    implements _$RoutesUpdatedCopyWith<$Res> {
  __$RoutesUpdatedCopyWithImpl(
      _RoutesUpdated _value, $Res Function(_RoutesUpdated) _then)
      : super(_value, (v) => _then(v as _RoutesUpdated));

  @override
  _RoutesUpdated get _value => super._value as _RoutesUpdated;

  @override
  $Res call({
    Object? routes = freezed,
  }) {
    return _then(_RoutesUpdated(
      routes == freezed
          ? _value.routes
          : routes // ignore: cast_nullable_to_non_nullable
              as List<Route>,
    ));
  }
}

/// @nodoc

class _$_RoutesUpdated with DiagnosticableTreeMixin implements _RoutesUpdated {
  const _$_RoutesUpdated(this.routes);

  @override
  final List<Route> routes;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ShareAndSaveEvent.routesUpdated(routes: $routes)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ShareAndSaveEvent.routesUpdated'))
      ..add(DiagnosticsProperty('routes', routes));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _RoutesUpdated &&
            (identical(other.routes, routes) ||
                const DeepCollectionEquality().equals(other.routes, routes)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(routes);

  @JsonKey(ignore: true)
  @override
  _$RoutesUpdatedCopyWith<_RoutesUpdated> get copyWith =>
      __$RoutesUpdatedCopyWithImpl<_RoutesUpdated>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(List<Route> routes) routesUpdated,
    required TResult Function(Route route) routeSaved,
    required TResult Function(Route route) routeDeleted,
  }) {
    return routesUpdated(routes);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(List<Route> routes)? routesUpdated,
    TResult Function(Route route)? routeSaved,
    TResult Function(Route route)? routeDeleted,
    required TResult orElse(),
  }) {
    if (routesUpdated != null) {
      return routesUpdated(routes);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_RoutesUpdated value) routesUpdated,
    required TResult Function(_RouteSaved value) routeSaved,
    required TResult Function(_RouteDeleted value) routeDeleted,
  }) {
    return routesUpdated(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_RoutesUpdated value)? routesUpdated,
    TResult Function(_RouteSaved value)? routeSaved,
    TResult Function(_RouteDeleted value)? routeDeleted,
    required TResult orElse(),
  }) {
    if (routesUpdated != null) {
      return routesUpdated(this);
    }
    return orElse();
  }
}

abstract class _RoutesUpdated implements ShareAndSaveEvent {
  const factory _RoutesUpdated(List<Route> routes) = _$_RoutesUpdated;

  List<Route> get routes => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$RoutesUpdatedCopyWith<_RoutesUpdated> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$RouteSavedCopyWith<$Res> {
  factory _$RouteSavedCopyWith(
          _RouteSaved value, $Res Function(_RouteSaved) then) =
      __$RouteSavedCopyWithImpl<$Res>;
  $Res call({Route route});
}

/// @nodoc
class __$RouteSavedCopyWithImpl<$Res>
    extends _$ShareAndSaveEventCopyWithImpl<$Res>
    implements _$RouteSavedCopyWith<$Res> {
  __$RouteSavedCopyWithImpl(
      _RouteSaved _value, $Res Function(_RouteSaved) _then)
      : super(_value, (v) => _then(v as _RouteSaved));

  @override
  _RouteSaved get _value => super._value as _RouteSaved;

  @override
  $Res call({
    Object? route = freezed,
  }) {
    return _then(_RouteSaved(
      route == freezed
          ? _value.route
          : route // ignore: cast_nullable_to_non_nullable
              as Route,
    ));
  }
}

/// @nodoc

class _$_RouteSaved with DiagnosticableTreeMixin implements _RouteSaved {
  const _$_RouteSaved(this.route);

  @override
  final Route route;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ShareAndSaveEvent.routeSaved(route: $route)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ShareAndSaveEvent.routeSaved'))
      ..add(DiagnosticsProperty('route', route));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _RouteSaved &&
            (identical(other.route, route) ||
                const DeepCollectionEquality().equals(other.route, route)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(route);

  @JsonKey(ignore: true)
  @override
  _$RouteSavedCopyWith<_RouteSaved> get copyWith =>
      __$RouteSavedCopyWithImpl<_RouteSaved>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(List<Route> routes) routesUpdated,
    required TResult Function(Route route) routeSaved,
    required TResult Function(Route route) routeDeleted,
  }) {
    return routeSaved(route);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(List<Route> routes)? routesUpdated,
    TResult Function(Route route)? routeSaved,
    TResult Function(Route route)? routeDeleted,
    required TResult orElse(),
  }) {
    if (routeSaved != null) {
      return routeSaved(route);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_RoutesUpdated value) routesUpdated,
    required TResult Function(_RouteSaved value) routeSaved,
    required TResult Function(_RouteDeleted value) routeDeleted,
  }) {
    return routeSaved(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_RoutesUpdated value)? routesUpdated,
    TResult Function(_RouteSaved value)? routeSaved,
    TResult Function(_RouteDeleted value)? routeDeleted,
    required TResult orElse(),
  }) {
    if (routeSaved != null) {
      return routeSaved(this);
    }
    return orElse();
  }
}

abstract class _RouteSaved implements ShareAndSaveEvent {
  const factory _RouteSaved(Route route) = _$_RouteSaved;

  Route get route => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$RouteSavedCopyWith<_RouteSaved> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$RouteDeletedCopyWith<$Res> {
  factory _$RouteDeletedCopyWith(
          _RouteDeleted value, $Res Function(_RouteDeleted) then) =
      __$RouteDeletedCopyWithImpl<$Res>;
  $Res call({Route route});
}

/// @nodoc
class __$RouteDeletedCopyWithImpl<$Res>
    extends _$ShareAndSaveEventCopyWithImpl<$Res>
    implements _$RouteDeletedCopyWith<$Res> {
  __$RouteDeletedCopyWithImpl(
      _RouteDeleted _value, $Res Function(_RouteDeleted) _then)
      : super(_value, (v) => _then(v as _RouteDeleted));

  @override
  _RouteDeleted get _value => super._value as _RouteDeleted;

  @override
  $Res call({
    Object? route = freezed,
  }) {
    return _then(_RouteDeleted(
      route == freezed
          ? _value.route
          : route // ignore: cast_nullable_to_non_nullable
              as Route,
    ));
  }
}

/// @nodoc

class _$_RouteDeleted with DiagnosticableTreeMixin implements _RouteDeleted {
  const _$_RouteDeleted(this.route);

  @override
  final Route route;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ShareAndSaveEvent.routeDeleted(route: $route)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ShareAndSaveEvent.routeDeleted'))
      ..add(DiagnosticsProperty('route', route));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _RouteDeleted &&
            (identical(other.route, route) ||
                const DeepCollectionEquality().equals(other.route, route)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(route);

  @JsonKey(ignore: true)
  @override
  _$RouteDeletedCopyWith<_RouteDeleted> get copyWith =>
      __$RouteDeletedCopyWithImpl<_RouteDeleted>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(List<Route> routes) routesUpdated,
    required TResult Function(Route route) routeSaved,
    required TResult Function(Route route) routeDeleted,
  }) {
    return routeDeleted(route);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(List<Route> routes)? routesUpdated,
    TResult Function(Route route)? routeSaved,
    TResult Function(Route route)? routeDeleted,
    required TResult orElse(),
  }) {
    if (routeDeleted != null) {
      return routeDeleted(route);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_RoutesUpdated value) routesUpdated,
    required TResult Function(_RouteSaved value) routeSaved,
    required TResult Function(_RouteDeleted value) routeDeleted,
  }) {
    return routeDeleted(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_RoutesUpdated value)? routesUpdated,
    TResult Function(_RouteSaved value)? routeSaved,
    TResult Function(_RouteDeleted value)? routeDeleted,
    required TResult orElse(),
  }) {
    if (routeDeleted != null) {
      return routeDeleted(this);
    }
    return orElse();
  }
}

abstract class _RouteDeleted implements ShareAndSaveEvent {
  const factory _RouteDeleted(Route route) = _$_RouteDeleted;

  Route get route => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$RouteDeletedCopyWith<_RouteDeleted> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
class _$ShareAndSaveStateTearOff {
  const _$ShareAndSaveStateTearOff();

  _Loading loading() {
    return const _Loading();
  }

  _Loaded loaded({required List<Route> savedRoutes}) {
    return _Loaded(
      savedRoutes: savedRoutes,
    );
  }
}

/// @nodoc
const $ShareAndSaveState = _$ShareAndSaveStateTearOff();

/// @nodoc
mixin _$ShareAndSaveState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(List<Route> savedRoutes) loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<Route> savedRoutes)? loaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShareAndSaveStateCopyWith<$Res> {
  factory $ShareAndSaveStateCopyWith(
          ShareAndSaveState value, $Res Function(ShareAndSaveState) then) =
      _$ShareAndSaveStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$ShareAndSaveStateCopyWithImpl<$Res>
    implements $ShareAndSaveStateCopyWith<$Res> {
  _$ShareAndSaveStateCopyWithImpl(this._value, this._then);

  final ShareAndSaveState _value;
  // ignore: unused_field
  final $Res Function(ShareAndSaveState) _then;
}

/// @nodoc
abstract class _$LoadingCopyWith<$Res> {
  factory _$LoadingCopyWith(_Loading value, $Res Function(_Loading) then) =
      __$LoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$LoadingCopyWithImpl<$Res> extends _$ShareAndSaveStateCopyWithImpl<$Res>
    implements _$LoadingCopyWith<$Res> {
  __$LoadingCopyWithImpl(_Loading _value, $Res Function(_Loading) _then)
      : super(_value, (v) => _then(v as _Loading));

  @override
  _Loading get _value => super._value as _Loading;
}

/// @nodoc

class _$_Loading with DiagnosticableTreeMixin implements _Loading {
  const _$_Loading();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ShareAndSaveState.loading()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties..add(DiagnosticsProperty('type', 'ShareAndSaveState.loading'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _Loading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(List<Route> savedRoutes) loaded,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<Route> savedRoutes)? loaded,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements ShareAndSaveState {
  const factory _Loading() = _$_Loading;
}

/// @nodoc
abstract class _$LoadedCopyWith<$Res> {
  factory _$LoadedCopyWith(_Loaded value, $Res Function(_Loaded) then) =
      __$LoadedCopyWithImpl<$Res>;
  $Res call({List<Route> savedRoutes});
}

/// @nodoc
class __$LoadedCopyWithImpl<$Res> extends _$ShareAndSaveStateCopyWithImpl<$Res>
    implements _$LoadedCopyWith<$Res> {
  __$LoadedCopyWithImpl(_Loaded _value, $Res Function(_Loaded) _then)
      : super(_value, (v) => _then(v as _Loaded));

  @override
  _Loaded get _value => super._value as _Loaded;

  @override
  $Res call({
    Object? savedRoutes = freezed,
  }) {
    return _then(_Loaded(
      savedRoutes: savedRoutes == freezed
          ? _value.savedRoutes
          : savedRoutes // ignore: cast_nullable_to_non_nullable
              as List<Route>,
    ));
  }
}

/// @nodoc

class _$_Loaded with DiagnosticableTreeMixin implements _Loaded {
  const _$_Loaded({required this.savedRoutes});

  @override
  final List<Route> savedRoutes;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ShareAndSaveState.loaded(savedRoutes: $savedRoutes)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ShareAndSaveState.loaded'))
      ..add(DiagnosticsProperty('savedRoutes', savedRoutes));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Loaded &&
            (identical(other.savedRoutes, savedRoutes) ||
                const DeepCollectionEquality()
                    .equals(other.savedRoutes, savedRoutes)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(savedRoutes);

  @JsonKey(ignore: true)
  @override
  _$LoadedCopyWith<_Loaded> get copyWith =>
      __$LoadedCopyWithImpl<_Loaded>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(List<Route> savedRoutes) loaded,
  }) {
    return loaded(savedRoutes);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<Route> savedRoutes)? loaded,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(savedRoutes);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class _Loaded implements ShareAndSaveState {
  const factory _Loaded({required List<Route> savedRoutes}) = _$_Loaded;

  List<Route> get savedRoutes => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$LoadedCopyWith<_Loaded> get copyWith => throw _privateConstructorUsedError;
}
