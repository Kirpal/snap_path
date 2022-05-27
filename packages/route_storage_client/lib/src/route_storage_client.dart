import 'dart:convert';

import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:route/route.dart';

/// {@template route_storage_client}
/// A client to store routes on a device
/// {@endtemplate}
class RouteStorageClient {
  /// {@macro route_storage_client}
  RouteStorageClient();

  static const _databaseName = 'saved_routes';
  static const _routesKey = 'routes';
  static final _adapter = RouteAdapter();
  static var _isInitialized = false;

  late final Box<List> _box;

  /// Initializes this storage instance
  Future<void> initialize() async {
    if (!_isInitialized) {
      Hive.registerAdapter(_adapter);
      await Hive.initFlutter();
      _box = await Hive.openBox(_databaseName);
      _isInitialized = true;
    }
  }

  /// Save the given list of routes
  Future<void> save(List<Route> routes) => _box.put(_routesKey, routes);

  /// Get the saved list of routes
  List<Route> get() => List<Route>.from(_box.get(_routesKey) ?? []);
}

/// A [TypeAdapter] used to store a [Route] in hive db
class RouteAdapter extends TypeAdapter<Route> {
  @override
  final typeId = 0;

  @override
  Route read(BinaryReader reader) {
    return Route.fromJson(json.decode(reader.read()));
  }

  @override
  void write(BinaryWriter writer, Route obj) {
    writer.write(json.encode(obj));
  }
}
