import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


class Dashboard extends StatelessWidget {
  final String username;
  final String email;
  const Dashboard ({Key? key, required this.username, required this.email}) : super(key: key);


  @override
  Widget build(BuildContext context) {



    return Scaffold(
      body: Column(children: [
        Text(username.toString()),
        Text(email.toString()),
      ],),
    );
  }
}
