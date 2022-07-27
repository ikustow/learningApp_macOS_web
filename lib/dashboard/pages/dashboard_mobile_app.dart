
import 'package:flutter/material.dart';
import 'package:web_app_dashboard/core/theme.dart';
import 'package:web_app_dashboard/dashboard/widgets/adv_banner_widget.dart';
import 'package:web_app_dashboard/dashboard/widgets/current_progress_list_widget.dart';
import 'package:web_app_dashboard/dashboard/widgets/goals_list_widgets.dart';
import 'package:web_app_dashboard/dashboard/widgets/random_word_widget.dart';
import 'package:web_app_dashboard/responsive/responsive_layout.dart';


class DashboardMobileApp extends StatelessWidget {
  final String username;
  final String email;

  const DashboardMobileApp({Key? key, required this.username, required this.email})
      : super(key: key);

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecorationStyles.backgroundGradient,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const SizedBox(
                height: 32,
              ),
              // first 4 boxes in grid
              MainGoalsGridView(
                email: email,
              ),
              AdvertisingBannerWidget(
                type: TypeOfResponsive.Mobile,
              ),
              RandomWordWidget(
                type: TypeOfResponsive.Tablet,
              ),

              CurrentProgressList(
                email: email,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
