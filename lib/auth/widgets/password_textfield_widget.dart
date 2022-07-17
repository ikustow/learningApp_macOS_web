import 'package:flutter/material.dart';

class PasswordTextFeildWidget extends StatelessWidget {

  final TextEditingController passwordController;

  const PasswordTextFeildWidget({Key? key, required this.passwordController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: passwordController,
      decoration: InputDecoration(
        labelText: "Password",
      ),
    );
  }
}
