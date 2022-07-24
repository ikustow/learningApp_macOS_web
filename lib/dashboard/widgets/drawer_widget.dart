import 'package:flutter/material.dart';
import 'package:web_app_dashboard/core/const_strings.dart';
import 'package:web_app_dashboard/core/theme.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: RGBColors.drawerColor,
      elevation: 0,
      child: Column(
        children: [
          DrawerHeader(
            padding: EdgeInsets.symmetric(vertical: 46),
            child: Text(
              Strings.drawerTitle,
              style: TextStyles.drawerHeaderTextStyle,
            ),
          ),
          Padding(
            padding: drawerPadding,
            child: DrawerListTile(
              title:Strings.homeSection,
              listTileIcon: Icon(Icons.home, color: RGBColors.drawerIconColor,),
            ),
          ),
          Padding(
            padding: drawerPadding,
            child: DrawerListTile(
              title: Strings.audioSection,
              listTileIcon: Icon(Icons.record_voice_over, color: RGBColors.drawerIconColor,),
            ),
          ),
          Padding(
            padding: drawerPadding,
            child: DrawerListTile(
              title: Strings.pricesSection,
              listTileIcon: Icon(Icons.rocket_launch, color: RGBColors.drawerIconColor,),
            ),
          ),
          Padding(
            padding: drawerPadding,
            child: DrawerListTile(
              title: Strings.logoutSection,
              listTileIcon: Icon(Icons.no_accounts_rounded, color: RGBColors.drawerIconColor,),
            ),
          )
        ],
      ),
    );
  }
}

class DrawerListTile extends StatelessWidget {
  final String title;
  final Icon listTileIcon;

  const DrawerListTile(
      {Key? key, required this.title, required this.listTileIcon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: listTileIcon,
      title: Text(
        title,
        style: TextStyles.drawerSectionTextStyle,
      ),
    );
  }
}
