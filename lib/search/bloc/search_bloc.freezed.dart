// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'search_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$SearchEventTearOff {
  const _$SearchEventTearOff();

  _SearchBarChanged searchBarChanged({required String value}) {
    return _SearchBarChanged(
      value: value,
    );
  }

  _SearchBarCleared cleared() {
    return const _SearchBarCleared();
  }

  _SearchSubmitted submitted({required String value, LatLng? center}) {
    return _SearchSubmitted(
      value: value,
      center: center,
    );
  }
}

/// @nodoc
const $SearchEvent = _$SearchEventTearOff();

/// @nodoc
mixin _$SearchEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String value) searchBarChanged,
    required TResult Function() cleared,
    required TResult Function(String value, LatLng? center) submitted,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String value)? searchBarChanged,
    TResult Function()? cleared,
    TResult Function(String value, LatLng? center)? submitted,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SearchBarChanged value) searchBarChanged,
    required TResult Function(_SearchBarCleared value) cleared,
    required TResult Function(_SearchSubmitted value) submitted,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SearchBarChanged value)? searchBarChanged,
    TResult Function(_SearchBarCleared value)? cleared,
    TResult Function(_SearchSubmitted value)? submitted,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchEventCopyWith<$Res> {
  factory $SearchEventCopyWith(
          SearchEvent value, $Res Function(SearchEvent) then) =
      _$SearchEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$SearchEventCopyWithImpl<$Res> implements $SearchEventCopyWith<$Res> {
  _$SearchEventCopyWithImpl(this._value, this._then);

  final SearchEvent _value;
  // ignore: unused_field
  final $Res Function(SearchEvent) _then;
}

/// @nodoc
abstract class _$SearchBarChangedCopyWith<$Res> {
  factory _$SearchBarChangedCopyWith(
          _SearchBarChanged value, $Res Function(_SearchBarChanged) then) =
      __$SearchBarChangedCopyWithImpl<$Res>;
  $Res call({String value});
}

/// @nodoc
class __$SearchBarChangedCopyWithImpl<$Res>
    extends _$SearchEventCopyWithImpl<$Res>
    implements _$SearchBarChangedCopyWith<$Res> {
  __$SearchBarChangedCopyWithImpl(
      _SearchBarChanged _value, $Res Function(_SearchBarChanged) _then)
      : super(_value, (v) => _then(v as _SearchBarChanged));

  @override
  _SearchBarChanged get _value => super._value as _SearchBarChanged;

  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_SearchBarChanged(
      value: value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_SearchBarChanged
    with DiagnosticableTreeMixin
    implements _SearchBarChanged {
  const _$_SearchBarChanged({required this.value});

  @override
  final String value;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SearchEvent.searchBarChanged(value: $value)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'SearchEvent.searchBarChanged'))
      ..add(DiagnosticsProperty('value', value));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _SearchBarChanged &&
            (identical(other.value, value) ||
                const DeepCollectionEquality().equals(other.value, value)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(value);

  @JsonKey(ignore: true)
  @override
  _$SearchBarChangedCopyWith<_SearchBarChanged> get copyWith =>
      __$SearchBarChangedCopyWithImpl<_SearchBarChanged>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String value) searchBarChanged,
    required TResult Function() cleared,
    required TResult Function(String value, LatLng? center) submitted,
  }) {
    return searchBarChanged(value);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String value)? searchBarChanged,
    TResult Function()? cleared,
    TResult Function(String value, LatLng? center)? submitted,
    required TResult orElse(),
  }) {
    if (searchBarChanged != null) {
      return searchBarChanged(value);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SearchBarChanged value) searchBarChanged,
    required TResult Function(_SearchBarCleared value) cleared,
    required TResult Function(_SearchSubmitted value) submitted,
  }) {
    return searchBarChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SearchBarChanged value)? searchBarChanged,
    TResult Function(_SearchBarCleared value)? cleared,
    TResult Function(_SearchSubmitted value)? submitted,
    required TResult orElse(),
  }) {
    if (searchBarChanged != null) {
      return searchBarChanged(this);
    }
    return orElse();
  }
}

abstract class _SearchBarChanged implements SearchEvent {
  const factory _SearchBarChanged({required String value}) =
      _$_SearchBarChanged;

  String get value => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$SearchBarChangedCopyWith<_SearchBarChanged> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$SearchBarClearedCopyWith<$Res> {
  factory _$SearchBarClearedCopyWith(
          _SearchBarCleared value, $Res Function(_SearchBarCleared) then) =
      __$SearchBarClearedCopyWithImpl<$Res>;
}

/// @nodoc
class __$SearchBarClearedCopyWithImpl<$Res>
    extends _$SearchEventCopyWithImpl<$Res>
    implements _$SearchBarClearedCopyWith<$Res> {
  __$SearchBarClearedCopyWithImpl(
      _SearchBarCleared _value, $Res Function(_SearchBarCleared) _then)
      : super(_value, (v) => _then(v as _SearchBarCleared));

  @override
  _SearchBarCleared get _value => super._value as _SearchBarCleared;
}

/// @nodoc

class _$_SearchBarCleared
    with DiagnosticableTreeMixin
    implements _SearchBarCleared {
  const _$_SearchBarCleared();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SearchEvent.cleared()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties..add(DiagnosticsProperty('type', 'SearchEvent.cleared'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _SearchBarCleared);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String value) searchBarChanged,
    required TResult Function() cleared,
    required TResult Function(String value, LatLng? center) submitted,
  }) {
    return cleared();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String value)? searchBarChanged,
    TResult Function()? cleared,
    TResult Function(String value, LatLng? center)? submitted,
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
    required TResult Function(_SearchBarChanged value) searchBarChanged,
    required TResult Function(_SearchBarCleared value) cleared,
    required TResult Function(_SearchSubmitted value) submitted,
  }) {
    return cleared(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SearchBarChanged value)? searchBarChanged,
    TResult Function(_SearchBarCleared value)? cleared,
    TResult Function(_SearchSubmitted value)? submitted,
    required TResult orElse(),
  }) {
    if (cleared != null) {
      return cleared(this);
    }
    return orElse();
  }
}

abstract class _SearchBarCleared implements SearchEvent {
  const factory _SearchBarCleared() = _$_SearchBarCleared;
}

/// @nodoc
abstract class _$SearchSubmittedCopyWith<$Res> {
  factory _$SearchSubmittedCopyWith(
          _SearchSubmitted value, $Res Function(_SearchSubmitted) then) =
      __$SearchSubmittedCopyWithImpl<$Res>;
  $Res call({String value, LatLng? center});
}

/// @nodoc
class __$SearchSubmittedCopyWithImpl<$Res>
    extends _$SearchEventCopyWithImpl<$Res>
    implements _$SearchSubmittedCopyWith<$Res> {
  __$SearchSubmittedCopyWithImpl(
      _SearchSubmitted _value, $Res Function(_SearchSubmitted) _then)
      : super(_value, (v) => _then(v as _SearchSubmitted));

  @override
  _SearchSubmitted get _value => super._value as _SearchSubmitted;

  @override
  $Res call({
    Object? value = freezed,
    Object? center = freezed,
  }) {
    return _then(_SearchSubmitted(
      value: value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
      center: center == freezed
          ? _value.center
          : center // ignore: cast_nullable_to_non_nullable
              as LatLng?,
    ));
  }
}

/// @nodoc

class _$_SearchSubmitted
    with DiagnosticableTreeMixin
    implements _SearchSubmitted {
  const _$_SearchSubmitted({required this.value, this.center});

  @override
  final String value;
  @override
  final LatLng? center;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SearchEvent.submitted(value: $value, center: $center)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'SearchEvent.submitted'))
      ..add(DiagnosticsProperty('value', value))
      ..add(DiagnosticsProperty('center', center));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _SearchSubmitted &&
            (identical(other.value, value) ||
                const DeepCollectionEquality().equals(other.value, value)) &&
            (identical(other.center, center) ||
                const DeepCollectionEquality().equals(other.center, center)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(value) ^
      const DeepCollectionEquality().hash(center);

  @JsonKey(ignore: true)
  @override
  _$SearchSubmittedCopyWith<_SearchSubmitted> get copyWith =>
      __$SearchSubmittedCopyWithImpl<_SearchSubmitted>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String value) searchBarChanged,
    required TResult Function() cleared,
    required TResult Function(String value, LatLng? center) submitted,
  }) {
    return submitted(value, center);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String value)? searchBarChanged,
    TResult Function()? cleared,
    TResult Function(String value, LatLng? center)? submitted,
    required TResult orElse(),
  }) {
    if (submitted != null) {
      return submitted(value, center);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SearchBarChanged value) searchBarChanged,
    required TResult Function(_SearchBarCleared value) cleared,
    required TResult Function(_SearchSubmitted value) submitted,
  }) {
    return submitted(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SearchBarChanged value)? searchBarChanged,
    TResult Function(_SearchBarCleared value)? cleared,
    TResult Function(_SearchSubmitted value)? submitted,
    required TResult orElse(),
  }) {
    if (submitted != null) {
      return submitted(this);
    }
    return orElse();
  }
}

abstract class _SearchSubmitted implements SearchEvent {
  const factory _SearchSubmitted({required String value, LatLng? center}) =
      _$_SearchSubmitted;

  String get value => throw _privateConstructorUsedError;
  LatLng? get center => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$SearchSubmittedCopyWith<_SearchSubmitted> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
class _$SearchStateTearOff {
  const _$SearchStateTearOff();

  _SearchState call(
      {bool searchBarEmpty = true,
      List<SearchResult> searchResults = const []}) {
    return _SearchState(
      searchBarEmpty: searchBarEmpty,
      searchResults: searchResults,
    );
  }
}

/// @nodoc
const $SearchState = _$SearchStateTearOff();

/// @nodoc
mixin _$SearchState {
  bool get searchBarEmpty => throw _privateConstructorUsedError;
  List<SearchResult> get searchResults => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SearchStateCopyWith<SearchState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchStateCopyWith<$Res> {
  factory $SearchStateCopyWith(
          SearchState value, $Res Function(SearchState) then) =
      _$SearchStateCopyWithImpl<$Res>;
  $Res call({bool searchBarEmpty, List<SearchResult> searchResults});
}

/// @nodoc
class _$SearchStateCopyWithImpl<$Res> implements $SearchStateCopyWith<$Res> {
  _$SearchStateCopyWithImpl(this._value, this._then);

  final SearchState _value;
  // ignore: unused_field
  final $Res Function(SearchState) _then;

  @override
  $Res call({
    Object? searchBarEmpty = freezed,
    Object? searchResults = freezed,
  }) {
    return _then(_value.copyWith(
      searchBarEmpty: searchBarEmpty == freezed
          ? _value.searchBarEmpty
          : searchBarEmpty // ignore: cast_nullable_to_non_nullable
              as bool,
      searchResults: searchResults == freezed
          ? _value.searchResults
          : searchResults // ignore: cast_nullable_to_non_nullable
              as List<SearchResult>,
    ));
  }
}

/// @nodoc
abstract class _$SearchStateCopyWith<$Res>
    implements $SearchStateCopyWith<$Res> {
  factory _$SearchStateCopyWith(
          _SearchState value, $Res Function(_SearchState) then) =
      __$SearchStateCopyWithImpl<$Res>;
  @override
  $Res call({bool searchBarEmpty, List<SearchResult> searchResults});
}

/// @nodoc
class __$SearchStateCopyWithImpl<$Res> extends _$SearchStateCopyWithImpl<$Res>
    implements _$SearchStateCopyWith<$Res> {
  __$SearchStateCopyWithImpl(
      _SearchState _value, $Res Function(_SearchState) _then)
      : super(_value, (v) => _then(v as _SearchState));

  @override
  _SearchState get _value => super._value as _SearchState;

  @override
  $Res call({
    Object? searchBarEmpty = freezed,
    Object? searchResults = freezed,
  }) {
    return _then(_SearchState(
      searchBarEmpty: searchBarEmpty == freezed
          ? _value.searchBarEmpty
          : searchBarEmpty // ignore: cast_nullable_to_non_nullable
              as bool,
      searchResults: searchResults == freezed
          ? _value.searchResults
          : searchResults // ignore: cast_nullable_to_non_nullable
              as List<SearchResult>,
    ));
  }
}

/// @nodoc

class _$_SearchState with DiagnosticableTreeMixin implements _SearchState {
  const _$_SearchState(
      {this.searchBarEmpty = true, this.searchResults = const []});

  @JsonKey(defaultValue: true)
  @override
  final bool searchBarEmpty;
  @JsonKey(defaultValue: const [])
  @override
  final List<SearchResult> searchResults;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SearchState(searchBarEmpty: $searchBarEmpty, searchResults: $searchResults)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'SearchState'))
      ..add(DiagnosticsProperty('searchBarEmpty', searchBarEmpty))
      ..add(DiagnosticsProperty('searchResults', searchResults));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _SearchState &&
            (identical(other.searchBarEmpty, searchBarEmpty) ||
                const DeepCollectionEquality()
                    .equals(other.searchBarEmpty, searchBarEmpty)) &&
            (identical(other.searchResults, searchResults) ||
                const DeepCollectionEquality()
                    .equals(other.searchResults, searchResults)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(searchBarEmpty) ^
      const DeepCollectionEquality().hash(searchResults);

  @JsonKey(ignore: true)
  @override
  _$SearchStateCopyWith<_SearchState> get copyWith =>
      __$SearchStateCopyWithImpl<_SearchState>(this, _$identity);
}

abstract class _SearchState implements SearchState {
  const factory _SearchState(
      {bool searchBarEmpty, List<SearchResult> searchResults}) = _$_SearchState;

  @override
  bool get searchBarEmpty => throw _privateConstructorUsedError;
  @override
  List<SearchResult> get searchResults => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$SearchStateCopyWith<_SearchState> get copyWith =>
      throw _privateConstructorUsedError;
}
