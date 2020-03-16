import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  group('Wasteagram', () {
    const sampleDocument = {
      'documentId': 'GW32Pixby5ybFYf0lBtG',
      'quantityLabel': 'Items: 23',
      'dateLabel': 'Saturday, Mar. 14 2020',
      'locationLabel': '(-122.084, 37.4219983)'
    };

    final sampleTile = find.byValueKey(sampleDocument['documentId']);

    FlutterDriver driver;

    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    tearDownAll(() async {
      if (driver != null) {
        driver.close();
      }
    });

    test('navigates to correct details view', () async {
      await driver.waitFor(sampleTile);

      await driver.tap(sampleTile);

      expect(await driver.getText(find.byValueKey('detailsDate')), sampleDocument['dateLabel']); 
      expect(await driver.getText(find.byValueKey('detailsQuantity')), sampleDocument['quantityLabel']); 
      expect(await driver.getText(find.byValueKey('detailsLocation')), sampleDocument['locationLabel']); 
    });
  });
}