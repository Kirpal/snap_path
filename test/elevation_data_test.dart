import 'package:distance/distance.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:snap_path/models/elevation_data.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  final points1 = [
    ElevationPoint(distance: Distance(meters: 0), elevation: Distance(meters: 100)),
    ElevationPoint(distance: Distance(meters: 1), elevation: Distance(meters: 101)),
    ElevationPoint(distance: Distance(meters: 2), elevation: Distance(meters: 102)),
    ElevationPoint(distance: Distance(meters: 3), elevation: Distance(meters: 101)),
    ElevationPoint(distance: Distance(meters: 4), elevation: Distance(meters: 100)),
    ElevationPoint(distance: Distance(meters: 5), elevation: Distance(meters: 96)),
    ElevationPoint(distance: Distance(meters: 6), elevation: Distance(meters: 101)),
    ElevationPoint(distance: Distance(meters: 7), elevation: Distance(meters: 97)),
  ];
  final points1Filtered = [
    ElevationPoint(distance: Distance(meters: 0), elevation: Distance(meters: 100)),
    ElevationPoint(distance: Distance(meters: 5), elevation: Distance(meters: 96)),
    ElevationPoint(distance: Distance(meters: 6), elevation: Distance(meters: 101)),
    ElevationPoint(distance: Distance(meters: 7), elevation: Distance(meters: 97)),
  ];

  final points2 = [
    ElevationPoint(distance: Distance(meters: 0), elevation: Distance(meters: 100)),
    ElevationPoint(distance: Distance(meters: 1), elevation: Distance(meters: 101)),
    ElevationPoint(distance: Distance(meters: 2), elevation: Distance(meters: 102)),
    ElevationPoint(distance: Distance(meters: 3), elevation: Distance(meters: 101)),
    ElevationPoint(distance: Distance(meters: 4), elevation: Distance(meters: 100)),
    ElevationPoint(distance: Distance(meters: 5), elevation: Distance(meters: 96)),
    ElevationPoint(distance: Distance(meters: 6), elevation: Distance(meters: 101)),
    ElevationPoint(distance: Distance(meters: 7), elevation: Distance(meters: 97)),
    ElevationPoint(distance: Distance(meters: 7), elevation: Distance(meters: 100)),
    ElevationPoint(distance: Distance(meters: 8), elevation: Distance(meters: 101)),
    ElevationPoint(distance: Distance(meters: 9), elevation: Distance(meters: 102)),
    ElevationPoint(distance: Distance(meters: 10), elevation: Distance(meters: 101)),
    ElevationPoint(distance: Distance(meters: 11), elevation: Distance(meters: 100)),
    ElevationPoint(distance: Distance(meters: 12), elevation: Distance(meters: 96)),
    ElevationPoint(distance: Distance(meters: 13), elevation: Distance(meters: 101)),
    ElevationPoint(distance: Distance(meters: 14), elevation: Distance(meters: 97)),
  ];
  final points2Filtered = [
    ElevationPoint(distance: Distance(meters: 0), elevation: Distance(meters: 100)),
    ElevationPoint(distance: Distance(meters: 5), elevation: Distance(meters: 96)),
    ElevationPoint(distance: Distance(meters: 6), elevation: Distance(meters: 101)),
    ElevationPoint(distance: Distance(meters: 7), elevation: Distance(meters: 97)),
    ElevationPoint(distance: Distance(meters: 8), elevation: Distance(meters: 101)),
    ElevationPoint(distance: Distance(meters: 12), elevation: Distance(meters: 96)),
    ElevationPoint(distance: Distance(meters: 13), elevation: Distance(meters: 101)),
    ElevationPoint(distance: Distance(meters: 14), elevation: Distance(meters: 97)),
  ];

  test('hasData', () {
    expect(ElevationData().hasData, false);
    expect(ElevationData.from([]).hasData, false);
    expect(ElevationData.from(points1).hasData, true);
    expect(ElevationData.from([ElevationPoint(distance: Distance(meters: 1), elevation: Distance(meters: 1))]).hasData, true);
  });
  
  test('add', () {
    var elevationData1 = ElevationData();
    expect(elevationData1, ElevationData());
    elevationData1.add(ElevationData());
    expect(elevationData1, ElevationData());
    elevationData1.add(ElevationData.from([]));
    expect(elevationData1, ElevationData());
    elevationData1.add(ElevationData.from(points1));
    expect(elevationData1, ElevationData.from(points1));
    elevationData1.add(ElevationData.from(points1));
    expect(elevationData1, ElevationData.from(points2));
  });

  test('points (filtered)', () {
    expect(ElevationData.from(points1).filtered, points1Filtered);
    expect(ElevationData.from(points2).filtered, points2Filtered);
  });

  test('gain', () {
    expect(ElevationData.from(points1).gain.inMeters, 5);
    expect(ElevationData.from(points2).gain.inMeters, 14);
  });
}