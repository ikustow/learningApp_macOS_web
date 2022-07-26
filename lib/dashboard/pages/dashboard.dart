import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:web_app_dashboard/dashboard/widgets/adv_banner_widget.dart';
import 'package:web_app_dashboard/dashboard/widgets/goals_list_widgets.dart';
import 'package:web_app_dashboard/dashboard/widgets/random_word_widget.dart';
import '../controller/providers.dart';
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
          decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color.fromRGBO(251, 244, 246, 0.5),
                  Color.fromRGBO(251, 244, 246, 1),
                  Color.fromRGBO(251, 244, 246, 1),
                  Color.fromRGBO(251, 244, 246, 1),
                  Color.fromRGBO(207, 211, 239, 0.6),
                  Color.fromRGBO(181, 193, 238, 1),
                ],
              )
          ),
          child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DrawerWidget(),
            SizedBox(width: 8,),
            Expanded(
              flex: 2,
              child: Column(
                children: [
               SizedBox(height: 32,),
                  // first 4 boxes in grid
                  MainGoalsGridView(email: email,),
                  CurrentProgressList(email: email,),
                ],
              ),
            ),
            Expanded(
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
            ),
          ],
      ),
    ),
        ));
  }
}




