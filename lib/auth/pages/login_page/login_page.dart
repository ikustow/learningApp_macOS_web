import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:web_app_dashboard/auth/widgets/login_banner_widget.dart';
import 'package:web_app_dashboard/auth/widgets/login_column.dart';


class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade100,
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            height: 640,
            width: 1080,
            margin: EdgeInsets.symmetric(horizontal: 24),
            clipBehavior: Clip.antiAliasWithSaveLayer,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
              color: Colors.white,
            ),
            child: Row(
              children: [
                 Expanded(
                   child: Center(
                     child: Padding(
                       padding: const EdgeInsets.all(120.0),
                       child: LoginColumn(),
                     ),
                   ),
                 ),
                DesktopLoginBannerWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

