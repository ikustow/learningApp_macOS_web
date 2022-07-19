import 'package:flutter/material.dart';

class LoginDataProvider extends ChangeNotifier{

  String login = '';
  String password = '';

  String get loginValue => login;
  String get passwordValue => password;

  void _setLogin(loginValue){
    login = loginValue;
    notifyListeners();
  }

  void _setPassword(passwordValue){
    password = passwordValue;
    notifyListeners();
  }


}