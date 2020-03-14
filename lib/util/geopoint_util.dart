import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:location/location.dart';

Future<GeoPoint> getCurrentLocation() async {
  final locationService = Location();
  final locationData = await locationService.getLocation();

  return GeoPoint(locationData.latitude, locationData.longitude);
}
