import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:initial_route_client/initial_route_client.dart';
import 'package:route/route.dart';
import 'package:rxdart/rxdart.dart';

/// {@template dynamic_link_initial_route_client}
/// An client for handling initial routes coming from dynamic links
/// {@endtemplate}
class DynamicLinkInitialRouteClient implements InitialRouteClient {
  /// {@macro dynamic_link_initial_route_client}
  DynamicLinkInitialRouteClient() : _routeController = BehaviorSubject();

  final BehaviorSubject<Route> _routeController;

  @override
  Future<void> initialize() async {
    _processDynamicLink(await FirebaseDynamicLinks.instance.getInitialLink());

    FirebaseDynamicLinks.instance.onLink(onSuccess: (data) {
      _processDynamicLink(data);
      return Future.value(true);
    });
  }

  @override
  Stream<Route> get routes => _routeController.stream;

  /// Process the given dynamic link data (which can be null) and add it to the
  /// stream
  void _processDynamicLink(PendingDynamicLinkData? data) {
    if (data != null &&
        data.link.pathSegments.length == 2 &&
        data.link.pathSegments.first == 'route') {
      _routeController.add(Route.fromPolyline(data.link.pathSegments[1]));
    }
  }
}
