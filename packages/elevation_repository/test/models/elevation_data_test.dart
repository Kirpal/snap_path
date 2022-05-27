// import 'package:distance/distance.dart';
// import 'package:elevation_repository/elevation_repository.dart';
// import 'package:test/test.dart';

// void main() {
//   final points1 = [
//     ElevationPoint(
//       distance: const Distance(meters: 0),
//       elevation: const Distance(meters: 100),
//     ),
//     ElevationPoint(
//       distance: const Distance(meters: 1),
//       elevation: const Distance(meters: 101),
//     ),
//     ElevationPoint(
//       distance: const Distance(meters: 2),
//       elevation: const Distance(meters: 102),
//     ),
//     ElevationPoint(
//       distance: const Distance(meters: 3),
//       elevation: const Distance(meters: 101),
//     ),
//     ElevationPoint(
//       distance: const Distance(meters: 4),
//       elevation: const Distance(meters: 100),
//     ),
//     ElevationPoint(
//       distance: const Distance(meters: 5),
//       elevation: const Distance(meters: 96),
//     ),
//     ElevationPoint(
//       distance: const Distance(meters: 6),
//       elevation: const Distance(meters: 101),
//     ),
//     ElevationPoint(
//       distance: const Distance(meters: 7),
//       elevation: const Distance(meters: 97),
//     ),
//   ];
//   final points1Filtered = [
//     ElevationPoint(
//       distance: const Distance(meters: 0),
//       elevation: const Distance(meters: 100),
//     ),
//     ElevationPoint(
//       distance: const Distance(meters: 5),
//       elevation: const Distance(meters: 96),
//     ),
//     ElevationPoint(
//       distance: const Distance(meters: 6),
//       elevation: const Distance(meters: 101),
//     ),
//     ElevationPoint(
//       distance: const Distance(meters: 7),
//       elevation: const Distance(meters: 97),
//     ),
//   ];

//   final points2 = [
//     ElevationPoint(
//       distance: const Distance(meters: 0),
//       elevation: const Distance(meters: 100),
//     ),
//     ElevationPoint(
//       distance: const Distance(meters: 1),
//       elevation: const Distance(meters: 101),
//     ),
//     ElevationPoint(
//       distance: const Distance(meters: 2),
//       elevation: const Distance(meters: 102),
//     ),
//     ElevationPoint(
//       distance: const Distance(meters: 3),
//       elevation: const Distance(meters: 101),
//     ),
//     ElevationPoint(
//       distance: const Distance(meters: 4),
//       elevation: const Distance(meters: 100),
//     ),
//     ElevationPoint(
//       distance: const Distance(meters: 5),
//       elevation: const Distance(meters: 96),
//     ),
//     ElevationPoint(
//       distance: const Distance(meters: 6),
//       elevation: const Distance(meters: 101),
//     ),
//     ElevationPoint(
//       distance: const Distance(meters: 7),
//       elevation: const Distance(meters: 97),
//     ),
//     ElevationPoint(
//       distance: const Distance(meters: 7),
//       elevation: const Distance(meters: 100),
//     ),
//     ElevationPoint(
//       distance: const Distance(meters: 8),
//       elevation: const Distance(meters: 101),
//     ),
//     ElevationPoint(
//       distance: const Distance(meters: 9),
//       elevation: const Distance(meters: 102),
//     ),
//     ElevationPoint(
//       distance: const Distance(meters: 10),
//       elevation: const Distance(meters: 101),
//     ),
//     ElevationPoint(
//       distance: const Distance(meters: 11),
//       elevation: const Distance(meters: 100),
//     ),
//     ElevationPoint(
//       distance: const Distance(meters: 12),
//       elevation: const Distance(meters: 96),
//     ),
//     ElevationPoint(
//       distance: const Distance(meters: 13),
//       elevation: const Distance(meters: 101),
//     ),
//     ElevationPoint(
//       distance: const Distance(meters: 14),
//       elevation: const Distance(meters: 97),
//     ),
//   ];
//   final points2Filtered = [
//     ElevationPoint(
//       distance: const Distance(meters: 0),
//       elevation: const Distance(meters: 100),
//     ),
//     ElevationPoint(
//       distance: const Distance(meters: 5),
//       elevation: const Distance(meters: 96),
//     ),
//     ElevationPoint(
//       distance: const Distance(meters: 6),
//       elevation: const Distance(meters: 101),
//     ),
//     ElevationPoint(
//       distance: const Distance(meters: 7),
//       elevation: const Distance(meters: 97),
//     ),
//     ElevationPoint(
//       distance: const Distance(meters: 8),
//       elevation: const Distance(meters: 101),
//     ),
//     ElevationPoint(
//       distance: const Distance(meters: 12),
//       elevation: const Distance(meters: 96),
//     ),
//     ElevationPoint(
//       distance: const Distance(meters: 13),
//       elevation: const Distance(meters: 101),
//     ),
//     ElevationPoint(
//       distance: const Distance(meters: 14),
//       elevation: const Distance(meters: 97),
//     ),
//   ];

//   test('hasData', () {
//     expect(ElevationData().hasData, false);
//     expect(ElevationData.from([]).hasData, false);
//     expect(ElevationData.from(points1).hasData, true);
//     expect(
//         ElevationData.from([
//           ElevationPoint(
//               distance: const Distance(meters: 1),
//               elevation: const Distance(meters: 1))
//         ]).hasData,
//         true);
//   });

//   test('add', () {
//     final elevationData1 = ElevationData();
//     expect(elevationData1, ElevationData());
//     elevationData1.add(ElevationData());
//     expect(elevationData1, ElevationData());
//     elevationData1.add(ElevationData.from([]));
//     expect(elevationData1, ElevationData());
//     elevationData1.add(ElevationData.from(points1));
//     expect(elevationData1, ElevationData.from(points1));
//     elevationData1.add(ElevationData.from(points1));
//     expect(elevationData1, ElevationData.from(points2));
//   });

//   test('points (filtered)', () {
//     expect(ElevationData.from(points1).filtered, points1Filtered);
//     expect(ElevationData.from(points2).filtered, points2Filtered);
//   });

//   test('gain', () {
//     expect(ElevationData.from(points1).gain.inMeters, 5);
//     expect(ElevationData.from(points2).gain.inMeters, 14);
//   });
// }
