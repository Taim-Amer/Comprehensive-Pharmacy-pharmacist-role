import 'package:comprehensive_pharmacy_pharmacy_role/common/widgets/alerts/snackbar.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/common/widgets/appbar/appbar.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/common/widgets/buttons/back_icon.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/common/widgets/map/current_marker.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/features/orders/models/driver_model.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/features/orders/views/order/widgets/driver_details_bottom_sheet.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/localization/keys.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/utils/constants/api_constants.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/utils/constants/colors.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/utils/constants/enums.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/utils/constants/image_strings.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/utils/constants/text_strings.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/utils/helpers/helper_functions.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/utils/router/app_router.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/utils/services/map_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';

class DriversMap extends StatefulWidget {
  final List<Drivers> drivers;

  const DriversMap({
    super.key,
    required this.drivers,
  });

  @override
  State<DriversMap> createState() => _UserLocationMapState();
}

class _UserLocationMapState extends State<DriversMap> {
  final MapController _mapController = MapController();
  bool _mapMovedManually = false;

  @override
  void initState() {
    super.initState();

    final initialPosition = widget.drivers.isNotEmpty ? LatLng(
      double.parse(widget.drivers.first.lat!),
      double.parse(widget.drivers.first.lng!),
    ) : const LatLng(0, 0);

    WidgetsBinding.instance.addPersistentFrameCallback((_) async {
      if (widget.drivers.isNotEmpty && !_mapMovedManually) {
        _mapController.move(initialPosition, 15);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: TAppBar(actions: [
        TextButton(
          onPressed: (){
            showSnackBar("Order Confirmed", AlertState.success);
            Get.offAllNamed(AppRoutes.order);
          },
          child: Text(TranslationKey.kNext, style: Theme.of(context).textTheme.labelLarge?.copyWith(fontWeight: FontWeight.bold, color: TColors.primary)),
        )],),
      // floatingActionButton: FloatingActionButton(onPressed: () => setState(() {})),
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
                    onPositionChanged: (position, hasGesture) {
                      if (hasGesture) {
                        _mapMovedManually = true;
                      }
                    },
                  ),
                  children: [
                    TileLayer(
                      urlTemplate: dark ? TApiConstants.darkMap : TApiConstants.lightMap,
                    ),
                    MarkerLayer(markers: [
                      ...widget.drivers.map((driver) => Marker(
                        width: 50,
                        height: 50,
                        point: LatLng(double.parse(driver.lat!), double.parse(driver.lng!)),
                        child: GestureDetector(
                            onTap: () {
                              final driver = widget.drivers.firstWhere((driver) => double.parse(driver.lat!) == LatLng(double.parse(driver.lat!), double.parse(driver.lng!)).latitude &&
                                    double.parse(driver.lng!) == LatLng(double.parse(driver.lat!), double.parse(driver.lng!)).longitude,
                              );
                              showDriverDetailsBottomsheet(name: driver.name ?? '', phone: driver.phone ?? '', distance: driver.distance ?? 0, driverID: driver.id!);
                            },
                            child: SvgPicture.asset(TImages.motorIcon)),
                        ),
                      ),
                    ])
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
