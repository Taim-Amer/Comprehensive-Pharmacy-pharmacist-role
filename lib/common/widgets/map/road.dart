import 'package:comprehensive_pharmacy_pharmacy_role/utils/constants/colors.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/utils/services/map_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class TRoad extends StatelessWidget {
  const TRoad({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<List<LatLng>>(
      valueListenable: TMapServices.routeNotifier,
      builder: (context, route, child) {
        if (route.isNotEmpty) {
          return PolylineLayer(
            polylines: [
              Polyline(
                points: route,
                strokeWidth: 4.0,
                color: TColors.primary,
              ),
            ],
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
