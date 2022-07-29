import 'package:flutter/material.dart';

class ResponsiveLayout extends StatelessWidget {
  final Widget smallBody;
  final Widget mobileAppBody;
  final Widget desktopBody;
  final Widget tabletBody;

  ResponsiveLayout({
    required this.smallBody,
    required this.desktopBody,
    required this.tabletBody,
    required this.mobileAppBody,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if ((constraints.maxWidth < 600)) {
          return mobileAppBody;
        } else if (constraints.maxWidth < 900) {
          return smallBody;
        } else if (constraints.maxWidth < 1200) {
          return tabletBody;
        } else {
          return desktopBody;
        }
      },
    );
  }
}

enum TypeOfResponsive {
  Mobile,
  Desktop,
  Tablet,
}

//Settings section
abstract class AdvBannerSettings {
  static const double mainHeight = 100;
  static const double mainTabletHeight = 100;
}

abstract class AdvPictureSettings {
  static const double mainHeight = 150;
  static const double mainTabletHeight = 100;

  static const double mainWidth = 200;
  static const double mainTabletWidth = 100;
}
