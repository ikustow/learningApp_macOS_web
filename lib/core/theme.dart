import 'package:flutter/material.dart';

var drawerPadding = const EdgeInsets.only(left: 8.0, right: 8, top: 8);

abstract class TextStyles {

  static const TextStyle drawerHeaderTextStyle = TextStyle(
    letterSpacing: 1,
    fontSize: 22,
    color: Colors.black,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle drawerSectionTextStyle = TextStyle(
    letterSpacing: 0.5,
    fontSize: 18,
    color: Colors.black87,
    fontWeight: FontWeight.normal,
  );

  static const TextStyle drawerCurrentSectionTextStyle = TextStyle(
    fontSize: 16,
    color: Colors.blueAccent,
    fontWeight: FontWeight.normal,
  );

  static const TextStyle mainGoalTitleTextStyle = TextStyle(
    letterSpacing: 0.5,
    fontSize: 18,
    color: Colors.black,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle mainGoalDescriptionTextStyle =  TextStyle(
    fontSize: 12,
    color: Colors.grey,
    fontWeight: FontWeight.normal,
  );


  static const TextStyle advTitleTextStyle =  TextStyle(
    letterSpacing: 1,
    fontSize: 20,
    color: Colors.white,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle advDescriptionTextStyle =  TextStyle(
    fontSize: 14,
    color: Colors.white,
    fontWeight: FontWeight.normal,
  );

  static final TextStyle advButtonTitleTextStyle =  TextStyle(
    fontSize: 16,
    color: Colors.orange[300],
    fontWeight: FontWeight.bold,
  );

}

abstract class AppColors {
  
  static const drawerColor = Colors.white54;
  static const drawerIconColor = Colors.black87;

  static const advButtonBackgroundColor = Colors.white;
  
}

abstract class BoxDecorationStyles {


  static final BoxDecoration completedProgressStep = BoxDecoration(
    borderRadius: BorderRadius.circular(4),
    color: Colors.blue[200],
  );

  static final BoxDecoration uncompletedProgressStep = BoxDecoration(
    borderRadius: BorderRadius.circular(4),
    border: Border.all(width: 0.5, color: Colors.blue.shade200),
    color: Colors.white54,
  );

}

abstract class ButtonStyles {

  static final ButtonStyle advButton = ButtonStyle(

    backgroundColor: MaterialStateProperty.all(AppColors.advButtonBackgroundColor),

   padding: MaterialStateProperty.all(
        const EdgeInsets.symmetric(horizontal: 24, vertical: 8)),
  );


}