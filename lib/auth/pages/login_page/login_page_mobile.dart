import 'package:flutter/material.dart';
import 'package:web_app_dashboard/auth/widgets/login_banner_widget.dart';
import 'package:web_app_dashboard/auth/widgets/login_column.dart';
import 'package:web_app_dashboard/auth/widgets/mobile_login_banner_widget.dart';
import 'package:web_app_dashboard/auth/widgets/register_button_widget.dart';


class LoginPageMobile extends StatelessWidget {
  const LoginPageMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    return Scaffold(
      backgroundColor: Colors.blue.shade100,
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            height: 500,
            width: 750,
            margin: EdgeInsets.symmetric(horizontal: 24),
            clipBehavior: Clip.antiAliasWithSaveLayer,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
              color: Colors.white,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children:  [
                MobileLoginBannerWidget(),
              //  SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.all(60.0),
                  child: LoginColumn(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
