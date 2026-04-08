import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:permission_handler/permission_handler.dart';
import 'package:path_provider/path_provider.dart';

class Downloader {
  static Future<String?> downloadSong(String url, String fileName) async {
    // Check storage permission
    var status = await Permission.storage.request();
    if (!status.isGranted) {
      return null;
    }

    // Download bytes
    final response = await http.get(Uri.parse(url));
    if (response.statusCode != 200) return null;

    // Get download directory
    Directory directory = await getApplicationDocumentsDirectory();
    String filePath = "${directory.path}/$fileName.m4a";

    // Save file
    File file = File(filePath);
    await file.writeAsBytes(response.bodyBytes);

    return filePath; // return local path
  }
}