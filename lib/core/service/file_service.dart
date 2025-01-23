import 'dart:io';
import 'package:permission_handler/permission_handler.dart';
import 'package:sizer/sizer.dart';

import '../theme/text_theme.dart';
import 'api_service.dart';
import 'package:flutter/material.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';

class FileService {
  bool _isDownloading = false; // Flag to track the download state

  String _replaceFileName(String fileName, String newText) {
    // ! Find the index of the last dot (.)
    int lastDotIndex = fileName.lastIndexOf('.');
    if (lastDotIndex == -1) {
      return fileName; // Return original if no extension found
    }

    // ! Replace the text before the dot
    String extension = fileName.substring(lastDotIndex); // ".pdf"
    return "$newText$extension";
  }

  Future<void> downloadAndOpenFile(
    String url,
    String fileName,
    String newText,
  ) async {
    try {
      // ! Get the directory for saving files
      final Directory appDocDir = await getApplicationDocumentsDirectory();
      final String name = _replaceFileName(fileName, newText);
      final String filePath = '${appDocDir.path}/$name';

      // ! Download the file
      final response = await ApiService.instance.download(url, filePath);

      if (response.statusCode == 200) {
        debugPrint("File downloaded to $filePath");

        // ! Open the file
        final result = await OpenFile.open(filePath);
        debugPrint("Open file result: ${result.type}");
      } else {
        debugPrint("Failed to download file: ${response.statusCode}");
      }
    } catch (e) {
      debugPrint("Error: $e");
    }
  }

  Future<void> downloadFile(
    BuildContext context,
    String url,
    String fileName,
    String newText,
  ) async {
    // Prevent multiple downloads at the same time
    if (_isDownloading) return;
    _isDownloading = true;
    try {
      // Check storage permissions
      if (await Permission.storage.request().isGranted) {
        // Get the app's document directory
        final Directory? appDir;
        if (Platform.isIOS) {
          appDir = await getApplicationDocumentsDirectory();
        } else {
          appDir = Directory('/storage/emulated/0/Download');
        }
        final String name = _replaceFileName(fileName, newText);
        final String filePath = '${appDir.path}/$name';

        // ! Show initial Snackbar for downloading
        final snackBar = SnackBar(
          elevation: 0,
          backgroundColor: Colors.green.shade50,
          margin: EdgeInsets.only(left: 6.w, right: 6.w, bottom: 12.h),
          duration: const Duration(minutes: 6),
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6.w),
          ),
          showCloseIcon: true,
          closeIconColor: Colors.grey.shade600,
          padding: EdgeInsets.all(3.w),
          content: Text(
            "جار تحميل الفاتورة...",
            style: AppText.medium16(Colors.grey.shade600),
          ),
        );
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }

        // ! Download the file
        final response = await ApiService.instance.download(url, filePath);
        if (response.statusCode == 200) {
          debugPrint("File downloaded to $filePath");
          if (context.mounted) {
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                elevation: 0,
                backgroundColor: Colors.green.shade50,
                margin: EdgeInsets.only(left: 6.w, right: 6.w, bottom: 12.h),
                showCloseIcon: true,
                closeIconColor: Colors.grey.shade600,
                duration: const Duration(milliseconds: 1800),
                behavior: SnackBarBehavior.floating,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6.w),
                ),
                padding: EdgeInsets.all(3.w),
                content: Text(
                  "تم تنزيل الفاتورة بنجاح",
                  style: AppText.medium16(Colors.green.shade800),
                ),
              ),
            );
          }
        } else {
          debugPrint("Failed to download file: ${response.statusCode}");
        }
      } else if (await Permission.storage.isPermanentlyDenied) {
        openAppSettings();
      } else {
        debugPrint("Storage permission not granted");
      }
    } catch (e) {
      debugPrint("Error: $e");
    } finally {
      _isDownloading = false;
      // if (context.mounted) {
      //   ScaffoldMessenger.of(context).hideCurrentSnackBar();
      // }
    }
  }
}
