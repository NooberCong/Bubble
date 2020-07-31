import 'dart:typed_data';

import 'package:bubble/core/util/utils.dart';
import 'package:dio/dio.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';

class DownloadManager {
  static Future<void> enqueDownload(String downloadUrl) async {
    final permissionGranted = await _requestPermission();
    if (!permissionGranted) {
      Fluttertoast.showToast(msg: "Error: permission not granted");
      return;
    }

    try {
      final response = await Dio()
          .get(downloadUrl, options: Options(responseType: ResponseType.bytes));
      await ImageGallerySaver.saveImage(
          Uint8List.fromList(response.data as List<int>),
          quality: 100,
          name: generateRandomNumString());
      Fluttertoast.showToast(msg: "Image downloaded");
    } on Exception {
      Fluttertoast.showToast(msg: "Error: download failed");
    }
  }

  static Future<bool> _requestPermission() async {
    if (!(await Permission.storage.isGranted)) {
      return (await Permission.storage.request()) == PermissionStatus.granted;
    }
    return true;
  }
}
