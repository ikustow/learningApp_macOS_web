import 'dart:ui';

import 'package:flutter/material.dart';

class DesktopLoginBannerWidget extends StatelessWidget {
  const DesktopLoginBannerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
          color: Colors.blue,
          child: Container(

            child: Center(
              child: SizedBox(
                height: 500,
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 80.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(24),
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaY: 12, sigmaX: 12),
                          child: Container(
                            alignment: Alignment.center,
                            color: Colors.white.withOpacity(.6),
                            padding: const EdgeInsets.all(48),
                            child: const Text("Welcome to English\nLearning Dashboard",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 28.00,
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
                        padding: const EdgeInsets.only(right: 80.0),
                        child: Image.asset('assets/flutter_dart.png', width: 150,),
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