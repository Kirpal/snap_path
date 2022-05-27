// ignore_for_file: prefer_const_constructors
import 'package:mapbox_api_client/mapbox_api_client.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';
import 'package:search_repository/search_repository.dart';

class MockMapboxApiClient extends Mock implements MapboxApiClient {}

void main() {
  group('SearchRepository', () {
    late MapboxApiClient mapboxApiClient;

    setUp(() {
      mapboxApiClient = MockMapboxApiClient();
    });

    test('can be instantiated', () {
      expect(SearchRepository(apiClient: mapboxApiClient), isNotNull);
    });
  });
}
