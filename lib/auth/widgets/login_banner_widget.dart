import 'package:flutter/material.dart';

class LoginBannerWidget extends StatelessWidget {
  const LoginBannerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue[300],
      child: Center(
        child: Text("Welcome to Learning platform"),
      ),
    );
  }
}
