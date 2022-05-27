import 'dart:io';

import 'package:initial_route_client/initial_route_client.dart';
import 'package:receive_sharing_intent/receive_sharing_intent.dart';
import 'package:route/route.dart';
import 'package:rxdart/rxdart.dart';

/// {@template shared_file_initial_route_client}
/// A client for handling initial routes coming from shared files (gpx)
/// {@endtemplate}
class SharedFileInitialRouteClient implements InitialRouteClient {
  /// {@macro shared_file_initial_route_client}
  SharedFileInitialRouteClient() : _routeController = BehaviorSubject();

  final BehaviorSubject<Route> _routeController;

  @override
  Future<void> initialize() async {
    _processSharedFiles(await ReceiveSharingIntent.getInitialMedia());

    ReceiveSharingIntent.getMediaStream().listen(_processSharedFiles);
  }

  @override
  Stream<Route> get routes => _routeController.stream;

  /// Process the given list of shared media files (which can be null or empty)
  void _processSharedFiles(List<SharedMediaFile> files) async {
    if (files.isNotEmpty) {
      try {
        final xml = await File(files.first.path).readAsString();

        _routeController.add(Route.fromGpx(xml));
      } catch (e, s) {
        _routeController.addError(e, s);
      }
    }
  }
}
