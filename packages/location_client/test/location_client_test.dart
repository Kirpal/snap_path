// ignore_for_file: prefer_const_constructors
import 'package:flutter_test/flutter_test.dart';
import 'package:location_client/location_client.dart';

void main() {
  group('LocationClient', () {
    test('can be instantiated', () {
      expect(LocationClient(), isNotNull);
    });
  });
}