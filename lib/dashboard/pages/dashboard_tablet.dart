import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:web_app_dashboard/core/theme.dart';
import 'package:web_app_dashboard/dashboard/widgets/drawer_widget.dart';
import 'package:web_app_dashboard/dashboard/widgets/goals_list_widgets.dart';
import 'package:web_app_dashboard/responsive/responsive_layout.dart';

import '../widgets/adv_banner_widget.dart';
import '../widgets/current_progress_list_widget.dart';
import '../widgets/random_word_widget.dart';

class DashboardTablet extends StatelessWidget {
  final String username;
  final String email;

  const DashboardTablet({Key? key, required this.username, required this.email})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: BoxDecorationStyles.backgroundGradient,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const DrawerWidget(),
            const SizedBox(
              width: 8,
            ),
            Expanded(
              flex: 2,
              child: Column(
                children: [
                  const SizedBox(
                    height: 32,
                  ),
                  // first 4 boxes in grid
                  MainGoalsGridView(
                    email: email,
                  ),
                  Expanded(
                    child: Row(
                      //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: const [
                        AdvertisingBannerWidget(
                          type: TypeOfResponsive.Tablet,
                        ),
                      RandomWordWidget(type: TypeOfResponsive.Tablet,),
                      ],
                    ),
                  ),

                  CurrentProgressList(
                    email: email,
                  ),
                ],
              ),
            ),
            /*   Expanded(
                  child: Column(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 32, left: 8, right: 8),
                          child: ClipRRect(
                            child: BackdropFilter(
                              filter: ImageFilter.blur(sigmaX: 12,sigmaY: 12),
                              child: Container(
                                height: 100,
                                width: 500,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: Colors.white.withOpacity(0.8),
                                ),
                                child: RandomWordWidget(),
                              ),
                            ),
                          ),
                        ),
                      ),
                      AdvertisingBannerWidget(),
                    ],
                  ),
                ),*/
          ],
        ),
      ),
    ));
  }
}
