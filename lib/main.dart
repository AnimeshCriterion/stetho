import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';
import 'package:stetho/Services/splashview.dart';
import 'package:stetho/bluetooth_connectivity/test.dart';
import 'package:stetho/details/chat.dart';
import 'package:stetho/details/pateint_details_view.dart';

import 'details/Mainscreen.dart';

Future<void> main() async {
  await GetStorage.init('user');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {

  const MyApp({super.key});





  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {



    return GetMaterialApp(
      title: 'Digital Stethoscope',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      //home: const  Tester(),
      home:   ChatPage(deviceName: "deviceName", deviceAddress: "deviceAddress"),
    );
  }
}

