import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'login_data.dart';

class SharedData {
  final String email;
  final String userId;
  final bool isAuth;

  SharedData(this.email, this.userId, this.isAuth);

//     this.id = savedUser!.toString();
//     this.isAuth = true;
}