import 'package:flutter/material.dart';

class RegisterButtonWidget extends StatelessWidget {
  const RegisterButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.pushNamed(context, '/register');
      },
      child: Text("Register"),
    );
  }
}
