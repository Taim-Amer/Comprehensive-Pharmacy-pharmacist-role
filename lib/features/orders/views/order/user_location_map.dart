import 'package:comprehensive_pharmacy_pharmacy_role/common/widgets/appbar/appbar.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/common/widgets/buttons/back_icon.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/common/widgets/map/current_marker.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/common/widgets/map/road.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/utils/constants/api_constants.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/utils/constants/colors.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/utils/constants/image_strings.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/utils/helpers/helper_functions.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/utils/services/map_services.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/utils/storage/cache_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:latlong2/latlong.dart';

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
  final MapController _mapController = MapController();

  @override
  void initState() {
    super.initState();
    TMapServices.initializeLocation((location) {
      _mapController.move(LatLng(widget.latitude, widget.longitude), 15);
    });

    TMapServices.getRoute2(LatLng(widget.latitude, widget.longitude)).then((route) {
      TMapServices.setRoute([LatLng(widget.latitude, widget.longitude), LatLng(TCacheHelper.getData(key: 'userLat'), TCacheHelper.getData(key: 'userLng'))]);
    });
  }

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: const TAppBar(showBackArrow: true),
      body: Column(
        children: [
          Expanded(
            child: ValueListenableBuilder<LatLng?>(
              valueListenable: TMapServices.currentLocationNotifier,
              builder: (context, currentLocation, child) {
                return FlutterMap(
                  mapController: _mapController,
                  options: MapOptions(

                    initialCenter: currentLocation ?? const LatLng(0, 0),
                    initialZoom: 15,
                  ),
                  children: [
                    TileLayer(
                      urlTemplate: dark ? TApiConstants.darkMap : TApiConstants.lightMap,
                    ),
                    const TCurrentMarker(),
                    // if (_destination != null)
                    MarkerLayer(
                      markers: [
                        Marker(
                          point: LatLng(widget.latitude, widget.longitude),
                          width: 50,
                          height: 50,
                          child: SvgPicture.asset(TImages.searchIcon, color: dark ? TColors.light : TColors.dark),
                        ),
                      ],
                    ),
                    const TRoad(),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
