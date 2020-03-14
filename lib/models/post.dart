import 'package:cloud_firestore/cloud_firestore.dart';

class Post {
  DateTime date;
  String imageURL;
  int quantity;
  GeoPoint geolocation;

  Post({
    this.date,
    this.imageURL,
    this.quantity,
    this.geolocation,
  });

  Post.fromFirestore(dynamic document) {
    this.date = document['date'].toDate();
    this.imageURL = document['imageURL'];
    this.quantity = document['quantity'];
    this.geolocation = document['geolocation'];
  }

  double get latitude => this.geolocation.latitude;
  double get longitude => this.geolocation.longitude;

  Map<String, dynamic> toMap() {
    assert(date != null);
    assert(imageURL != null);
    assert(geolocation != null);
    assert(quantity != null);

    return {
      'date': this.date,
      'imageURL': this.imageURL,
      'geolocation': this.geolocation,
      'quantity': this.quantity,
    };
  }
}
