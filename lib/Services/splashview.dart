import 'package:flutter/cupertino.dart';
import 'package:stetho/AppManager/user_data.dart';
import 'package:stetho/bluetooth_connectivity/test.dart';

import '../AppManager/app_util.dart';
import '../AppManager/web_view.dart';
import 'WebViewScreen.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  String url = UserData().getListneUrl.toString();

  @override
  void initState() {
    navigateToPage();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print("StartAnimesh" + UserData().getListneUrl.toString());
    return Container();
  }

  void navigateToPage() {
    if (UserData().getListneUrl.isEmpty) {
      App().replaceNavigate(context, const Tester());
    } else {
      App().navigate(
          context,
          WebViewPage(
            title: 'Live Data',
            url: url,

          ));
    }
  }
}
