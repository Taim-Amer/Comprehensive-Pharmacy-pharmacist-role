import 'package:comprehensive_pharmacy_pharmacy_role/common/widgets/alerts/snackbar.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/common/widgets/appbar/appbar.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/common/widgets/buttons/back_icon.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/features/orders/models/driver_model.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/features/orders/views/order/widgets/driver_details_bottom_sheet.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/utils/constants/colors.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/utils/constants/enums.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/utils/constants/image_strings.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/utils/constants/text_strings.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/utils/router/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

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
  late MapController controller;

  @override
  void initState() {
    super.initState();

    final initialPosition = widget.drivers.isNotEmpty ? GeoPoint(
      latitude: double.parse(widget.drivers.first.lat!),
      longitude: double.parse(widget.drivers.first.lng!),
    ) : GeoPoint(latitude: 0, longitude: 0);

    controller = MapController(
      initPosition: initialPosition,
      areaLimit: const BoundingBox(
        east: 100,
        north: 86.0,
        south: -86.0,
        west: -100,
      ),
    );

    WidgetsBinding.instance.addPersistentFrameCallback((_) async {
      if (widget.drivers.isNotEmpty) {
        await controller.goToLocation(initialPosition);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(actions: [
        TextButton(
          onPressed: (){
            showSnackBar("Order Confirmed", AlertState.success);
            Get.offAllNamed(AppRoutes.order);
          },
          child: Text(TEnglishTexts.next, style: Theme.of(context).textTheme.labelLarge?.copyWith(fontWeight: FontWeight.bold, color: TColors.primary)),
        )],),
      // floatingActionButton: FloatingActionButton(onPressed: () => setState(() {})),
      body: OSMFlutter(
        controller: controller,
        onGeoPointClicked: (geoPoint) {
          final driver = widget.drivers.firstWhere((driver) => double.parse(driver.lat!) == geoPoint.latitude && double.parse(driver.lng!) == geoPoint.longitude);
          showDriverDetailsBottomsheet(name: driver.name ?? '', phone: driver.phone ?? '', distance: driver.distance ?? 0, driverID: driver.id!);
          },
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
            ...widget.drivers.map((driver) => StaticPositionGeoPoint(
              driver.id.toString(),
              MarkerIcon(
                iconWidget: SvgPicture.asset(TImages.motorIcon),
              ),
                [
                  GeoPoint(
                    latitude: double.parse(driver.lat!),
                    longitude: double.parse(driver.lng!),
                  )
                ],
            ))
          ],
        ),
      ),
    );
  }
}
