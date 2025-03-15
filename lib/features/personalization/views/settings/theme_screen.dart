import 'package:comprehensive_pharmacy_pharmacy_role/common/widgets/appbar/appbar.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/features/personalization/controllers/settings_controller.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class ColorPickerScreen extends StatelessWidget {
  const ColorPickerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TAppBar(showBackArrow: true),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          buildColorContainer(TColors.primaryGreen, "Green"),
          buildColorContainer(TColors.primaryPink, "Pink"),
          buildColorContainer(TColors.primaryBlue, "Blue"),
        ],
      ),
    );
  }

  Widget buildColorContainer(Color color, String label) {
    return GestureDetector(
      onTap: () {
        SettingsController.instance.updatePrimaryColor(color);
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        height: 100,
        width: 200,
        color: color,
        child: Center(
          child: Text(
            label,
            style: const TextStyle(color: Colors.white, fontSize: 18),
          ),
        ),
      ),
    );
  }
}
