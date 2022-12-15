// //
// //
// //
// //
// // import 'dart:convert';
// //
// // import 'package:his_patient/pages/CornCallSIP/AppManager/progress_dialogue.dart';
// // import 'package:his_patient/pages/CornCallSIP/AppManager/user_data.dart';
// // import 'package:his_patient/pages/CornCallSIP/Modals/ContactListModals/user_contact_modal.dart';
// // import 'package:his_patient/pages/CornCallSIP/Pages/ContactList/contact_list_modal.dart';
// // import 'package:his_patient/pages/CornCallSIP/Services/FirebaseService/fireBaseService.dart';
// // import 'package:firebase_messaging/firebase_messaging.dart';
// // import 'package:http/http.dart' as http;
// //
//
// //
// // class FirebaseCalling{
// //
// //   final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
// //
// //
// //
// //   handleCall(context,UserContactModal contact,bool isAudioCall) async{
// //  //   ProgressDialogue().show(context, loadingText: 'Initiating Call to '+contact.name.toString());
// //
// //
// //
// //     await _firebaseMessaging.requestNotificationPermissions(
// //       const IosNotificationSettings(
// //           sound: true, badge: true, alert: true, provisional: false),
// //     );
// //     var response = await http.post(
// //       'https://fcm.googleapis.com/fcm/send',
// //       headers: <String, String>{
// //         'Content-Type': 'application/json',
// //         'Authorization': 'key=$serverToken',
// //       },
// //       body: jsonEncode(
// //         <String, dynamic>{
// //           'notification': <String, dynamic>{
// //             'body':  "Call from "+UserData().getUserName.toString(),
// //             'title': 'Call'.toString(),
// //             // "sound": "notification.mp3"
// //           },
// //           'priority': 'high',
// //           'data': <String, dynamic>{
// //             'isAudioCall': isAudioCall,
// //             'callerName': UserData().getUserName.toString(),
// //             'callerUserId': UserData().getUserId.toString(),
// //             'callerPlayerId': UserData().getUserPid.toString(),
// //             'time': DateTime.now().toString(),
// //
// //             'click_action': 'FLUTTER_NOTIFICATION_CLICK',
// //
// //
// //
// //             'playerId': await FireBaseService().getToken(),
// //           },
// //           'to': contact.deviceToken.toString()
// //         },
// //       ),
// //     );
// //     print(json.decode(response.body));
// //
// //
// //
// //
// //   //  ProgressDialogue().hide();
// //
// // }
// //
// //
// // }
//
//
// //
// //
// //
// //
//
// import 'dart:convert';
//
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:http/http.dart' as http;
//
//
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
//
// const String serverToken = 'AAAA41PdUMU:APA91bE8QSGObUthmJu2WvTMmxW_MMj02BxhcsG67gXgcX-ElGc_UCIMcUIijGLa8joDuRchmLVZKTfQbi546_BFOkVoENpLokn5go6niigslNRwnYWpLJXRw_-G6pQJbccC_MS7YWMT';
// final _firebaseMessaging = FirebaseMessaging.instance;
//
// class FireBaseCalling {
//   // OneSignalController oneC=Get.put(OneSignalController());
//
//
//   // handleCall(context,UserContactModal contact,bool isAudioCall) async {
//   //
//   //   print(contact.deviceToken);
//   //
//   //   /// Calling Modal
//   //
//   //   // SIPModal().handleRegistration(  context: context);
//   // //  ProgressDialogue().show(context, loadingText: 'Initiating Call to '+contact.name.toString());
//   // //   await _firebaseMessaging.requestNotificationPermissions(,
//   // //   );
//   //
//   //   try {
//   //
//   //     print( DateTime.now().toString());
//   //
//   //     var response = await sendMessage(
//   //       notification: {
//   //         'title': 'Call',
//   //         'body': "Call from "+UserData().getDoctorName.toString(),
//   //         "sound": "ring",
//   //         "android_channel_id": "call"
//   //       },
//   //       title: 'Call',
//   //       body:  "Call from "+UserData().getDoctorName.toString(),
//   //       toDevice: contact.deviceToken.toString(),
//   //       data: {
//   //         'isAudioCall': isAudioCall,
//   //         'callerName': UserData().getDoctorName.toString(),
//   //         'callerUserId': UserData().getDoctorUserId.toString(),
//   //         'callerPlayerId': UserData().getDoctorUniqueNo.toString(),
//   //         'time': DateTime.now().toString(),
//   //         "sound": "ring",
//   //         "click_action": "FLUTTER_NOTIFICATION_CLICK",
//   //       }
//   //     );
//   //   print(json.decode(response.body));
//   //     if(response!=null){
//   //       // oneC.updateCurrentCall=MyCall.initiated;
//   //       // SIPModal().handleCall(context,
//   //       //     isAudioCall,
//   //       //     contact.userId.toString()
//   //       // );
//   //     }
//   //     return response;
//   //   }
//   //   catch(e){
//   //
//   //     alertToast(context, e.toString());
//   //
//   //   }
//   //
//   //
//   //
//   //
//   //  // ProgressDialogue().hide();
//   //
//   // }
//   //
//   //
//   // dropCall(context,UserContactModal contact,bool isAudioCall) async {
//   //
//   //
//   //   try {
//   //     ProgressDialogue().show(context, loadingText: 'Dropping Call');
//   //     var response = await sendMessage(
//   //         title: 'Call Drop',
//   //         body:  "Call Drop By "+UserData().getUserName.toString(),
//   //         toDevice: contact.deviceToken.toString(),
//   //         data: {
//   //           'isAudioCall': isAudioCall,
//   //           'callerPlayerId': UserData().getUserPid.toString(),
//   //           'click_action': 'FLUTTER_NOTIFICATION_CLICK',
//   //         }
//   //     );
//   //     if(response!=null){
//   //       oneC.updateCurrentCall=MyCall.initiated;
//   //       // SIPModal().handleCall(context,
//   //       //     isAudioCall,
//   //       //     contact.userId.toString()
//   //       // );
//   //     }
//   //     ProgressDialogue().hide(context);
//   //     oneC.updateCurrentCall=MyCall.drop;
//   //
//   //
//   //   }
//   //   catch(e){
//   //     print('my eROOR '+e.toString());
//   //    // ProgressDialogue().hide();
//   //     alertToast(context, e.toString());
//   //   }
//   //
//   //
//   // }
//   //
//   //
//   //
//   // missedCall(context,UserContactModal contact,bool isAudioCall) async {
//   //
//   //
//   //   try {
//   //     var response = await sendMessage(
//   //         title:  "Missed Call",
//   //         body:  "Missed Call from "+UserData().getUserName.toString(),
//   //         toDevice: contact.deviceToken.toString(),
//   //         data:  {
//   //           'isAudioCall': isAudioCall,
//   //           'callerPlayerId': UserData().getUserPid.toString(),
//   //         }
//   //     );
//   //     oneC.updateCurrentCall=MyCall.missed;
//   //     alertToast(context, 'Call Time Out');
//   //     print("Sent notification with response: $response");
//   //   }
//   //   catch(e){
//   //     alertToast(context, e.toString());
//   //   }
//   //
//   // }
//   //
//   //
//   //
//   // cutCall(context,cutPlayerId) async {
//   //
//   //
//   //   print(cutPlayerId.toString());
//   //
//   //   ProgressDialogue().show(context, loadingText: 'Cutting Call');
//   //
//   //   var response = await sendMessage(
//   //       title:  "Call Cut",
//   //       body:  "Call Cut By "+UserData().getUserName.toString(),
//   //       toDevice: cutPlayerId.toString(),
//   //       data:  {
//   //         'callerPlayerId': UserData().getUserPid.toString(),
//   //       }
//   //   );
//   //
//   //   print(response.toString());
//   //   ProgressDialogue().hide();
//   //   Navigator.pop(context);
//   // }
//   //
//   //
//   // pickUpCall(context,pickPlayerId) async {
//   //   App().replaceNavigate(context, HISVideoCallLandingPage());
//   //   // ProgressDialogue().show(context, loadingText: 'Picking Up Call');
//   //   //
//   //   // var response = await sendMessage(
//   //   //     title:  "Call PickedUp",
//   //   //     body:  "Call PickedUP By "+UserData().getUserName.toString(),
//   //   //     toDevice: pickPlayerId.toString(),
//   //   //     data:  {
//   //   //       'callerPlayerId': UserData().getUserPid.toString(),
//   //   //     }
//   //   // );
//   //   // ProgressDialogue().hide(context);
//   //   // oneC.updateCurrentCall=MyCall.confirmed;
//   //   //
//   //   //
//   //   // return response;
//   // }
//
//
// }
//
//
//
// sendMessage({
//   String? title,
//   String? body,
//   String? toDevice,
//   Map? data,
//   Map? notification,
// }) async{
//   var response = await http.post(
//     Uri.parse('https://fcm.googleapis.com/fcm/send'),
//     headers: <String, String>{
//       'Content-Type': 'application/json',
//       'Authorization': 'key=$serverToken',
//     },
//     body: jsonEncode(
//       <String, dynamic>{
//         'notification':notification?? <String, dynamic>{
//           'body': body,
//           'title': title,
//         },
//         'priority': 'high',
//         'data': data,
//         'to': toDevice.toString().trim()
//       },
//     ),
//   );
//
//   return response;
// }