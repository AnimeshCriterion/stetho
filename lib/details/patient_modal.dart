import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import 'package:stetho/AppManager/progress_dialogue.dart';
import 'package:stetho/AppManager/raw_api.dart';
import 'package:stetho/AppManager/user_data.dart';
import 'package:stetho/details/pateint_controller.dart';
import 'package:get/get.dart';

import '../AppManager/app_util.dart';
import '../AppManager/web_view.dart';
class PatientModal {
  PatientController controller = Get.put(PatientController());
  BluetoothConnection? connection;

  submitDetails(context, String selectGender, String deviceName, String deviceKey)async{
    ProgressDialogue().show(context, loadingText: 'loading');

    print("deviceKey${deviceKey}");
    var body = {
      "deviceKey":"9C9C1FC2AC26",
      "name": controller.nameC.text.toString(),
      "age": controller.ageC.text.toString(),
      "gender": selectGender
    };
    var data = await RawData().api('saveApi/',body,context,token: false);
    ProgressDialogue().hide();
    print('datatatatatata   $data');
    controller.updatPatientDetails=data['data'];
    UserData().addListenUrl(controller.getpatientDetails.listenUrl.toString());


  }





}