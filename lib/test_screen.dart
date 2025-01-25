import 'dart:convert';
import 'package:comprehensive_pharmacy_pharmacy_role/common/widgets/map/current_marker.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/common/widgets/map/road.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/utils/constants/api_constants.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/utils/helpers/exports.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/utils/services/map_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:latlong2/latlong.dart';
import 'package:location/location.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_location_marker/flutter_map_location_marker.dart';
import 'package:http/http.dart' as http;

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
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
        });
        _mapController.move(destination, 15);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Map with Directions"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _locationController,
                    decoration: const InputDecoration(
                      hintText: 'Enter a location',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                IconButton(
                  onPressed: _searchLocation,
                  icon: const Icon(Icons.search),
                ),
              ],
            ),
          ),
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
