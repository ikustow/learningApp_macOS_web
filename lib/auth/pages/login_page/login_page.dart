import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:web_app_dashboard/auth/providers/auth_provider_state.dart';
import 'package:web_app_dashboard/auth/widgets/email_textfield_widget.dart';
import 'package:web_app_dashboard/auth/widgets/login_banner_widget.dart';
import 'package:web_app_dashboard/auth/widgets/login_button_widget.dart';
import 'package:web_app_dashboard/auth/widgets/password_textfield_widget.dart';
import 'package:web_app_dashboard/auth/widgets/register_button_widget.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    final authService = Provider.of<ProviderState>(context);

    return Scaffold(
      body: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const Expanded(
          flex: 2,
          child: LoginBannerWidget(),
        ),
        Expanded(
          flex: 4,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children:  [
              EmailTextFeildWidget(emailController: emailController,),
              const SizedBox(
                height: 16,
              ),
             PasswordTextFeildWidget(passwordController: passwordController,),
              const SizedBox(
                height: 16,
              ),
              LoginButtonWidget(password: passwordController.text, login: emailController.text,),
              const SizedBox(
                height: 16,
              ),
              RegisterButtonWidget(),
            ],
          ),
        ),
      ]),
    );
  }
}
