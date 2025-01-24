import 'package:comprehensive_pharmacy_pharmacy_role/common/widgets/appbar/appbar.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/utils/constants/image_strings.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/utils/storage/cache_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LocationMap extends StatefulWidget {
  const LocationMap({super.key});

  @override
  State<LocationMap> createState() => _LocationMapState();
}

class _LocationMapState extends State<LocationMap> {
  late MapController controller;
  double? userLatitude;
  double? userLongitude;

  @override
  void initState() {
    super.initState();
    controller = MapController(
      initPosition: GeoPoint(latitude: 30.7333, longitude: 30.7333),
    );
    _getUserLocation();
  }

  Future<void> _getUserLocation() async {
    final userPosition = await controller.myLocation();
    setState(() {
      userLatitude = userPosition.latitude;
      userLongitude = userPosition.longitude;
    });

    TCacheHelper.saveData(key: 'user_lat', value: userLatitude);
    TCacheHelper.saveData(key: 'user_lng', value: userLongitude);

    controller.goToLocation(userPosition);
    }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TAppBar(showBackArrow: true),
      body: OSMFlutter(
        controller: controller,
        osmOption: OSMOption(
          userTrackingOption: const UserTrackingOption(
            enableTracking: true,
            unFollowUser: false,
          ),
          zoomOption: const ZoomOption(
            initZoom: 15,
            minZoomLevel: 3,
            maxZoomLevel: 19,
            stepZoom: 1.0,
          ),
          staticPoints: [
            StaticPositionGeoPoint(
              "user_location",
              MarkerIcon(
                iconWidget: SvgPicture.asset(TImages.searchIcon),
              ),
              [
                GeoPoint(
                  latitude: userLatitude ?? 30.7333,
                  longitude: userLongitude ?? 30.7333,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
