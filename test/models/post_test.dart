import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:test/test.dart';
import 'package:wasteagram/models/post.dart';

void main() {
  group('Post', () {
    test('should be correctly formed from fromFirestore constructor', () {
      final date = DateTime.utc(2020, DateTime.march, 1);
      final timestamp = Timestamp.fromDate(date);
      final imageURL = 'https://i.imgur.com/wN56Svx.jpg';
      final geolocation = GeoPoint(-33, 177);
      final quantity = 42;

      final mockDocument = {
        'date': timestamp,
        'imageURL': imageURL,
        'quantity': quantity,
        'geolocation': geolocation,
      };

      final post = Post.fromFirestore(mockDocument);

      expect(post.date, date.toLocal());
      expect(post.imageURL, imageURL);
      expect(post.quantity, quantity);
      expect(post.geolocation, geolocation);
    });

    test('should correctly return map from toMap', () {
      final date = DateTime.utc(2020, DateTime.march, 1);
      final imageURL = 'https://i.imgur.com/wN56Svx.jpg';
      final geolocation = GeoPoint(-33, 177);
      final quantity = 42;
      final post = Post(
        date: date,
        imageURL: imageURL,
        geolocation: geolocation,
        quantity: quantity,
      );

      final map = post.toMap();

      expect(map['date'], date);
      expect(map['imageURL'], imageURL);
      expect(map['quantity'], quantity);
      expect(map['geolocation'], geolocation);
    });
  });
}
