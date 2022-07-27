import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:web_app_dashboard/auth/pages/login_page/login_page.dart';
import 'package:web_app_dashboard/auth/pages/login_page/login_page_mobile.dart';
import 'package:web_app_dashboard/core/models/login_data.dart';
import 'package:web_app_dashboard/dashboard/pages/dashboard.dart';
import 'package:web_app_dashboard/dashboard/pages/dashboard_small.dart';
import 'package:web_app_dashboard/dashboard/pages/dashboard_tablet.dart';
import 'package:web_app_dashboard/responsive/responsive_layout.dart';

import '../../dashboard/pages/dashboard_mobile_app.dart';

class StartPage extends StatefulWidget {
  const StartPage({Key? key}) : super(key: key);

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: FutureBuilder<SharedData>(
      future: AuthChecker(),
      builder: (buildContext, snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data?.isAuth != true) {
            return ResponsiveLayout(
              desktopBody: LoginPage(),
              smallBody: LoginPageMobile(),
              tabletBody: LoginPageMobile(), mobileAppBody: LoginPageMobile(),
            );
          }
          return ResponsiveLayout(
            desktopBody: Dashboard(
              username: snapshot.data!.userId,
              email: snapshot.data!.email,
            ),
            smallBody: DashboardSmallWidget(
              username: snapshot.data!.userId,
              email: snapshot.data!.email,
            ),
            tabletBody: DashboardTablet(
              username: snapshot.data!.userId,
              email: snapshot.data!.email,
            ),
            mobileAppBody:DashboardMobileApp(
              username: snapshot.data!.userId,
              email: snapshot.data!.email,
            ),
          );
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    ));
  }
}

Future<SharedData> AuthChecker() async {
  var prefs = await SharedPreferences.getInstance();
  var savedUser = await prefs.getString('user');
  var savedEmail = await prefs.getString('email');

  if (savedUser != '') {
    final sharedData =
        SharedData(savedEmail!.toString(), savedUser!.toString(), true);
    return sharedData;
  } else {
    final sharedData =
        SharedData(savedEmail!.toString(), savedUser!.toString(), false);
    return sharedData;
  }
}
