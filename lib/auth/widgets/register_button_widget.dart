import 'package:flutter/material.dart';

class RegisterButtonWidget extends StatelessWidget {
  const RegisterButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color: Colors.blue.shade700,
      textColor: Colors.white,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(32)
      ),
      minWidth: double.infinity,
      height: 52,
      elevation: 24,
      onPressed: () {
        Navigator.pushNamed(context, '/register');
      },
      child: Text("Register"),
    );
  }
}
