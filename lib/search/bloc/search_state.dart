part of 'search_bloc.dart';

@freezed
class SearchState with _$SearchState {
  const factory SearchState({
    @Default(true) bool searchBarEmpty,
    @Default([]) List<SearchResult> searchResults,
  }) = _SearchState;
}
