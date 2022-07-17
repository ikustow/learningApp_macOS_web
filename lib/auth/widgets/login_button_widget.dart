import 'package:flutter/material.dart';

class LoginButtonWidget extends StatelessWidget {
  final String login;
  final String password;

  const LoginButtonWidget({Key? key, required this.login, required this.password}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          print(login);
          print(password);
          // authService.signInUser(context,
          //     email: emailController.text,
          //     password: passwordController.text);
        },
        child: Text("Login"),);
  }
}
