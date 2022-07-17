import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:web_app_dashboard/auth/widgets/login_banner_widget.dart';

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
        children: [
          Expanded(
            flex: 2,
            child: LoginBannerWidget(),),
          TextField(
            controller: emailController,
            decoration: InputDecoration(
              labelText: "Email",
            ),
          ),
          SizedBox(
            height: 16,
          ),
          TextField(
            controller: passwordController,
            decoration: InputDecoration(
              labelText: "Password",
            ),
          ),
          SizedBox(
            height: 16,
          ),
          ElevatedButton(onPressed: () {
            authService.signInUser(context,
                email: emailController.text,
                password: passwordController.text);
          }, child: Text("Login")),
          SizedBox(
            height: 16,
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/register');
              },
              child: Text("Register"))
        ],
      ),
    );
  }
}
