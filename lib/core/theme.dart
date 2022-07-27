import 'package:flutter/material.dart';

var drawerPadding = const EdgeInsets.only(left: 8.0, right: 8, top: 8);

abstract class TextStyles {

  static const TextStyle progressValueTileTitleTextStyle =  const TextStyle(
    fontSize: 16,
    letterSpacing: 1,
    color: Colors.black,
    fontWeight: FontWeight.normal,
  );

  static const TextStyle progressValueTileDescTextStyle =  const TextStyle(
    fontSize: 14,
    color: Colors.black54,
    fontWeight: FontWeight.normal,
  );

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



  static final TextStyle newWordTitleTextStyle = TextStyle(
    letterSpacing: 1,
    fontSize: 34,
    color: Colors.black,
    fontWeight: FontWeight.bold,
  );

  static final TextStyle newWordValueTextStyle = TextStyle(
    letterSpacing: 1,
    fontSize: 32,
    color: Colors.blueAccent.shade400,
    fontWeight: FontWeight.bold,
  );

  static final TextStyle newWordPhoneticValueTextStyle =  TextStyle(
    letterSpacing: 1,
    fontSize: 26,
    color: Colors.blueAccent,
    fontWeight: FontWeight.normal,
  );


  static final TextStyle newWordTabletTitleTextStyle = TextStyle(
    letterSpacing: 1,
    fontSize: 18,
    color: Colors.black,
    fontWeight: FontWeight.bold,
  );

  static final TextStyle newWordTabletValueTextStyle = TextStyle(
    letterSpacing: 1,
    fontSize: 16,
    color: Colors.blueAccent.shade400,
    fontWeight: FontWeight.bold,
  );

  static final TextStyle newWordTabletPhoneticValueTextStyle =  TextStyle(
    letterSpacing: 1,
    fontSize: 16,
    color: Colors.blueAccent,
    fontWeight: FontWeight.normal,
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


  static final BoxDecoration progressListDecoration = BoxDecoration(
      borderRadius: BorderRadius.circular(6),
      boxShadow: [
        BoxShadow(
          color: Colors.white70.withOpacity(0.5),
          spreadRadius: 3,
          blurRadius: 3,
          offset: const Offset(3, 3), // changes position of shadow
        ),
      ],

      // border: Border.all(width: 0.5, color: Colors.blue.shade200),
      color: Colors.white70.withOpacity(.6)
  );

  static final BoxDecoration completedProgressValueTileDecoration = BoxDecoration(
    borderRadius: BorderRadius.circular(6),
    color: Colors.greenAccent.withOpacity(.5),
    boxShadow: [
      BoxShadow(
        color: Colors.greenAccent.withOpacity(0.5),
        spreadRadius: 3,
        blurRadius: 5,
        offset: const Offset(0, 3), // changes position of shadow
      ),
    ],
  );

  static final BoxDecoration uncompletedProgressValueTileDecoration = BoxDecoration(
    borderRadius: BorderRadius.circular(6),
    border: Border.all(
      color: Colors.greenAccent,
      width: 1,
    ),
    color: Colors.white70.withOpacity(.5),

  );


  static final BoxDecoration completedIconDecoration = BoxDecoration(
    borderRadius: BorderRadius.circular(6),
    color: Colors.white70.withOpacity(.5),

  );

  static final BoxDecoration uncompletedIconDecoration = BoxDecoration(
    borderRadius: BorderRadius.circular(6),
    color: Colors.greenAccent.withOpacity(.5),

  );

  static const BoxDecoration backgroundGradient =  BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          Color.fromRGBO(251, 244, 246, 0.5),
          Color.fromRGBO(251, 244, 246, 1),
          Color.fromRGBO(251, 244, 246, 1),
          Color.fromRGBO(251, 244, 246, 1),
          Color.fromRGBO(207, 211, 239, 0.6),
          Color.fromRGBO(181, 193, 238, 1),
        ],
      )
  );

}

abstract class ButtonStyles {

  static final ButtonStyle advButton = ButtonStyle(

    backgroundColor: MaterialStateProperty.all(AppColors.advButtonBackgroundColor),

   padding: MaterialStateProperty.all(
        const EdgeInsets.symmetric(horizontal: 24, vertical: 8)),
  );


}

class CompletedIcon extends StatelessWidget {
  const CompletedIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecorationStyles.completedIconDecoration,
      child: const Icon(Icons.done, color: Colors.greenAccent,),
    );
  }
}

class UncompletedIcon extends StatelessWidget {
  const UncompletedIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecorationStyles.uncompletedIconDecoration,
      child: const Icon(Icons.arrow_forward_rounded, color: Colors.white,),
    );
  }
}