import 'package:route/route.dart';
import 'package:rxdart/rxdart.dart';
import 'package:route_storage_client/route_storage_client.dart';

/// {@template saved_route_repository}
/// A repository for saving and retrieving saved routes
/// {@endtemplate}
class SavedRouteRepository {
  /// {@macro saved_route_repository}
  SavedRouteRepository({RouteStorageClient? storageClient})
      : _savedRoutesSubject = BehaviorSubject(),
        _storageClient = storageClient ?? RouteStorageClient();

  final BehaviorSubject<List<Route>> _savedRoutesSubject;
  final RouteStorageClient _storageClient;

  /// A stream of the currently saved routes
  Stream<List<Route>> get savedRoutes => _savedRoutesSubject.stream;

  /// Load the currently saved routes from storage
  Future<void> loadSavedRoutes() async {
    await _storageClient.initialize();

    final routes = _storageClient.get();
    _savedRoutesSubject.add(routes);
  }

  /// Save the given route
  void save(Route route) {
    final newRoutes = List.of(_savedRoutesSubject.valueOrNull ?? <Route>[])
      ..insert(0, route);

    _savedRoutesSubject.add(newRoutes);

    _storageClient.save(newRoutes);
  }

  /// Delete the given saved route
  ///
  /// Does nothing if the route isn't saved
  void delete(Route route) {
    final newRoutes = List.of(_savedRoutesSubject.valueOrNull ?? <Route>[])
      ..remove(route);

    _savedRoutesSubject.add(newRoutes);

    _storageClient.save(newRoutes);
  }
}
