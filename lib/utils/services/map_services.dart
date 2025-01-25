import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';
import 'package:location/location.dart';
import 'package:http/http.dart' as http;

class TMapServices {
  TMapServices._();

  static final ValueNotifier<LatLng?> currentLocationNotifier = ValueNotifier<LatLng?>(null);
  static final ValueNotifier<List<LatLng>> routeNotifier = ValueNotifier<List<LatLng>>([]);
  static final Location _locationService = Location();

  static Future<bool> checkAndRequestPermissions() async {
    bool serviceEnabled = await _locationService.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await _locationService.requestService();
      if (!serviceEnabled) return false;
    }
    PermissionStatus permissionGranted = await _locationService.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await _locationService.requestPermission();
      if (permissionGranted != PermissionStatus.granted) return false;
    }
    return true;
  }

  static Future<void> initializeLocation(Function(LatLng) onLocationUpdate) async {
    if (!await checkAndRequestPermissions()) return;

    _locationService.onLocationChanged.listen((LocationData locationData) {
      if (locationData.latitude != null && locationData.longitude != null) {
        final newLocation = LatLng(locationData.latitude!, locationData.longitude!);
        currentLocationNotifier.value = newLocation;
        onLocationUpdate(newLocation);
      }
    });
  }

  static Future<void> getCoordinates(
      String location, Function(LatLng) onDestinationUpdate) async {
    final url = Uri.parse(
        'https://nominatim.openstreetmap.org/search?q=$location&format=json&limit=1');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      if (data.isNotEmpty) {
        final lat = double.parse(data[0]['lat']);
        final lon = double.parse(data[0]['lon']);
        final destination = LatLng(lat, lon);
        onDestinationUpdate(destination);
        await getRoute(destination);
      }
    }
  }

  static Future<void> getRoute(LatLng destination) async {
    final currentLocation = currentLocationNotifier.value;
    if (currentLocation == null) return;

    final url = Uri.parse(
        'http://router.project-osrm.org/route/v1/driving/${currentLocation.longitude},${currentLocation.latitude};${destination.longitude},${destination.latitude}?overview=full&geometries=polyline');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final geometry = data['routes'][0]['geometry'];
      final routePolyline = decodePolyline(geometry);
      routeNotifier.value = routePolyline
          .map((point) => LatLng(point[0], point[1]))
          .toList();
    }
  }

  static List<List<double>> decodePolyline(String polyline) {
    const factor = 1e5;
    List<List<double>> points = [];
    int index = 0;
    int len = polyline.length;
    int lat = 0;
    int lon = 0;

    while (index < len) {
      int shift = 0;
      int result = 0;
      int byte;
      do {
        byte = polyline.codeUnitAt(index++) - 63;
        result |= (byte & 0x1f) << shift;
        shift += 5;
      } while (byte >= 0x20);
      int dlat = (result & 1) != 0 ? ~(result >> 1) : result >> 1;
      lat += dlat;
      shift = 0;
      result = 0;

      do {
        byte = polyline.codeUnitAt(index++) - 63;
        result |= (byte & 0x1f) << shift;
        shift += 5;
      } while (byte >= 0x20);

      int dlng = (result & 1) != 0 ? ~(result >> 1) : result >> 1;
      lon += dlng;
      points.add([lat / factor, lon / factor]);
    }
    return points;
  }
}
