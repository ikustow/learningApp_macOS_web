import 'package:flutter/material.dart';
import 'package:web_app_dashboard/core/theme.dart';
import 'package:web_app_dashboard/dashboard/widgets/web_widgets/adv_banner_widget.dart';
import 'package:web_app_dashboard/dashboard/widgets/web_widgets/current_progress_list_widget.dart';
import 'package:web_app_dashboard/dashboard/widgets/web_widgets/goals_list_widgets.dart';

import 'package:web_app_dashboard/dashboard/widgets/web_widgets/random_word_widget.dart';
import 'package:web_app_dashboard/responsive/responsive_layout.dart';

import '../widgets/web_widgets/drawer_widget.dart';

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
                  CurrentProgressList(
                    email: email,
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                children: const [
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
