library initial_route_client;

import 'package:route/route.dart';
import 'package:rxdart/rxdart.dart';

/// {@template initial_route_client}
/// A client to create an initial route on app launch
/// and handle certain app launch intents
/// {@endtemplate}
abstract class InitialRouteClient {
  /// {@macro initial_route_client}
  const InitialRouteClient();

  /// Initialize the drawn route with any incoming intent (sharing, link, etc)
  Future<void> initialize();

  /// A stream of routes being loaded into the app
  Stream<Route> get routes;
}

/// {@template multi_initial_route_client}
/// An [InitialRouteClient] that merges multiple clients together
/// {@endtemplate}
class MultiInitialRouteClient extends InitialRouteClient {
  /// {@macro multi_initial_route_client}
  const MultiInitialRouteClient({required this.clients});

  /// The clients that this client defers to
  final List<InitialRouteClient> clients;

  @override
  Future<void> initialize() => Future.forEach<InitialRouteClient>(
        clients,
        (c) => c.initialize(),
      );

  @override
  Stream<Route> get routes => MergeStream(clients.map((c) => c.routes));
}
