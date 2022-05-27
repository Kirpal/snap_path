// ignore_for_file: prefer_const_constructors
import 'package:elevation_repository/elevation_repository.dart';
import 'package:mapbox_api_client/mapbox_api_client.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

class MockMapboxApiClient extends Mock implements MapboxApiClient {}

void main() {
  group('ElevationRepository', () {
    late MapboxApiClient apiClient;

    setUp(() {
      apiClient = MockMapboxApiClient();
    });

    test('can be instantiated', () {
      expect(ElevationRepository(apiClient: apiClient), isNotNull);
    });
  });
}
