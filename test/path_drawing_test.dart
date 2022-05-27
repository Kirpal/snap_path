import 'package:flutter_test/flutter_test.dart';
import 'package:latlong/latlong.dart';
import 'package:snap_path/models/path_drawing.dart';
import 'package:snap_path/repositories/map_repository.dart';
import 'package:snap_path/repositories/mapbox_repository.dart';
import 'package:snap_path/utils/map_utils.dart';

import 'test_utils.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  final MapRepository repository = MapboxRepository();
  late PathData path1;
  late PathData path2;
  const polyline2 =
      r'}iutGrig`MHmFyDyClAwGaGgQsC{DTm@eFcIqE}OqBeDoCkBqJ{AiMcKuCe@eCf@e@d@';
  late PathDrawingState state;

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
    expect(
      state.distance.inMeters,
      const Distance().distance(path1.path[0], path1.path[1]),
    );
  });

  test('bounds', () {});

  test('clear()', () {
    path1.path.forEach(state.addPoint);
    expect(state.isNotEmpty, true);
    state.clear();
    expect(state.isNotEmpty, false);
    path1.path.forEach(state.addPoint);
    state.endPath();
    expect(state.isNotEmpty, true);
    state.clear();
    expect(state.isNotEmpty, false);
  });

  test('distanceMarkers', () async {
    final path3 =
        await readGpx('test/resources/gpx/onthegomap-22.1-km-route.gpx');
    path3.path.forEach(state.addPoint);
    var distanceMarkers = state.distanceMarkers(true);
    expect(distanceMarkers.length, state.distance.inKilometers.floor());
    state.clear();
    path1.path.forEach(state.addPoint);
    distanceMarkers = state.distanceMarkers(true);
    expect(distanceMarkers.length, state.distance.inKilometers.floor());
  });

  test('elevation', () {});

  test('endPath()', () async {
    path2.path.forEach(state.addPoint);
    await state.endPath();
    expect(state.coordinates, MapUtils.polylineToCoordinates(polyline2));
  });

  test('multiple concurrent points with undo', () async {
    state.addPoint(path2.path[0]);
    await state.endPath();
    state
      ..undo()
      ..addPoint(path2.path[0]);
    await state.endPath();
    state.addPoint(path2.path[1]);
    await state.endPath();
    await expectLater(
      state.coordinates,
      MapUtils.polylineToCoordinates(polyline2),
    );
  });

  test('highlightedPoint', () {});

  test('highlightPoint', () {});

  test('isNotEmpty', () {});

  test('undo()', () {});

  test('unhighlightPoint()', () {});
}
