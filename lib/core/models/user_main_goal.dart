import 'package:flutter/material.dart';

class UserMainGoal {
  final int id;
  final int currentValue;
  final int totalValue;

  final String name;
  final String userEmail;
  final String desc;

  UserMainGoal(
      {required this.id,
      required this.currentValue,
      required this.totalValue,
      required this.name,
      required this.userEmail,
      required this.desc});
}
