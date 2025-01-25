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
  late double userLatitude;
  late double userLongitude;

  @override
  void initState() {
    super.initState();
    controller = MapController(
      areaLimit: const BoundingBox(
        east: 100,
        north: 86.0,
        south: -86.0,
        west: -100,
      ),
      initMapWithUserPosition: const UserTrackingOption.withoutUserPosition(
        enableTracking: true,
        unFollowUser: false,
      ),
    );

    _getUserLocation(); // استدعاء دالة الموقع عند بدء التشغيل
  }

  Future<void> _getUserLocation() async {
    final userPosition = await controller.myLocation();
    setState(() {
      userLatitude = userPosition.latitude;
      userLongitude = userPosition.longitude;
    });

    TCacheHelper.saveData(key: 'user_lat', value: userLatitude);
    TCacheHelper.saveData(key: 'user_lng', value: userLongitude);

    // تكبير على الموقع الحالي
    await controller.moveTo(
      animate: true,
      GeoPoint(latitude: userLatitude, longitude: userLongitude),
      // zoomLevel: 18, // حدد مستوى التكبير الذي تريده هنا
    );
  }


  // Future<void> _getUserLocation() async {
  //   final userPosition = await controller.myLocation();
  //   setState(() {
  //     userLatitude = userPosition.latitude;
  //     userLongitude = userPosition.longitude;
  //   });
  //
  //   TCacheHelper.saveData(key: 'user_lat', value: userLatitude);
  //   TCacheHelper.saveData(key: 'user_lng', value: userLongitude);
  //
  //   print(
  //       "==========================================================================================");
  //   print(TCacheHelper.saveData(key: 'user_lat', value: userLatitude));
  //   print(TCacheHelper.saveData(key: 'user_lng', value: userLongitude));
  //
  //   controller.goToLocation(userPosition);
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TAppBar(showBackArrow: true),
      body: OSMFlutter(
        controller: controller,
        onMapMoved: (Region re){
          print(TCacheHelper.getData(key: 'user_lat'));
        },
        osmOption: OSMOption(
          // userLocationMarker: UserLocationMaker(
          //   personMarker: MarkerIcon(
          //     iconWidget: SvgPicture.asset(TImages.searchIcon),
          //   ),
          //   directionArrowMarker:
          //       MarkerIcon(iconWidget: SvgPicture.asset(TImages.searchIcon)),
          // ),
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
              "user_location",
              MarkerIcon(
                iconWidget: SvgPicture.asset(TImages.searchIcon),
              ),
              [
                GeoPoint(
                  latitude: userLatitude,
                  longitude: userLongitude,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
