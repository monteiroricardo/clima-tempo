import 'package:clima_e_tempo/app/modules/home/home_module.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';

void main() async {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Color(0xFF7085FC),
    ),
  );
  await dotenv.load(fileName: ".env");
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    getPages: [
      ...HomeModule().routers,
    ],
  ));
}
