import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:web_app_dashboard/auth/widgets/login_banner_widget.dart';
import 'package:web_app_dashboard/auth/widgets/login_column.dart';
import 'package:web_app_dashboard/auth/widgets/register_button_widget.dart';

import '../../providers/auth_provider_state.dart';

class LoginPageMobile extends StatelessWidget {
  const LoginPageMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    final authService = Provider.of<ProviderState>(context);

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Expanded(
            flex: 2,
            child: LoginBannerWidget(),
          ),
          Expanded(
            flex: 4,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 36.0),
              child: LoginColumn(),
            ),
          ),
        ],
      ),
    );
  }
}
