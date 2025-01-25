// ignore_for_file: library_private_types_in_public_api
import 'package:comprehensive_pharmacy_pharmacy_role/common/widgets/appbar/appbar.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/common/widgets/map/current_marker.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/common/widgets/map/road.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/utils/constants/api_constants.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/utils/helpers/exports.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/utils/services/map_services.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/utils/storage/cache_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:latlong2/latlong.dart';
import 'package:flutter_map/flutter_map.dart';

class LocationMap extends StatefulWidget {
  const LocationMap({super.key});

  @override
  _LocationMapState createState() => _LocationMapState();
}

class _LocationMapState extends State<LocationMap> {
  final MapController _mapController = MapController();
  final TextEditingController _locationController = TextEditingController();

  LatLng? _destination;

  @override
  void initState() {
    super.initState();
    TMapServices.initializeLocation((location) {
      _mapController.move(location, 15);
    });
  }

  void _searchLocation() {
    final location = _locationController.text.trim();
    if (location.isNotEmpty) {
      TMapServices.getCoordinates(location, (destination) {
        setState(() {
          _destination = destination;
          TCacheHelper.saveData(key: 'userLat', value: _destination!.latitude);
          TCacheHelper.saveData(key: 'userLng', value: _destination!.longitude);
        });
        _mapController.move(destination, 15);
      });
    }
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
                    Padding(
                      padding: const EdgeInsets.all(TSizes.defaultSpace),
                      child: Column(
                        children: [
                          TextFormField(
                            controller: _locationController,
                            enableInteractiveSelection: false,
                            cursorColor: TColors.primary,
                            onFieldSubmitted: (value) => _searchLocation(),
                            decoration: InputDecoration(
                              hintText: TEnglishTexts.addressEnter,
                              prefixIcon: const Icon(Iconsax.location),
                            ),
                          ),
                          const Spacer(),
                          SizedBox(
                            height: 50.h,
                            width: double.infinity,
                            child: ElevatedButton(onPressed: () => Get.back(), child: Text(TEnglishTexts.tcontinue)),
                          )
                        ],
                      ),
                    ),
                    const TCurrentMarker(),
                    if (_destination != null)
                      MarkerLayer(
                        markers: [
                          Marker(
                            point: _destination!,
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
