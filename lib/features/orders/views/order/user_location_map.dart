import 'package:comprehensive_pharmacy_pharmacy_role/common/widgets/appbar/appbar.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/common/widgets/buttons/back_icon.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/utils/constants/image_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
import 'package:flutter_svg/flutter_svg.dart';

class UserLocationMap extends StatefulWidget {
  final double latitude;
  final double longitude;

  const UserLocationMap({
    super.key,
    required this.latitude,
    required this.longitude,
  });

  @override
  State<UserLocationMap> createState() => _UserLocationMapState();
}

class _UserLocationMapState extends State<UserLocationMap> {
  late MapController controller;

  @override
  void initState() {
    super.initState();
    controller = MapController(
      initPosition: GeoPoint(
        latitude: widget.latitude,
        longitude: widget.longitude,
      ),
      areaLimit: const BoundingBox(
        east: 100,
        north: 86.0,
        south: -86.0,
        west: -100,
      ),
    );

    WidgetsBinding.instance.addPersistentFrameCallback((_) async {
      await controller.goToLocation(
        GeoPoint(
          latitude: widget.latitude,
          longitude: widget.longitude,
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TAppBar(title: BackIcon(), backgroundColor: Colors.transparent,),
      body: OSMFlutter(
        controller: controller,
        osmOption: OSMOption(
          userTrackingOption: const UserTrackingOption(
            enableTracking: false,
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
              "selectedLocation",
              MarkerIcon(
                iconWidget: SvgPicture.asset(TImages.searchIcon),
              ),
              [
                GeoPoint(
                  latitude: widget.latitude,
                  longitude: widget.longitude,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
