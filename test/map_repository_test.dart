import 'dart:io';

import 'package:http/http.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:snap_path/models/elevation_data.dart';
import 'package:snap_path/repositories/map_repository.dart';

import 'test_utils.dart';

class MockMapAPIClient extends Fake implements Client {
  @override
  Future<Response> get(url, {Map<String, String> headers}) async {
    Uri parsedUri;
    if (url is String) {
      parsedUri = Uri.parse(url);
    } else if (url is Uri) {
      parsedUri = url;
    } else {
      throw ArgumentError('URL must be either [String] or [Uri]');
    }

    switch (parsedUri.pathSegments.first) {
      case 'v4':
        var zoom = parsedUri.pathSegments[2];
        var x = parsedUri.pathSegments[3];
        var y = parsedUri.pathSegments[4].split('.')[0];

        var fileBytes = await File('test/resources/tiles/$zoom-$x-$y.png').readAsBytes();

        return Response.bytes(fileBytes, 200);
      case 'directions':
      case 'matching':
        var filename = '${parsedUri.pathSegments.first}-${parsedUri.pathSegments.last.hashCode}';
        return Response(await File('test/resources/json/$filename.json').readAsString(), 200);
    }

    return Response('Not found', 404);
  }
}

bool Function(ElevationData) elevationPred(PathData path) {
  return (ElevationData data) {
    if (data.unfiltered.length != path.elevations.length) return false;
    for (var i = 0; i < data.unfiltered.length; i++) {
      if ((data.unfiltered[i].elevation.inMeters - path.elevations[i]).abs() > path.elevations[i] * 0.05) return false;
    }

    return true;
  };
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  final testApiKey = 'testApiKey';
  final mockClient = MockMapAPIClient();
  final MapRepository repository = MapboxRepository(client: mockClient, apiKey: testApiKey);

  test('getElevation', () async {
    var path1 = await readGpx('test/resources/gpx/onthegomap-22.1-km-route.gpx');
    var path2 = await readGpx('test/resources/gpx/onthegomap-18.2-km-route.gpx');
    var path3 = await readGpx('test/resources/gpx/onthegomap-8.4-km-route.gpx');

    expect(await repository.getElevation(path1.path), predicate(elevationPred(path1)));
    expect(await repository.getElevation(path2.path), predicate(elevationPred(path2)));
    expect(await repository.getElevation(path3.path), predicate(elevationPred(path3)));
  });

  test('matchPath', () async {
    // Testing a path that closely follows the roads point-to-point, polyline verified manually
    var path1 = await readGpx('test/resources/gpx/onthegomap-1.9-km-route.gpx');
    var polyline1 = 'grjsFjz{aSLf@TLnDo@`APjClCp@zBZ^nAl@tD|@f@VLt@F|HS~AG|A^x@zBbB`EzEHv@]Lu@w@kBc@w@e@eCEkCh@@jBMjAwDhF}AfAUnEiAbCHfCIbAa@nA}@z@eAZcCYe@V';
    expect(await repository.matchPath(path1.path), MapUtils.polylineToCoordinates(polyline1));

    // Testing a path with two points snapping to follow roads, polyline verified manually
    var path2 = await readGpx('test/resources/gpx/onthegomap-1.8-km-route.gpx');
    var polyline2 = '}iutGrig`MHmFyDyClAwGaGgQsC{DTm@eFcIqE}OqBeDoCkBqJ{AiMcKuCe@eCf@e@d@';
    expect(await repository.matchPath(path2.path), MapUtils.polylineToCoordinates(polyline2));
  });
}