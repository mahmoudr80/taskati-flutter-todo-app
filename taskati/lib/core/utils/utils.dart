import 'dart:io';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';

Future<File> assetToFile(String assetPath) async {
  final byteData = await rootBundle.load(assetPath);

  final directory = await getApplicationDocumentsDirectory();
  final file = File('${directory.path}/${assetPath.split('/').last}');

  await file.writeAsBytes(byteData.buffer.asUint8List());

  return file;
}