import 'package:flutter_test/flutter_test.dart';
import 'package:snap_path/models/elevation_data.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  final points1 = [
    ElevationPoint(distance: 0, elevation: 100),
    ElevationPoint(distance: 1, elevation: 101),
    ElevationPoint(distance: 2, elevation: 102),
    ElevationPoint(distance: 3, elevation: 101),
    ElevationPoint(distance: 4, elevation: 100),
    ElevationPoint(distance: 5, elevation: 96),
    ElevationPoint(distance: 6, elevation: 101),
    ElevationPoint(distance: 7, elevation: 97),
  ];
  final points1Filtered = [
    ElevationPoint(distance: 0, elevation: 100),
    ElevationPoint(distance: 5, elevation: 96),
    ElevationPoint(distance: 6, elevation: 101),
    ElevationPoint(distance: 7, elevation: 97),
  ];

  final points2 = [
    ElevationPoint(distance: 0, elevation: 100),
    ElevationPoint(distance: 1, elevation: 101),
    ElevationPoint(distance: 2, elevation: 102),
    ElevationPoint(distance: 3, elevation: 101),
    ElevationPoint(distance: 4, elevation: 100),
    ElevationPoint(distance: 5, elevation: 96),
    ElevationPoint(distance: 6, elevation: 101),
    ElevationPoint(distance: 7, elevation: 97),
    ElevationPoint(distance: 7, elevation: 100),
    ElevationPoint(distance: 8, elevation: 101),
    ElevationPoint(distance: 9, elevation: 102),
    ElevationPoint(distance: 10, elevation: 101),
    ElevationPoint(distance: 11, elevation: 100),
    ElevationPoint(distance: 12, elevation: 96),
    ElevationPoint(distance: 13, elevation: 101),
    ElevationPoint(distance: 14, elevation: 97),
  ];
  final points2Filtered = [
    ElevationPoint(distance: 0, elevation: 100),
    ElevationPoint(distance: 5, elevation: 96),
    ElevationPoint(distance: 6, elevation: 101),
    ElevationPoint(distance: 7, elevation: 97),
    ElevationPoint(distance: 8, elevation: 101),
    ElevationPoint(distance: 12, elevation: 96),
    ElevationPoint(distance: 13, elevation: 101),
    ElevationPoint(distance: 14, elevation: 97),
  ];

  test('hasData', () {
    expect(ElevationData().hasData, false);
    expect(ElevationData.from([]).hasData, false);
    expect(ElevationData.from(points1).hasData, true);
    expect(ElevationData.from([ElevationPoint(distance: 1, elevation: 1)]).hasData, true);
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