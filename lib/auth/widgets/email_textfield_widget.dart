import 'package:flutter/material.dart';

class EmailTextFeildWidget extends StatelessWidget {

  final TextEditingController emailController;

  const EmailTextFeildWidget({Key? key, required this.emailController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: emailController,
      decoration: InputDecoration(
        labelText: "Email",
      ),
    );
  }
}
