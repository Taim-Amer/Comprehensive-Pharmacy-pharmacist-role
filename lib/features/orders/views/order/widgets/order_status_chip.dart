import 'package:comprehensive_pharmacy_pharmacy_role/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/utils/constants/colors.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrderStatusChip extends StatefulWidget {
  final int index;
  final TabController tabController;
  final String text;

  const OrderStatusChip({
    super.key,
    required this.index,
    required this.tabController, required this.text,
  });

  @override
  State<OrderStatusChip> createState() => _OrderStatusChipState();
}

class _OrderStatusChipState extends State<OrderStatusChip> {
  late final VoidCallback _listener;

  @override
  void initState() {
    super.initState();
    _listener = () {
      setState(() {});
    };
    widget.tabController.addListener(_listener);
  }

  @override
  void dispose() {
    widget.tabController.removeListener(_listener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isSelected = widget.tabController.index == widget.index;
    final dark = THelperFunctions.isDarkMode(context);

    return TRoundedContainer(
      width: 89.w,
      // height: 28.h,
      radius: 6.r,
      backgroundColor: isSelected ? TColors.primary : const Color(0xFFF5F5F5),
      borderColor: isSelected ? TColors.primary : const Color(0xFFF5F5F5),
      showBorder: true,
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Text(widget.text, style: Theme.of(context).textTheme.titleMedium?.copyWith(fontSize: 12, fontWeight: FontWeight.w500, color: isSelected ? Colors.white : const Color(0xFF383838)),
          ),
        ),
      ),
    );
  }
}
