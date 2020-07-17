import 'package:flutter_test/flutter_test.dart';
import 'package:latlong/latlong.dart';
import 'package:snap_path/models/path_drawing.dart';
import 'package:snap_path/repositories/map_repository.dart';
import 'package:snap_path/repositories/mapbox_repository.dart';
import 'package:snap_path/utils/map_utils.dart';

import 'map_repository_test.dart';
import 'test_utils.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  final testApiKey = 'testApiKey';
  final mockClient = MockMapAPIClient();
  final MapRepository repository = MapboxRepository(client: mockClient, apiKey: testApiKey);
  PathData path1;
  PathData path2;
  final polyline2 = r'}iutGrig`MHmFyDyClAwGaGgQsC{DTm@eFcIqE}OqBeDoCkBqJ{AiMcKuCe@eCf@e@d@';
  PathDrawingState state;

  setUp(() async {
    state = PathDrawingState(mapRepository: repository);
    path1 = await readGpx('test/resources/gpx/onthegomap-1.9-km-route.gpx');
    path2 = await readGpx('test/resources/gpx/onthegomap-1.8-km-route.gpx');
  });

  test('addPoint()', () {
    expect(state.isNotEmpty, false);
    expect(state.canUndo, false);
    state.addPoint(path1.path[0]);
    expect(state.isNotEmpty, true);
    expect(state.canUndo, false);
    state.addPoint(path1.path[1]);
    expect(state.coordinates, path1.path.sublist(0, 2));
    expect(state.isNotEmpty, true);
    expect(state.distance.inMeters, Distance().distance(path1.path[0], path1.path[1]));
  });

  test('bounds', () {

  });

  test('clear()', () {
    path1.path.forEach((p) => state.addPoint(p));
    expect(state.isNotEmpty, true);
    state.clear();
    expect(state.isNotEmpty, false);
    path1.path.forEach((p) => state.addPoint(p));
    state.endPath();
    expect(state.isNotEmpty, true);
    state.clear();
    expect(state.isNotEmpty, false);
  });

  test('distanceMarkers', () async {
    var path3 = await readGpx('test/resources/gpx/onthegomap-22.1-km-route.gpx');
    path3.path.forEach((p) => state.addPoint(p));
    var distanceMarkers = state.distanceMarkers(true);
    expect(distanceMarkers.length, state.distance.inKilometers.floor());
    state.clear();
    path1.path.forEach((p) => state.addPoint(p));
    distanceMarkers = state.distanceMarkers(true);
    expect(distanceMarkers.length, state.distance.inKilometers.floor());
  });

  test('elevation', () {

  });

  test('endPath()', () async {
    path2.path.forEach((p) => state.addPoint(p));
    await state.endPath();
    expect(state.coordinates, MapUtils.polylineToCoordinates(polyline2));
  });

  test('multiple concurrent points with undo', () async {
    state.addPoint(path2.path[0]);
    state.endPath();
    state.undo();
    state.addPoint(path2.path[0]);
    state.endPath();
    state.addPoint(path2.path[1]);
    await state.endPath();
    expectLater(state.coordinates, MapUtils.polylineToCoordinates(polyline2));
  });

  test('highlightedPoint', () {

  });

  test('highlightPoint', () {

  });

  test('isNotEmpty', () {

  });

  test('undo()', () {

  });

  test('unhighlightPoint()', () {

  });
}
