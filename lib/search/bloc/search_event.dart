part of 'search_bloc.dart';

@freezed
class SearchEvent with _$SearchEvent {
  const factory SearchEvent.searchBarChanged({required String value}) =
      _SearchBarChanged;

  const factory SearchEvent.cleared() = _SearchBarCleared;

  const factory SearchEvent.submitted({
    required String value,
    LatLng? center,
  }) = _SearchSubmitted;
}
