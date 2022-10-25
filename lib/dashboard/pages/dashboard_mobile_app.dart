

import 'package:flutter/material.dart';
import 'package:web_app_dashboard/core/const_strings.dart';
import 'package:web_app_dashboard/core/theme.dart';
import 'package:web_app_dashboard/dashboard/widgets/mobile_widgets/adv_banner_mobile.dart';
import 'package:web_app_dashboard/dashboard/widgets/mobile_widgets/main_goals_mobile_widget.dart';
import 'package:web_app_dashboard/dashboard/widgets/mobile_widgets/progress_list_mobile.dart';
import '../widgets/web_widgets/drawer_widget.dart';



class DashboardMobileApp extends StatelessWidget {
  final String username;
  final String email;

  const DashboardMobileApp({Key? key, required this.username, required this.email})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(Strings.homeSection),
      ),
     drawer: const DrawerWidget(),
     // bottomNavigationBar: BottomNavigationBarWidget(index: 0,),
      body: Container(
        decoration: BoxDecorationStyles.backgroundGradient,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const SizedBox(
                height: 8,
              ),
              // first 4 boxes in grid
              MainGoalsMobileGridView(
                email: email,
              ),
             const AdvertisingBannerMobileWidget(),
              CurrentProgressListMobile(
                email: email,
              ),
            ],
          ),
        ),
      ),
    );
  }
}


