import 'package:flutter/material.dart';
import 'package:flutter_map_location_marker/flutter_map_location_marker.dart';

class TCurrentMarker extends StatelessWidget {
  const TCurrentMarker({super.key});

  @override
  Widget build(BuildContext context) {
    return CurrentLocationLayer(
      alignPositionOnUpdate: AlignOnUpdate.always,
      alignDirectionOnUpdate: AlignOnUpdate.never,
      style: const LocationMarkerStyle(
        headingSectorRadius: 100,
        marker: DefaultLocationMarker(
          child: Icon(
            Icons.location_on,
            color: Colors.white,
          ),
        ),
        markerSize: Size(40, 40),
        markerDirection: MarkerDirection.heading,
      ),
    );
  }
}
