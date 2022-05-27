// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'map_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$MapEventTearOff {
  const _$MapEventTearOff();

  _Started started() {
    return const _Started();
  }

  _ControlsToggled controlsToggled([bool? show]) {
    return _ControlsToggled(
      show,
    );
  }

  _UserLocationUpdated userLocationUpdated(UserLocation location) {
    return _UserLocationUpdated(
      location,
    );
  }

  _UserLocationFocused userLocationFocused() {
    return const _UserLocationFocused();
  }

  _UserLocationUnfocused userLocationUnfocused() {
    return const _UserLocationUnfocused();
  }

  _SearchResultSelected searchResultSelected(SearchResult searchResult) {
    return _SearchResultSelected(
      searchResult,
    );
  }

  _SearchResultUnselected searchResultUnselected() {
    return const _SearchResultUnselected();
  }

  _PointHighlighted pointHighlighted(RoutePoint point) {
    return _PointHighlighted(
      point,
    );
  }

  _PointUnhighlighted pointUnhighlighted() {
    return const _PointUnhighlighted();
  }
}

/// @nodoc
const $MapEvent = _$MapEventTearOff();

/// @nodoc
mixin _$MapEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(bool? show) controlsToggled,
    required TResult Function(UserLocation location) userLocationUpdated,
    required TResult Function() userLocationFocused,
    required TResult Function() userLocationUnfocused,
    required TResult Function(SearchResult searchResult) searchResultSelected,
    required TResult Function() searchResultUnselected,
    required TResult Function(RoutePoint point) pointHighlighted,
    required TResult Function() pointUnhighlighted,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(bool? show)? controlsToggled,
    TResult Function(UserLocation location)? userLocationUpdated,
    TResult Function()? userLocationFocused,
    TResult Function()? userLocationUnfocused,
    TResult Function(SearchResult searchResult)? searchResultSelected,
    TResult Function()? searchResultUnselected,
    TResult Function(RoutePoint point)? pointHighlighted,
    TResult Function()? pointUnhighlighted,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_ControlsToggled value) controlsToggled,
    required TResult Function(_UserLocationUpdated value) userLocationUpdated,
    required TResult Function(_UserLocationFocused value) userLocationFocused,
    required TResult Function(_UserLocationUnfocused value)
        userLocationUnfocused,
    required TResult Function(_SearchResultSelected value) searchResultSelected,
    required TResult Function(_SearchResultUnselected value)
        searchResultUnselected,
    required TResult Function(_PointHighlighted value) pointHighlighted,
    required TResult Function(_PointUnhighlighted value) pointUnhighlighted,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_ControlsToggled value)? controlsToggled,
    TResult Function(_UserLocationUpdated value)? userLocationUpdated,
    TResult Function(_UserLocationFocused value)? userLocationFocused,
    TResult Function(_UserLocationUnfocused value)? userLocationUnfocused,
    TResult Function(_SearchResultSelected value)? searchResultSelected,
    TResult Function(_SearchResultUnselected value)? searchResultUnselected,
    TResult Function(_PointHighlighted value)? pointHighlighted,
    TResult Function(_PointUnhighlighted value)? pointUnhighlighted,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MapEventCopyWith<$Res> {
  factory $MapEventCopyWith(MapEvent value, $Res Function(MapEvent) then) =
      _$MapEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$MapEventCopyWithImpl<$Res> implements $MapEventCopyWith<$Res> {
  _$MapEventCopyWithImpl(this._value, this._then);

  final MapEvent _value;
  // ignore: unused_field
  final $Res Function(MapEvent) _then;
}

/// @nodoc
abstract class _$StartedCopyWith<$Res> {
  factory _$StartedCopyWith(_Started value, $Res Function(_Started) then) =
      __$StartedCopyWithImpl<$Res>;
}

/// @nodoc
class __$StartedCopyWithImpl<$Res> extends _$MapEventCopyWithImpl<$Res>
    implements _$StartedCopyWith<$Res> {
  __$StartedCopyWithImpl(_Started _value, $Res Function(_Started) _then)
      : super(_value, (v) => _then(v as _Started));

  @override
  _Started get _value => super._value as _Started;
}

/// @nodoc

class _$_Started implements _Started {
  const _$_Started();

  @override
  String toString() {
    return 'MapEvent.started()';
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
    required TResult Function(bool? show) controlsToggled,
    required TResult Function(UserLocation location) userLocationUpdated,
    required TResult Function() userLocationFocused,
    required TResult Function() userLocationUnfocused,
    required TResult Function(SearchResult searchResult) searchResultSelected,
    required TResult Function() searchResultUnselected,
    required TResult Function(RoutePoint point) pointHighlighted,
    required TResult Function() pointUnhighlighted,
  }) {
    return started();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(bool? show)? controlsToggled,
    TResult Function(UserLocation location)? userLocationUpdated,
    TResult Function()? userLocationFocused,
    TResult Function()? userLocationUnfocused,
    TResult Function(SearchResult searchResult)? searchResultSelected,
    TResult Function()? searchResultUnselected,
    TResult Function(RoutePoint point)? pointHighlighted,
    TResult Function()? pointUnhighlighted,
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
    required TResult Function(_ControlsToggled value) controlsToggled,
    required TResult Function(_UserLocationUpdated value) userLocationUpdated,
    required TResult Function(_UserLocationFocused value) userLocationFocused,
    required TResult Function(_UserLocationUnfocused value)
        userLocationUnfocused,
    required TResult Function(_SearchResultSelected value) searchResultSelected,
    required TResult Function(_SearchResultUnselected value)
        searchResultUnselected,
    required TResult Function(_PointHighlighted value) pointHighlighted,
    required TResult Function(_PointUnhighlighted value) pointUnhighlighted,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_ControlsToggled value)? controlsToggled,
    TResult Function(_UserLocationUpdated value)? userLocationUpdated,
    TResult Function(_UserLocationFocused value)? userLocationFocused,
    TResult Function(_UserLocationUnfocused value)? userLocationUnfocused,
    TResult Function(_SearchResultSelected value)? searchResultSelected,
    TResult Function(_SearchResultUnselected value)? searchResultUnselected,
    TResult Function(_PointHighlighted value)? pointHighlighted,
    TResult Function(_PointUnhighlighted value)? pointUnhighlighted,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class _Started implements MapEvent {
  const factory _Started() = _$_Started;
}

/// @nodoc
abstract class _$ControlsToggledCopyWith<$Res> {
  factory _$ControlsToggledCopyWith(
          _ControlsToggled value, $Res Function(_ControlsToggled) then) =
      __$ControlsToggledCopyWithImpl<$Res>;
  $Res call({bool? show});
}

/// @nodoc
class __$ControlsToggledCopyWithImpl<$Res> extends _$MapEventCopyWithImpl<$Res>
    implements _$ControlsToggledCopyWith<$Res> {
  __$ControlsToggledCopyWithImpl(
      _ControlsToggled _value, $Res Function(_ControlsToggled) _then)
      : super(_value, (v) => _then(v as _ControlsToggled));

  @override
  _ControlsToggled get _value => super._value as _ControlsToggled;

  @override
  $Res call({
    Object? show = freezed,
  }) {
    return _then(_ControlsToggled(
      show == freezed
          ? _value.show
          : show // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc

class _$_ControlsToggled implements _ControlsToggled {
  const _$_ControlsToggled([this.show]);

  @override
  final bool? show;

  @override
  String toString() {
    return 'MapEvent.controlsToggled(show: $show)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ControlsToggled &&
            (identical(other.show, show) ||
                const DeepCollectionEquality().equals(other.show, show)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(show);

  @JsonKey(ignore: true)
  @override
  _$ControlsToggledCopyWith<_ControlsToggled> get copyWith =>
      __$ControlsToggledCopyWithImpl<_ControlsToggled>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(bool? show) controlsToggled,
    required TResult Function(UserLocation location) userLocationUpdated,
    required TResult Function() userLocationFocused,
    required TResult Function() userLocationUnfocused,
    required TResult Function(SearchResult searchResult) searchResultSelected,
    required TResult Function() searchResultUnselected,
    required TResult Function(RoutePoint point) pointHighlighted,
    required TResult Function() pointUnhighlighted,
  }) {
    return controlsToggled(show);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(bool? show)? controlsToggled,
    TResult Function(UserLocation location)? userLocationUpdated,
    TResult Function()? userLocationFocused,
    TResult Function()? userLocationUnfocused,
    TResult Function(SearchResult searchResult)? searchResultSelected,
    TResult Function()? searchResultUnselected,
    TResult Function(RoutePoint point)? pointHighlighted,
    TResult Function()? pointUnhighlighted,
    required TResult orElse(),
  }) {
    if (controlsToggled != null) {
      return controlsToggled(show);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_ControlsToggled value) controlsToggled,
    required TResult Function(_UserLocationUpdated value) userLocationUpdated,
    required TResult Function(_UserLocationFocused value) userLocationFocused,
    required TResult Function(_UserLocationUnfocused value)
        userLocationUnfocused,
    required TResult Function(_SearchResultSelected value) searchResultSelected,
    required TResult Function(_SearchResultUnselected value)
        searchResultUnselected,
    required TResult Function(_PointHighlighted value) pointHighlighted,
    required TResult Function(_PointUnhighlighted value) pointUnhighlighted,
  }) {
    return controlsToggled(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_ControlsToggled value)? controlsToggled,
    TResult Function(_UserLocationUpdated value)? userLocationUpdated,
    TResult Function(_UserLocationFocused value)? userLocationFocused,
    TResult Function(_UserLocationUnfocused value)? userLocationUnfocused,
    TResult Function(_SearchResultSelected value)? searchResultSelected,
    TResult Function(_SearchResultUnselected value)? searchResultUnselected,
    TResult Function(_PointHighlighted value)? pointHighlighted,
    TResult Function(_PointUnhighlighted value)? pointUnhighlighted,
    required TResult orElse(),
  }) {
    if (controlsToggled != null) {
      return controlsToggled(this);
    }
    return orElse();
  }
}

abstract class _ControlsToggled implements MapEvent {
  const factory _ControlsToggled([bool? show]) = _$_ControlsToggled;

  bool? get show => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$ControlsToggledCopyWith<_ControlsToggled> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$UserLocationUpdatedCopyWith<$Res> {
  factory _$UserLocationUpdatedCopyWith(_UserLocationUpdated value,
          $Res Function(_UserLocationUpdated) then) =
      __$UserLocationUpdatedCopyWithImpl<$Res>;
  $Res call({UserLocation location});
}

/// @nodoc
class __$UserLocationUpdatedCopyWithImpl<$Res>
    extends _$MapEventCopyWithImpl<$Res>
    implements _$UserLocationUpdatedCopyWith<$Res> {
  __$UserLocationUpdatedCopyWithImpl(
      _UserLocationUpdated _value, $Res Function(_UserLocationUpdated) _then)
      : super(_value, (v) => _then(v as _UserLocationUpdated));

  @override
  _UserLocationUpdated get _value => super._value as _UserLocationUpdated;

  @override
  $Res call({
    Object? location = freezed,
  }) {
    return _then(_UserLocationUpdated(
      location == freezed
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as UserLocation,
    ));
  }
}

/// @nodoc

class _$_UserLocationUpdated implements _UserLocationUpdated {
  const _$_UserLocationUpdated(this.location);

  @override
  final UserLocation location;

  @override
  String toString() {
    return 'MapEvent.userLocationUpdated(location: $location)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _UserLocationUpdated &&
            (identical(other.location, location) ||
                const DeepCollectionEquality()
                    .equals(other.location, location)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(location);

  @JsonKey(ignore: true)
  @override
  _$UserLocationUpdatedCopyWith<_UserLocationUpdated> get copyWith =>
      __$UserLocationUpdatedCopyWithImpl<_UserLocationUpdated>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(bool? show) controlsToggled,
    required TResult Function(UserLocation location) userLocationUpdated,
    required TResult Function() userLocationFocused,
    required TResult Function() userLocationUnfocused,
    required TResult Function(SearchResult searchResult) searchResultSelected,
    required TResult Function() searchResultUnselected,
    required TResult Function(RoutePoint point) pointHighlighted,
    required TResult Function() pointUnhighlighted,
  }) {
    return userLocationUpdated(location);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(bool? show)? controlsToggled,
    TResult Function(UserLocation location)? userLocationUpdated,
    TResult Function()? userLocationFocused,
    TResult Function()? userLocationUnfocused,
    TResult Function(SearchResult searchResult)? searchResultSelected,
    TResult Function()? searchResultUnselected,
    TResult Function(RoutePoint point)? pointHighlighted,
    TResult Function()? pointUnhighlighted,
    required TResult orElse(),
  }) {
    if (userLocationUpdated != null) {
      return userLocationUpdated(location);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_ControlsToggled value) controlsToggled,
    required TResult Function(_UserLocationUpdated value) userLocationUpdated,
    required TResult Function(_UserLocationFocused value) userLocationFocused,
    required TResult Function(_UserLocationUnfocused value)
        userLocationUnfocused,
    required TResult Function(_SearchResultSelected value) searchResultSelected,
    required TResult Function(_SearchResultUnselected value)
        searchResultUnselected,
    required TResult Function(_PointHighlighted value) pointHighlighted,
    required TResult Function(_PointUnhighlighted value) pointUnhighlighted,
  }) {
    return userLocationUpdated(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_ControlsToggled value)? controlsToggled,
    TResult Function(_UserLocationUpdated value)? userLocationUpdated,
    TResult Function(_UserLocationFocused value)? userLocationFocused,
    TResult Function(_UserLocationUnfocused value)? userLocationUnfocused,
    TResult Function(_SearchResultSelected value)? searchResultSelected,
    TResult Function(_SearchResultUnselected value)? searchResultUnselected,
    TResult Function(_PointHighlighted value)? pointHighlighted,
    TResult Function(_PointUnhighlighted value)? pointUnhighlighted,
    required TResult orElse(),
  }) {
    if (userLocationUpdated != null) {
      return userLocationUpdated(this);
    }
    return orElse();
  }
}

abstract class _UserLocationUpdated implements MapEvent {
  const factory _UserLocationUpdated(UserLocation location) =
      _$_UserLocationUpdated;

  UserLocation get location => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$UserLocationUpdatedCopyWith<_UserLocationUpdated> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$UserLocationFocusedCopyWith<$Res> {
  factory _$UserLocationFocusedCopyWith(_UserLocationFocused value,
          $Res Function(_UserLocationFocused) then) =
      __$UserLocationFocusedCopyWithImpl<$Res>;
}

/// @nodoc
class __$UserLocationFocusedCopyWithImpl<$Res>
    extends _$MapEventCopyWithImpl<$Res>
    implements _$UserLocationFocusedCopyWith<$Res> {
  __$UserLocationFocusedCopyWithImpl(
      _UserLocationFocused _value, $Res Function(_UserLocationFocused) _then)
      : super(_value, (v) => _then(v as _UserLocationFocused));

  @override
  _UserLocationFocused get _value => super._value as _UserLocationFocused;
}

/// @nodoc

class _$_UserLocationFocused implements _UserLocationFocused {
  const _$_UserLocationFocused();

  @override
  String toString() {
    return 'MapEvent.userLocationFocused()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _UserLocationFocused);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(bool? show) controlsToggled,
    required TResult Function(UserLocation location) userLocationUpdated,
    required TResult Function() userLocationFocused,
    required TResult Function() userLocationUnfocused,
    required TResult Function(SearchResult searchResult) searchResultSelected,
    required TResult Function() searchResultUnselected,
    required TResult Function(RoutePoint point) pointHighlighted,
    required TResult Function() pointUnhighlighted,
  }) {
    return userLocationFocused();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(bool? show)? controlsToggled,
    TResult Function(UserLocation location)? userLocationUpdated,
    TResult Function()? userLocationFocused,
    TResult Function()? userLocationUnfocused,
    TResult Function(SearchResult searchResult)? searchResultSelected,
    TResult Function()? searchResultUnselected,
    TResult Function(RoutePoint point)? pointHighlighted,
    TResult Function()? pointUnhighlighted,
    required TResult orElse(),
  }) {
    if (userLocationFocused != null) {
      return userLocationFocused();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_ControlsToggled value) controlsToggled,
    required TResult Function(_UserLocationUpdated value) userLocationUpdated,
    required TResult Function(_UserLocationFocused value) userLocationFocused,
    required TResult Function(_UserLocationUnfocused value)
        userLocationUnfocused,
    required TResult Function(_SearchResultSelected value) searchResultSelected,
    required TResult Function(_SearchResultUnselected value)
        searchResultUnselected,
    required TResult Function(_PointHighlighted value) pointHighlighted,
    required TResult Function(_PointUnhighlighted value) pointUnhighlighted,
  }) {
    return userLocationFocused(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_ControlsToggled value)? controlsToggled,
    TResult Function(_UserLocationUpdated value)? userLocationUpdated,
    TResult Function(_UserLocationFocused value)? userLocationFocused,
    TResult Function(_UserLocationUnfocused value)? userLocationUnfocused,
    TResult Function(_SearchResultSelected value)? searchResultSelected,
    TResult Function(_SearchResultUnselected value)? searchResultUnselected,
    TResult Function(_PointHighlighted value)? pointHighlighted,
    TResult Function(_PointUnhighlighted value)? pointUnhighlighted,
    required TResult orElse(),
  }) {
    if (userLocationFocused != null) {
      return userLocationFocused(this);
    }
    return orElse();
  }
}

abstract class _UserLocationFocused implements MapEvent {
  const factory _UserLocationFocused() = _$_UserLocationFocused;
}

/// @nodoc
abstract class _$UserLocationUnfocusedCopyWith<$Res> {
  factory _$UserLocationUnfocusedCopyWith(_UserLocationUnfocused value,
          $Res Function(_UserLocationUnfocused) then) =
      __$UserLocationUnfocusedCopyWithImpl<$Res>;
}

/// @nodoc
class __$UserLocationUnfocusedCopyWithImpl<$Res>
    extends _$MapEventCopyWithImpl<$Res>
    implements _$UserLocationUnfocusedCopyWith<$Res> {
  __$UserLocationUnfocusedCopyWithImpl(_UserLocationUnfocused _value,
      $Res Function(_UserLocationUnfocused) _then)
      : super(_value, (v) => _then(v as _UserLocationUnfocused));

  @override
  _UserLocationUnfocused get _value => super._value as _UserLocationUnfocused;
}

/// @nodoc

class _$_UserLocationUnfocused implements _UserLocationUnfocused {
  const _$_UserLocationUnfocused();

  @override
  String toString() {
    return 'MapEvent.userLocationUnfocused()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _UserLocationUnfocused);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(bool? show) controlsToggled,
    required TResult Function(UserLocation location) userLocationUpdated,
    required TResult Function() userLocationFocused,
    required TResult Function() userLocationUnfocused,
    required TResult Function(SearchResult searchResult) searchResultSelected,
    required TResult Function() searchResultUnselected,
    required TResult Function(RoutePoint point) pointHighlighted,
    required TResult Function() pointUnhighlighted,
  }) {
    return userLocationUnfocused();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(bool? show)? controlsToggled,
    TResult Function(UserLocation location)? userLocationUpdated,
    TResult Function()? userLocationFocused,
    TResult Function()? userLocationUnfocused,
    TResult Function(SearchResult searchResult)? searchResultSelected,
    TResult Function()? searchResultUnselected,
    TResult Function(RoutePoint point)? pointHighlighted,
    TResult Function()? pointUnhighlighted,
    required TResult orElse(),
  }) {
    if (userLocationUnfocused != null) {
      return userLocationUnfocused();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_ControlsToggled value) controlsToggled,
    required TResult Function(_UserLocationUpdated value) userLocationUpdated,
    required TResult Function(_UserLocationFocused value) userLocationFocused,
    required TResult Function(_UserLocationUnfocused value)
        userLocationUnfocused,
    required TResult Function(_SearchResultSelected value) searchResultSelected,
    required TResult Function(_SearchResultUnselected value)
        searchResultUnselected,
    required TResult Function(_PointHighlighted value) pointHighlighted,
    required TResult Function(_PointUnhighlighted value) pointUnhighlighted,
  }) {
    return userLocationUnfocused(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_ControlsToggled value)? controlsToggled,
    TResult Function(_UserLocationUpdated value)? userLocationUpdated,
    TResult Function(_UserLocationFocused value)? userLocationFocused,
    TResult Function(_UserLocationUnfocused value)? userLocationUnfocused,
    TResult Function(_SearchResultSelected value)? searchResultSelected,
    TResult Function(_SearchResultUnselected value)? searchResultUnselected,
    TResult Function(_PointHighlighted value)? pointHighlighted,
    TResult Function(_PointUnhighlighted value)? pointUnhighlighted,
    required TResult orElse(),
  }) {
    if (userLocationUnfocused != null) {
      return userLocationUnfocused(this);
    }
    return orElse();
  }
}

abstract class _UserLocationUnfocused implements MapEvent {
  const factory _UserLocationUnfocused() = _$_UserLocationUnfocused;
}

/// @nodoc
abstract class _$SearchResultSelectedCopyWith<$Res> {
  factory _$SearchResultSelectedCopyWith(_SearchResultSelected value,
          $Res Function(_SearchResultSelected) then) =
      __$SearchResultSelectedCopyWithImpl<$Res>;
  $Res call({SearchResult searchResult});
}

/// @nodoc
class __$SearchResultSelectedCopyWithImpl<$Res>
    extends _$MapEventCopyWithImpl<$Res>
    implements _$SearchResultSelectedCopyWith<$Res> {
  __$SearchResultSelectedCopyWithImpl(
      _SearchResultSelected _value, $Res Function(_SearchResultSelected) _then)
      : super(_value, (v) => _then(v as _SearchResultSelected));

  @override
  _SearchResultSelected get _value => super._value as _SearchResultSelected;

  @override
  $Res call({
    Object? searchResult = freezed,
  }) {
    return _then(_SearchResultSelected(
      searchResult == freezed
          ? _value.searchResult
          : searchResult // ignore: cast_nullable_to_non_nullable
              as SearchResult,
    ));
  }
}

/// @nodoc

class _$_SearchResultSelected implements _SearchResultSelected {
  const _$_SearchResultSelected(this.searchResult);

  @override
  final SearchResult searchResult;

  @override
  String toString() {
    return 'MapEvent.searchResultSelected(searchResult: $searchResult)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _SearchResultSelected &&
            (identical(other.searchResult, searchResult) ||
                const DeepCollectionEquality()
                    .equals(other.searchResult, searchResult)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(searchResult);

  @JsonKey(ignore: true)
  @override
  _$SearchResultSelectedCopyWith<_SearchResultSelected> get copyWith =>
      __$SearchResultSelectedCopyWithImpl<_SearchResultSelected>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(bool? show) controlsToggled,
    required TResult Function(UserLocation location) userLocationUpdated,
    required TResult Function() userLocationFocused,
    required TResult Function() userLocationUnfocused,
    required TResult Function(SearchResult searchResult) searchResultSelected,
    required TResult Function() searchResultUnselected,
    required TResult Function(RoutePoint point) pointHighlighted,
    required TResult Function() pointUnhighlighted,
  }) {
    return searchResultSelected(searchResult);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(bool? show)? controlsToggled,
    TResult Function(UserLocation location)? userLocationUpdated,
    TResult Function()? userLocationFocused,
    TResult Function()? userLocationUnfocused,
    TResult Function(SearchResult searchResult)? searchResultSelected,
    TResult Function()? searchResultUnselected,
    TResult Function(RoutePoint point)? pointHighlighted,
    TResult Function()? pointUnhighlighted,
    required TResult orElse(),
  }) {
    if (searchResultSelected != null) {
      return searchResultSelected(searchResult);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_ControlsToggled value) controlsToggled,
    required TResult Function(_UserLocationUpdated value) userLocationUpdated,
    required TResult Function(_UserLocationFocused value) userLocationFocused,
    required TResult Function(_UserLocationUnfocused value)
        userLocationUnfocused,
    required TResult Function(_SearchResultSelected value) searchResultSelected,
    required TResult Function(_SearchResultUnselected value)
        searchResultUnselected,
    required TResult Function(_PointHighlighted value) pointHighlighted,
    required TResult Function(_PointUnhighlighted value) pointUnhighlighted,
  }) {
    return searchResultSelected(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_ControlsToggled value)? controlsToggled,
    TResult Function(_UserLocationUpdated value)? userLocationUpdated,
    TResult Function(_UserLocationFocused value)? userLocationFocused,
    TResult Function(_UserLocationUnfocused value)? userLocationUnfocused,
    TResult Function(_SearchResultSelected value)? searchResultSelected,
    TResult Function(_SearchResultUnselected value)? searchResultUnselected,
    TResult Function(_PointHighlighted value)? pointHighlighted,
    TResult Function(_PointUnhighlighted value)? pointUnhighlighted,
    required TResult orElse(),
  }) {
    if (searchResultSelected != null) {
      return searchResultSelected(this);
    }
    return orElse();
  }
}

abstract class _SearchResultSelected implements MapEvent {
  const factory _SearchResultSelected(SearchResult searchResult) =
      _$_SearchResultSelected;

  SearchResult get searchResult => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$SearchResultSelectedCopyWith<_SearchResultSelected> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$SearchResultUnselectedCopyWith<$Res> {
  factory _$SearchResultUnselectedCopyWith(_SearchResultUnselected value,
          $Res Function(_SearchResultUnselected) then) =
      __$SearchResultUnselectedCopyWithImpl<$Res>;
}

/// @nodoc
class __$SearchResultUnselectedCopyWithImpl<$Res>
    extends _$MapEventCopyWithImpl<$Res>
    implements _$SearchResultUnselectedCopyWith<$Res> {
  __$SearchResultUnselectedCopyWithImpl(_SearchResultUnselected _value,
      $Res Function(_SearchResultUnselected) _then)
      : super(_value, (v) => _then(v as _SearchResultUnselected));

  @override
  _SearchResultUnselected get _value => super._value as _SearchResultUnselected;
}

/// @nodoc

class _$_SearchResultUnselected implements _SearchResultUnselected {
  const _$_SearchResultUnselected();

  @override
  String toString() {
    return 'MapEvent.searchResultUnselected()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _SearchResultUnselected);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(bool? show) controlsToggled,
    required TResult Function(UserLocation location) userLocationUpdated,
    required TResult Function() userLocationFocused,
    required TResult Function() userLocationUnfocused,
    required TResult Function(SearchResult searchResult) searchResultSelected,
    required TResult Function() searchResultUnselected,
    required TResult Function(RoutePoint point) pointHighlighted,
    required TResult Function() pointUnhighlighted,
  }) {
    return searchResultUnselected();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(bool? show)? controlsToggled,
    TResult Function(UserLocation location)? userLocationUpdated,
    TResult Function()? userLocationFocused,
    TResult Function()? userLocationUnfocused,
    TResult Function(SearchResult searchResult)? searchResultSelected,
    TResult Function()? searchResultUnselected,
    TResult Function(RoutePoint point)? pointHighlighted,
    TResult Function()? pointUnhighlighted,
    required TResult orElse(),
  }) {
    if (searchResultUnselected != null) {
      return searchResultUnselected();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_ControlsToggled value) controlsToggled,
    required TResult Function(_UserLocationUpdated value) userLocationUpdated,
    required TResult Function(_UserLocationFocused value) userLocationFocused,
    required TResult Function(_UserLocationUnfocused value)
        userLocationUnfocused,
    required TResult Function(_SearchResultSelected value) searchResultSelected,
    required TResult Function(_SearchResultUnselected value)
        searchResultUnselected,
    required TResult Function(_PointHighlighted value) pointHighlighted,
    required TResult Function(_PointUnhighlighted value) pointUnhighlighted,
  }) {
    return searchResultUnselected(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_ControlsToggled value)? controlsToggled,
    TResult Function(_UserLocationUpdated value)? userLocationUpdated,
    TResult Function(_UserLocationFocused value)? userLocationFocused,
    TResult Function(_UserLocationUnfocused value)? userLocationUnfocused,
    TResult Function(_SearchResultSelected value)? searchResultSelected,
    TResult Function(_SearchResultUnselected value)? searchResultUnselected,
    TResult Function(_PointHighlighted value)? pointHighlighted,
    TResult Function(_PointUnhighlighted value)? pointUnhighlighted,
    required TResult orElse(),
  }) {
    if (searchResultUnselected != null) {
      return searchResultUnselected(this);
    }
    return orElse();
  }
}

abstract class _SearchResultUnselected implements MapEvent {
  const factory _SearchResultUnselected() = _$_SearchResultUnselected;
}

/// @nodoc
abstract class _$PointHighlightedCopyWith<$Res> {
  factory _$PointHighlightedCopyWith(
          _PointHighlighted value, $Res Function(_PointHighlighted) then) =
      __$PointHighlightedCopyWithImpl<$Res>;
  $Res call({RoutePoint point});
}

/// @nodoc
class __$PointHighlightedCopyWithImpl<$Res> extends _$MapEventCopyWithImpl<$Res>
    implements _$PointHighlightedCopyWith<$Res> {
  __$PointHighlightedCopyWithImpl(
      _PointHighlighted _value, $Res Function(_PointHighlighted) _then)
      : super(_value, (v) => _then(v as _PointHighlighted));

  @override
  _PointHighlighted get _value => super._value as _PointHighlighted;

  @override
  $Res call({
    Object? point = freezed,
  }) {
    return _then(_PointHighlighted(
      point == freezed
          ? _value.point
          : point // ignore: cast_nullable_to_non_nullable
              as RoutePoint,
    ));
  }
}

/// @nodoc

class _$_PointHighlighted implements _PointHighlighted {
  const _$_PointHighlighted(this.point);

  @override
  final RoutePoint point;

  @override
  String toString() {
    return 'MapEvent.pointHighlighted(point: $point)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _PointHighlighted &&
            (identical(other.point, point) ||
                const DeepCollectionEquality().equals(other.point, point)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(point);

  @JsonKey(ignore: true)
  @override
  _$PointHighlightedCopyWith<_PointHighlighted> get copyWith =>
      __$PointHighlightedCopyWithImpl<_PointHighlighted>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(bool? show) controlsToggled,
    required TResult Function(UserLocation location) userLocationUpdated,
    required TResult Function() userLocationFocused,
    required TResult Function() userLocationUnfocused,
    required TResult Function(SearchResult searchResult) searchResultSelected,
    required TResult Function() searchResultUnselected,
    required TResult Function(RoutePoint point) pointHighlighted,
    required TResult Function() pointUnhighlighted,
  }) {
    return pointHighlighted(point);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(bool? show)? controlsToggled,
    TResult Function(UserLocation location)? userLocationUpdated,
    TResult Function()? userLocationFocused,
    TResult Function()? userLocationUnfocused,
    TResult Function(SearchResult searchResult)? searchResultSelected,
    TResult Function()? searchResultUnselected,
    TResult Function(RoutePoint point)? pointHighlighted,
    TResult Function()? pointUnhighlighted,
    required TResult orElse(),
  }) {
    if (pointHighlighted != null) {
      return pointHighlighted(point);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_ControlsToggled value) controlsToggled,
    required TResult Function(_UserLocationUpdated value) userLocationUpdated,
    required TResult Function(_UserLocationFocused value) userLocationFocused,
    required TResult Function(_UserLocationUnfocused value)
        userLocationUnfocused,
    required TResult Function(_SearchResultSelected value) searchResultSelected,
    required TResult Function(_SearchResultUnselected value)
        searchResultUnselected,
    required TResult Function(_PointHighlighted value) pointHighlighted,
    required TResult Function(_PointUnhighlighted value) pointUnhighlighted,
  }) {
    return pointHighlighted(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_ControlsToggled value)? controlsToggled,
    TResult Function(_UserLocationUpdated value)? userLocationUpdated,
    TResult Function(_UserLocationFocused value)? userLocationFocused,
    TResult Function(_UserLocationUnfocused value)? userLocationUnfocused,
    TResult Function(_SearchResultSelected value)? searchResultSelected,
    TResult Function(_SearchResultUnselected value)? searchResultUnselected,
    TResult Function(_PointHighlighted value)? pointHighlighted,
    TResult Function(_PointUnhighlighted value)? pointUnhighlighted,
    required TResult orElse(),
  }) {
    if (pointHighlighted != null) {
      return pointHighlighted(this);
    }
    return orElse();
  }
}

abstract class _PointHighlighted implements MapEvent {
  const factory _PointHighlighted(RoutePoint point) = _$_PointHighlighted;

  RoutePoint get point => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$PointHighlightedCopyWith<_PointHighlighted> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$PointUnhighlightedCopyWith<$Res> {
  factory _$PointUnhighlightedCopyWith(
          _PointUnhighlighted value, $Res Function(_PointUnhighlighted) then) =
      __$PointUnhighlightedCopyWithImpl<$Res>;
}

/// @nodoc
class __$PointUnhighlightedCopyWithImpl<$Res>
    extends _$MapEventCopyWithImpl<$Res>
    implements _$PointUnhighlightedCopyWith<$Res> {
  __$PointUnhighlightedCopyWithImpl(
      _PointUnhighlighted _value, $Res Function(_PointUnhighlighted) _then)
      : super(_value, (v) => _then(v as _PointUnhighlighted));

  @override
  _PointUnhighlighted get _value => super._value as _PointUnhighlighted;
}

/// @nodoc

class _$_PointUnhighlighted implements _PointUnhighlighted {
  const _$_PointUnhighlighted();

  @override
  String toString() {
    return 'MapEvent.pointUnhighlighted()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _PointUnhighlighted);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(bool? show) controlsToggled,
    required TResult Function(UserLocation location) userLocationUpdated,
    required TResult Function() userLocationFocused,
    required TResult Function() userLocationUnfocused,
    required TResult Function(SearchResult searchResult) searchResultSelected,
    required TResult Function() searchResultUnselected,
    required TResult Function(RoutePoint point) pointHighlighted,
    required TResult Function() pointUnhighlighted,
  }) {
    return pointUnhighlighted();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(bool? show)? controlsToggled,
    TResult Function(UserLocation location)? userLocationUpdated,
    TResult Function()? userLocationFocused,
    TResult Function()? userLocationUnfocused,
    TResult Function(SearchResult searchResult)? searchResultSelected,
    TResult Function()? searchResultUnselected,
    TResult Function(RoutePoint point)? pointHighlighted,
    TResult Function()? pointUnhighlighted,
    required TResult orElse(),
  }) {
    if (pointUnhighlighted != null) {
      return pointUnhighlighted();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_ControlsToggled value) controlsToggled,
    required TResult Function(_UserLocationUpdated value) userLocationUpdated,
    required TResult Function(_UserLocationFocused value) userLocationFocused,
    required TResult Function(_UserLocationUnfocused value)
        userLocationUnfocused,
    required TResult Function(_SearchResultSelected value) searchResultSelected,
    required TResult Function(_SearchResultUnselected value)
        searchResultUnselected,
    required TResult Function(_PointHighlighted value) pointHighlighted,
    required TResult Function(_PointUnhighlighted value) pointUnhighlighted,
  }) {
    return pointUnhighlighted(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_ControlsToggled value)? controlsToggled,
    TResult Function(_UserLocationUpdated value)? userLocationUpdated,
    TResult Function(_UserLocationFocused value)? userLocationFocused,
    TResult Function(_UserLocationUnfocused value)? userLocationUnfocused,
    TResult Function(_SearchResultSelected value)? searchResultSelected,
    TResult Function(_SearchResultUnselected value)? searchResultUnselected,
    TResult Function(_PointHighlighted value)? pointHighlighted,
    TResult Function(_PointUnhighlighted value)? pointUnhighlighted,
    required TResult orElse(),
  }) {
    if (pointUnhighlighted != null) {
      return pointUnhighlighted(this);
    }
    return orElse();
  }
}

abstract class _PointUnhighlighted implements MapEvent {
  const factory _PointUnhighlighted() = _$_PointUnhighlighted;
}

/// @nodoc
class _$MapStateTearOff {
  const _$MapStateTearOff();

  _MapState call(
      {bool controlsVisible = true,
      bool locationInitialized = false,
      bool canGetLocation = false,
      bool userLocationFocused = true,
      UserLocation? userLocation,
      SearchResult? searchResult,
      RoutePoint? highlightedPoint}) {
    return _MapState(
      controlsVisible: controlsVisible,
      locationInitialized: locationInitialized,
      canGetLocation: canGetLocation,
      userLocationFocused: userLocationFocused,
      userLocation: userLocation,
      searchResult: searchResult,
      highlightedPoint: highlightedPoint,
    );
  }
}

/// @nodoc
const $MapState = _$MapStateTearOff();

/// @nodoc
mixin _$MapState {
  bool get controlsVisible => throw _privateConstructorUsedError;
  bool get locationInitialized => throw _privateConstructorUsedError;
  bool get canGetLocation => throw _privateConstructorUsedError;
  bool get userLocationFocused => throw _privateConstructorUsedError;
  UserLocation? get userLocation => throw _privateConstructorUsedError;
  SearchResult? get searchResult => throw _privateConstructorUsedError;
  RoutePoint? get highlightedPoint => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MapStateCopyWith<MapState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MapStateCopyWith<$Res> {
  factory $MapStateCopyWith(MapState value, $Res Function(MapState) then) =
      _$MapStateCopyWithImpl<$Res>;
  $Res call(
      {bool controlsVisible,
      bool locationInitialized,
      bool canGetLocation,
      bool userLocationFocused,
      UserLocation? userLocation,
      SearchResult? searchResult,
      RoutePoint? highlightedPoint});
}

/// @nodoc
class _$MapStateCopyWithImpl<$Res> implements $MapStateCopyWith<$Res> {
  _$MapStateCopyWithImpl(this._value, this._then);

  final MapState _value;
  // ignore: unused_field
  final $Res Function(MapState) _then;

  @override
  $Res call({
    Object? controlsVisible = freezed,
    Object? locationInitialized = freezed,
    Object? canGetLocation = freezed,
    Object? userLocationFocused = freezed,
    Object? userLocation = freezed,
    Object? searchResult = freezed,
    Object? highlightedPoint = freezed,
  }) {
    return _then(_value.copyWith(
      controlsVisible: controlsVisible == freezed
          ? _value.controlsVisible
          : controlsVisible // ignore: cast_nullable_to_non_nullable
              as bool,
      locationInitialized: locationInitialized == freezed
          ? _value.locationInitialized
          : locationInitialized // ignore: cast_nullable_to_non_nullable
              as bool,
      canGetLocation: canGetLocation == freezed
          ? _value.canGetLocation
          : canGetLocation // ignore: cast_nullable_to_non_nullable
              as bool,
      userLocationFocused: userLocationFocused == freezed
          ? _value.userLocationFocused
          : userLocationFocused // ignore: cast_nullable_to_non_nullable
              as bool,
      userLocation: userLocation == freezed
          ? _value.userLocation
          : userLocation // ignore: cast_nullable_to_non_nullable
              as UserLocation?,
      searchResult: searchResult == freezed
          ? _value.searchResult
          : searchResult // ignore: cast_nullable_to_non_nullable
              as SearchResult?,
      highlightedPoint: highlightedPoint == freezed
          ? _value.highlightedPoint
          : highlightedPoint // ignore: cast_nullable_to_non_nullable
              as RoutePoint?,
    ));
  }
}

/// @nodoc
abstract class _$MapStateCopyWith<$Res> implements $MapStateCopyWith<$Res> {
  factory _$MapStateCopyWith(_MapState value, $Res Function(_MapState) then) =
      __$MapStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {bool controlsVisible,
      bool locationInitialized,
      bool canGetLocation,
      bool userLocationFocused,
      UserLocation? userLocation,
      SearchResult? searchResult,
      RoutePoint? highlightedPoint});
}

/// @nodoc
class __$MapStateCopyWithImpl<$Res> extends _$MapStateCopyWithImpl<$Res>
    implements _$MapStateCopyWith<$Res> {
  __$MapStateCopyWithImpl(_MapState _value, $Res Function(_MapState) _then)
      : super(_value, (v) => _then(v as _MapState));

  @override
  _MapState get _value => super._value as _MapState;

  @override
  $Res call({
    Object? controlsVisible = freezed,
    Object? locationInitialized = freezed,
    Object? canGetLocation = freezed,
    Object? userLocationFocused = freezed,
    Object? userLocation = freezed,
    Object? searchResult = freezed,
    Object? highlightedPoint = freezed,
  }) {
    return _then(_MapState(
      controlsVisible: controlsVisible == freezed
          ? _value.controlsVisible
          : controlsVisible // ignore: cast_nullable_to_non_nullable
              as bool,
      locationInitialized: locationInitialized == freezed
          ? _value.locationInitialized
          : locationInitialized // ignore: cast_nullable_to_non_nullable
              as bool,
      canGetLocation: canGetLocation == freezed
          ? _value.canGetLocation
          : canGetLocation // ignore: cast_nullable_to_non_nullable
              as bool,
      userLocationFocused: userLocationFocused == freezed
          ? _value.userLocationFocused
          : userLocationFocused // ignore: cast_nullable_to_non_nullable
              as bool,
      userLocation: userLocation == freezed
          ? _value.userLocation
          : userLocation // ignore: cast_nullable_to_non_nullable
              as UserLocation?,
      searchResult: searchResult == freezed
          ? _value.searchResult
          : searchResult // ignore: cast_nullable_to_non_nullable
              as SearchResult?,
      highlightedPoint: highlightedPoint == freezed
          ? _value.highlightedPoint
          : highlightedPoint // ignore: cast_nullable_to_non_nullable
              as RoutePoint?,
    ));
  }
}

/// @nodoc

class _$_MapState implements _MapState {
  const _$_MapState(
      {this.controlsVisible = true,
      this.locationInitialized = false,
      this.canGetLocation = false,
      this.userLocationFocused = true,
      this.userLocation,
      this.searchResult,
      this.highlightedPoint});

  @JsonKey(defaultValue: true)
  @override
  final bool controlsVisible;
  @JsonKey(defaultValue: false)
  @override
  final bool locationInitialized;
  @JsonKey(defaultValue: false)
  @override
  final bool canGetLocation;
  @JsonKey(defaultValue: true)
  @override
  final bool userLocationFocused;
  @override
  final UserLocation? userLocation;
  @override
  final SearchResult? searchResult;
  @override
  final RoutePoint? highlightedPoint;

  @override
  String toString() {
    return 'MapState(controlsVisible: $controlsVisible, locationInitialized: $locationInitialized, canGetLocation: $canGetLocation, userLocationFocused: $userLocationFocused, userLocation: $userLocation, searchResult: $searchResult, highlightedPoint: $highlightedPoint)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _MapState &&
            (identical(other.controlsVisible, controlsVisible) ||
                const DeepCollectionEquality()
                    .equals(other.controlsVisible, controlsVisible)) &&
            (identical(other.locationInitialized, locationInitialized) ||
                const DeepCollectionEquality()
                    .equals(other.locationInitialized, locationInitialized)) &&
            (identical(other.canGetLocation, canGetLocation) ||
                const DeepCollectionEquality()
                    .equals(other.canGetLocation, canGetLocation)) &&
            (identical(other.userLocationFocused, userLocationFocused) ||
                const DeepCollectionEquality()
                    .equals(other.userLocationFocused, userLocationFocused)) &&
            (identical(other.userLocation, userLocation) ||
                const DeepCollectionEquality()
                    .equals(other.userLocation, userLocation)) &&
            (identical(other.searchResult, searchResult) ||
                const DeepCollectionEquality()
                    .equals(other.searchResult, searchResult)) &&
            (identical(other.highlightedPoint, highlightedPoint) ||
                const DeepCollectionEquality()
                    .equals(other.highlightedPoint, highlightedPoint)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(controlsVisible) ^
      const DeepCollectionEquality().hash(locationInitialized) ^
      const DeepCollectionEquality().hash(canGetLocation) ^
      const DeepCollectionEquality().hash(userLocationFocused) ^
      const DeepCollectionEquality().hash(userLocation) ^
      const DeepCollectionEquality().hash(searchResult) ^
      const DeepCollectionEquality().hash(highlightedPoint);

  @JsonKey(ignore: true)
  @override
  _$MapStateCopyWith<_MapState> get copyWith =>
      __$MapStateCopyWithImpl<_MapState>(this, _$identity);
}

abstract class _MapState implements MapState {
  const factory _MapState(
      {bool controlsVisible,
      bool locationInitialized,
      bool canGetLocation,
      bool userLocationFocused,
      UserLocation? userLocation,
      SearchResult? searchResult,
      RoutePoint? highlightedPoint}) = _$_MapState;

  @override
  bool get controlsVisible => throw _privateConstructorUsedError;
  @override
  bool get locationInitialized => throw _privateConstructorUsedError;
  @override
  bool get canGetLocation => throw _privateConstructorUsedError;
  @override
  bool get userLocationFocused => throw _privateConstructorUsedError;
  @override
  UserLocation? get userLocation => throw _privateConstructorUsedError;
  @override
  SearchResult? get searchResult => throw _privateConstructorUsedError;
  @override
  RoutePoint? get highlightedPoint => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$MapStateCopyWith<_MapState> get copyWith =>
      throw _privateConstructorUsedError;
}
