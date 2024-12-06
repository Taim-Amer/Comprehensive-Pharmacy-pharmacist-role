import 'dart:io';

import 'package:comprehensive_pharmacy_client_role/utils/logging/logger.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';

class TFileServices{
  TFileServices._();

  static final ValueNotifier<List<File>> selectedFiles = ValueNotifier([]);
  static final ValueNotifier<bool> isSelected = ValueNotifier(false);

  static void pickFile() async{
    String fileText = '';
    FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['jpg', 'jpeg', 'pdf']
    );
    if(result != null && result.files.single.path != null){
      PlatformFile file = result.files.first;
    }
    File file = File(result!.files.single.path!);
    fileText = file.path;
  }

  static Future<void> pickMultipleFiles() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpg', 'jpeg', 'pdf'],
      allowMultiple: true,
    );

    if (result != null) {
      List<File> files = result.paths.whereType<String>().map((path) => File(path)).toList();
      selectedFiles.value = files;
      isSelected.value = true;
    }
  }

  static void deleteFileByName(String fileName) {
    selectedFiles.value.removeWhere((file){
      isSelected.value = false;
      return file.path.split('/').last == fileName;
    });
    isSelected.value = selectedFiles.value.isNotEmpty;
    TLoggerHelper.warning(isSelected.value.toString());
  }

  static void pickDirectory() async{
    String fileText = '';
    String? selectedDirectory = await FilePicker.platform.getDirectoryPath();
    if(selectedDirectory != null){
      fileText = selectedDirectory;
    }
  }

  static void saveAs() async{
    if(kIsWeb || Platform.isIOS || Platform.isAndroid) return;
    String? outputFile = await FilePicker.platform.saveFile();
  }

  // static void saveOnFirebase() async{
  //   FilePickerResult? result = await FilePicker.platform.pickFiles();
  //   if(result != null){
  //     Uint8List fileBytes =
  //   }
  // }
}