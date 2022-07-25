import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:web_app_dashboard/core/models/random_word.dart';
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
                            child: RandomWordValue(),
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

class AdvertisingBannerWidget extends StatelessWidget {
  const AdvertisingBannerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 8),
        child: Container(
          height: 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.orange[200],
          ),
          child:Padding(
            padding: const EdgeInsets.all(0.4),
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaY: 12, sigmaX: 12),
                    child: Container(
                      alignment: Alignment.center,
                      color: Colors.white.withOpacity(.1),
                      padding: const EdgeInsets.all(48),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(children: [
                    Text("Someetx"),
                    SizedBox(height: 16,),
                    Text("Someetx"),
                    SizedBox(height: 16,),
                    ElevatedButton(onPressed: (){}, child: Text("11"))
                  ],
                    //
                  ),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 16.0),
                    child: Image.asset('assets/flutter_illustration.png', width: 200,height: 200,)
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


