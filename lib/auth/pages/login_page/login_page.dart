import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:web_app_dashboard/auth/providers/auth_provider_state.dart';
import 'package:web_app_dashboard/auth/widgets/login_banner_widget.dart';
import 'package:web_app_dashboard/auth/widgets/login_column.dart';
import 'package:web_app_dashboard/auth/widgets/register_button_widget.dart';
import 'package:web_app_dashboard/core/models/login_data.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final heightSize = MediaQuery.of(context).size.height / 3;
    final widthSize = MediaQuery.of(context).size.width / 3;
    print(widthSize.toString());
    return Scaffold(
      body: Row(
        //mainAxisAlignment: MainAxisAlignment.center,
        //crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          LoginBannerWidget(),
          Expanded(
            flex: 2,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: heightSize,horizontal: widthSize),
              child: LoginColumn(),
            ),
          ),
        ],
      ),
    );
  }
}
