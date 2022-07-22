import 'dart:ui';

import 'package:flutter/material.dart';

class MobileLoginBannerWidget extends StatelessWidget {
  const MobileLoginBannerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
          color: Colors.blue,
          child: Container(
            child: Center(
              child: SizedBox(
                height: 200,
                child: Stack(

                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(24),
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaY: 12, sigmaX: 12),
                          child: Container(
                            alignment: Alignment.centerLeft,
                            color: Colors.white.withOpacity(.6),
                            padding: const EdgeInsets.all(16),
                            child: const Text("Welcome to English\nLearning \nDashboard",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18.00,
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 24.0, bottom: 16),
                        child: Image.asset('assets/flutter_dart.png', width: 70,),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}