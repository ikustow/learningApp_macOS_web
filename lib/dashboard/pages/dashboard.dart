import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:web_app_dashboard/core/theme.dart';
import 'package:web_app_dashboard/dashboard/widgets/adv_banner_widget.dart';
import 'package:web_app_dashboard/dashboard/widgets/goals_list_widgets.dart';
import 'package:web_app_dashboard/dashboard/widgets/random_word_widget.dart';
import 'package:web_app_dashboard/responsive/responsive_layout.dart';
import '../widgets/current_progress_list_widget.dart';
import '../widgets/drawer_widget.dart';

class Dashboard extends StatelessWidget {
  final String username;
  final String email;

  const Dashboard({Key? key, required this.username, required this.email})
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
            DrawerWidget(),
            SizedBox(
              width: 8,
            ),
            Expanded(
              flex: 2,
              child: Column(
                children: [
                  SizedBox(
                    height: 32,
                  ),
                  // first 4 boxes in grid
                  MainGoalsGridView(
                    email: email,
                  ),
                  CurrentProgressList(
                    email: email,
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  RandomWordWidget(type: TypeOfResponsive.Desktop,),
                  AdvertisingBannerWidget(
                    type: TypeOfResponsive.Desktop,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
