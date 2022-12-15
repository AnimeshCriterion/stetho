import 'dart:convert';
import 'dart:io';

import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import 'package:stetho/AppManager/alert_dialogue.dart';
import 'package:stetho/AppManager/widgets/my_button2.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewPage extends StatefulWidget {
  final String title;
  final String url;

  const WebViewPage({Key? key, required this.url, required this.title})
      : super(key: key);

  @override
  _WebViewPageState createState() => _WebViewPageState();
}

class _WebViewPageState extends State<WebViewPage> {
  static final clientID = 0;
  BluetoothConnection? connection;
  bool isConnecting = true;

  bool get isConnected => (connection?.isConnected ?? false);

  bool isDisconnecting = false;
  String recicvedData="";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: WillPopScope(
        onWillPop: () {
          if (Platform.isAndroid) {
            SystemNavigator.pop();
          }
          return Future.value(false);
        },
        child: SafeArea(
          child: Scaffold(
              appBar: AppBar(
                title: Text(
                  "Live Data \n Running on ${widget.url}",
                  style: const TextStyle(fontSize: 12),
                ),
                actions: [
                  InkWell(
                      onTap: () {
                        FlutterClipboard.copy(widget.url.toString()).then(
                            (value) =>
                                alertToast(context, "Copied ${widget.url}"));
                      },
                      child: const Padding(
                        padding: EdgeInsets.only(right: 18.0),
                        child: Icon(Icons.copy),
                      ))
                ],
              ),
              body: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Expanded(
                            child: MyButton2(title: "Mode Change",onPress: (){
                              BluetoothConnection.toAddress(
                                  "9C:9C:1F:C2:AC:26")
                                  .then((_connection) {
                                print(
                                    'Connected to the device${"9C:9C:1F:C2:AC:26"}');

                                connection = _connection;
                                setState(() {
                                  isConnecting = false;
                                  isDisconnecting = false;
                                });
                                connection!.output.add(
                                    Uint8List.fromList(utf8.encode("m@")));

                                connection!.input!
                                    .listen(_onDataReceived)
                                    .onDone(() {
                                  // Example: Detect which side closed the connection
                                  // There should be `isDisconnecting` flag to show are we are (locally)
                                  // in middle of disconnecting process, should be set before calling
                                  // `dispose`, `finish` or `close`, which all causes to disconnect.
                                  // If we except the disconnection, `onDone` should be fired as result.
                                  // If we didn't except this (no flag set), it means closing by remote.
                                  if (isDisconnecting) {
                                    print('Disconnecting locally!');
                                  } else {
                                    print('Disconnected remotely!');
                                  }
                                  if (mounted) {
                                    setState(() {});
                                  }
                                });
                              }).catchError((error) {
                                print('Something went wrong');
                                alertToast(context,
                                    'Cannot connect, exception occured please retry');
                              });

                            },)),
                        Expanded(
                            child: MyButton2(title: "Mode Enquiry",onPress: (){
                              BluetoothConnection.toAddress(
                                  "9C:9C:1F:C2:AC:26")
                                  .then((_connection) {
                                print(
                                    'Connected to the device${"9C:9C:1F:C2:AC:26"}');

                                connection = _connection;
                                setState(() {
                                  isConnecting = false;
                                  isDisconnecting = false;
                                });
                                connection!.output.add(
                                    Uint8List.fromList(utf8.encode("m?")));

                                connection!.input!
                                    .listen(_onDataReceived)
                                    .onDone(() {
                                  // Example: Detect which side closed the connection
                                  // There should be `isDisconnecting` flag to show are we are (locally)
                                  // in middle of disconnecting process, should be set before calling
                                  // `dispose`, `finish` or `close`, which all causes to disconnect.
                                  // If we except the disconnection, `onDone` should be fired as result.
                                  // If we didn't except this (no flag set), it means closing by remote.
                                  if (isDisconnecting) {
                                    print('Disconnecting locally!');
                                  } else {
                                    print('Disconnected remotely!');
                                  }
                                  if (mounted) {
                                    setState(() {});
                                  }
                                });
                              }).catchError((error) {
                                print('Cannot connect, exception occured');
                                alertToast(context,
                                    'Cannot connect, exception occured please retry');
                              });

                            },)),
                        Expanded(
                            child: MyButton2(title: "Battery Status",onPress: (){
                              BluetoothConnection.toAddress(
                                  "9C:9C:1F:C2:AC:26")
                                  .then((_connection) {
                                print(
                                    'Connected to the device${"9C:9C:1F:C2:AC:26"}');

                                connection = _connection;
                                setState(() {
                                  isConnecting = false;
                                  isDisconnecting = false;
                                });
                                connection!.output.add(
                                    Uint8List.fromList(utf8.encode("b")));

                                connection!.input!
                                    .listen(_onDataReceived)
                                    .onDone(() {
                                  // Example: Detect which side closed the connection
                                  // There should be `isDisconnecting` flag to show are we are (locally)
                                  // in middle of disconnecting process, should be set before calling
                                  // `dispose`, `finish` or `close`, which all causes to disconnect.
                                  // If we except the disconnection, `onDone` should be fired as result.
                                  // If we didn't except this (no flag set), it means closing by remote.
                                  if (isDisconnecting) {
                                    print('Disconnecting locally!');
                                  } else {
                                    print('Disconnected remotely!');
                                  }
                                  if (mounted) {
                                    setState(() {});
                                  }
                                });
                              }).catchError((error) {
                                print('Cannot connect, exception occured');
                                alertToast(context,
                                    'Cannot connect, exception occured please retry');
                              });

                            },)),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Expanded(
                            child: MyButton2(title: "Recording start",onPress: (){
                              BluetoothConnection.toAddress(
                                  "9C:9C:1F:C2:AC:26")
                                  .then((_connection) {
                                print(
                                    'Connected to the device${"9C:9C:1F:C2:AC:26"}');

                                connection = _connection;
                                setState(() {
                                  isConnecting = false;
                                  isDisconnecting = false;
                                });
                                connection!.output.add(
                                    Uint8List.fromList(utf8.encode("r15heart01(rec time=15,filename=heart01)")));

                                connection!.input!
                                    .listen(_onDataReceived)
                                    .onDone(() {
                                  // Example: Detect which side closed the connection
                                  // There should be `isDisconnecting` flag to show are we are (locally)
                                  // in middle of disconnecting process, should be set before calling
                                  // `dispose`, `finish` or `close`, which all causes to disconnect.
                                  // If we except the disconnection, `onDone` should be fired as result.
                                  // If we didn't except this (no flag set), it means closing by remote.
                                  if (isDisconnecting) {
                                    print('Disconnecting locally!');
                                  } else {
                                    print('Disconnected remotely!');
                                  }
                                  if (mounted) {
                                    setState(() {});
                                  }
                                });
                              }).catchError((error) {
                                print('Cannot connect, exception occured');
                                alertToast(context,
                                    'Cannot connect, exception occured please retry');
                              });

                            },)),
                        Expanded(
                            child: MyButton2(title: "File transfer",onPress: (){
                              BluetoothConnection.toAddress(
                                  "9C:9C:1F:C2:AC:26")
                                  .then((_connection) {
                                print(
                                    'Connected to the device${"9C:9C:1F:C2:AC:26"}');

                                connection = _connection;
                                setState(() {
                                  isConnecting = false;
                                  isDisconnecting = false;
                                });
                                connection!.output.add(
                                    Uint8List.fromList(utf8.encode("fheart01(filename=heart01)")));

                                connection!.input!
                                    .listen(_onDataReceived)
                                    .onDone(() {
                                  // Example: Detect which side closed the connection
                                  // There should be `isDisconnecting` flag to show are we are (locally)
                                  // in middle of disconnecting process, should be set before calling
                                  // `dispose`, `finish` or `close`, which all causes to disconnect.
                                  // If we except the disconnection, `onDone` should be fired as result.
                                  // If we didn't except this (no flag set), it means closing by remote.
                                  if (isDisconnecting) {
                                    print('Disconnecting locally!');
                                  } else {
                                    print('Disconnected remotely!');
                                  }
                                  if (mounted) {
                                    setState(() {});
                                  }
                                });
                              }).catchError((error) {
                                print('Cannot connect, exception occured');
                                alertToast(context,
                                    'Cannot connect, exception occured please retry');
                              });

                            },)),
                        Expanded(
                            child: MyButton2(title: "l",onPress: (){
                              BluetoothConnection.toAddress(
                                  "9C:9C:1F:C2:AC:26")
                                  .then((_connection) {
                                print(
                                    'Connected to the device${"9C:9C:1F:C2:AC:26"}');

                                connection = _connection;
                                setState(() {
                                  isConnecting = false;
                                  isDisconnecting = false;
                                });
                                connection!.output.add(
                                    Uint8List.fromList(utf8.encode("m@")));

                                connection!.input!
                                    .listen(_onDataReceived)
                                    .onDone(() {
                                  // Example: Detect which side closed the connection
                                  // There should be `isDisconnecting` flag to show are we are (locally)
                                  // in middle of disconnecting process, should be set before calling
                                  // `dispose`, `finish` or `close`, which all causes to disconnect.
                                  // If we except the disconnection, `onDone` should be fired as result.
                                  // If we didn't except this (no flag set), it means closing by remote.
                                  if (isDisconnecting) {
                                    print('Disconnecting locally!');
                                  } else {
                                    print('Disconnected remotely!');
                                  }
                                  if (mounted) {
                                    setState(() {});
                                  }
                                });
                              }).catchError((error) {
                                print('Cannot connect, exception occured');
                                alertToast(context,
                                    'Cannot connect, exception occured please retry');
                              });

                            },)),
                      ],
                    ),
                  ),
                  Text("Status$recicvedData"),
                  Expanded(
                    child: WebView(
                      javascriptMode: JavascriptMode.unrestricted,
                      zoomEnabled: true,
                      initialUrl: widget.url,
                      // initialUrl: "https://digidoctor.in/Home/AboutUs",
                    ),
                  ),
                ],
              )),
        ),
      ),
    );
  }

  void _onDataReceived(Uint8List data) {
    // Allocate buffer for parsed data
    int backspacesCounter = 0;
    data.forEach((byte) {
      if (byte == 8 || byte == 127) {
        backspacesCounter++;
      }
    });
    Uint8List buffer = Uint8List(data.length - backspacesCounter);
    int bufferIndex = buffer.length;

    // Apply backspace control character
    backspacesCounter = 0;
    for (int i = data.length - 1; i >= 0; i--) {
      if (data[i] == 8 || data[i] == 127) {
        backspacesCounter++;
      } else {
        if (backspacesCounter > 0) {
          backspacesCounter--;
        } else {
          buffer[--bufferIndex] = data[i];
        }
      }
    }

    // Create message if there is new line character
    String dataString = String.fromCharCodes(buffer);
    setState(() {
      recicvedData=dataString.toString();
    });

    alertToast(context, dataString.toString());
    print("Animehs$dataString");
    // modal.controller.deviceKey.text=dataString.toString();

    // modal.submitDetails(context, selectGender, deviceName, DeviceKey);
    // int index = buffer.indexOf(13);
    // if (~index != 0) {
    //   setState(() {
    //     messages.add(
    //       _Message(
    //         1,
    //         backspacesCounter > 0
    //             ? _messageBuffer.substring(
    //             0, _messageBuffer.length - backspacesCounter)
    //             : _messageBuffer + dataString.substring(0, index),
    //       ),
    //     );
    //     _messageBuffer = dataString.substring(index);
    //     print("Animesh1$_messageBuffer");
    //   });
    // } else {
    //   _messageBuffer = (backspacesCounter > 0
    //       ? _messageBuffer.substring(
    //       0, _messageBuffer.length - backspacesCounter)
    //       : _messageBuffer + dataString);
    // }
  }
}
