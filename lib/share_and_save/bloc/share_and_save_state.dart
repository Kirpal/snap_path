part of 'share_and_save_bloc.dart';

@freezed
class ShareAndSaveState with _$ShareAndSaveState {
  const factory ShareAndSaveState.loading() = _Loading;
  const factory ShareAndSaveState.loaded({
    required List<Route> savedRoutes,
  }) = _Loaded;
}
