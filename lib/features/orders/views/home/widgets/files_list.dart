import 'dart:io';
import 'package:comprehensive_pharmacy_client_role/features/orders/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:comprehensive_pharmacy_client_role/services/file_services.dart';
import 'package:comprehensive_pharmacy_client_role/features/orders/views/home/widgets/file_item.dart';
import 'package:comprehensive_pharmacy_client_role/utils/constants/sizes.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FilesList extends StatelessWidget {
  const FilesList({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<List<File>>(
      valueListenable: TFileServices.selectedFiles,
      builder: (context, files, child) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (files.isEmpty) {
            HomeController.instance.isCreateButtonEnabled.value = false;
          } else {
            HomeController.instance.isCreateButtonEnabled.value = true;
          }
        });
        if (files.isEmpty) {
          return const Center(child: Text('No files selected.'));
        }
        return ValueListenableBuilder(
          valueListenable: TFileServices.isSelected,
          builder: (context, selected, child) => selected ? SizedBox(
            height: 200.h,
            child: ListView.separated(
              itemCount: files.length,
              itemBuilder: (context, index) {
                return FileItem(fileName: files[index].path.split('/').last);
              },
              separatorBuilder: (context, _) => TSizes.spaceBtwItems.verticalSpace,
            ),
          ) : const SizedBox(),
        );
      },
    );
  }
}
