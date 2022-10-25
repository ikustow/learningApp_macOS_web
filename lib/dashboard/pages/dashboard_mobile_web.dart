import 'package:flutter/material.dart';
import 'package:web_app_dashboard/core/theme.dart';
import 'package:web_app_dashboard/dashboard/widgets/mobile_widgets/adv_banner_mobile.dart';
import 'package:web_app_dashboard/dashboard/widgets/web_widgets/current_progress_list_widget.dart';
import '../widgets/web_widgets/goals_list_widgets.dart';


class DashboardSmallWidget extends StatelessWidget {
  final String username;
  final String email;

  const DashboardSmallWidget({Key? key, required this.username, required this.email})
      : super(key: key);

  @override
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
               Padding(
                  padding:  const EdgeInsets.symmetric(horizontal: 8.0),
                  child: MainGoalsGridView(
                    email: email,
                  ),
                ),
             const AdvertisingBannerMobileWidget(),
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

