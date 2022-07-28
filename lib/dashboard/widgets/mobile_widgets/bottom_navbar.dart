import 'package:flutter/material.dart';
import 'package:web_app_dashboard/core/const_strings.dart';

class BottomNavigationBarWidget extends StatefulWidget {

  final int index;
  const BottomNavigationBarWidget({Key? key, required this.index, }) : super(key: key);

  @override
  State<BottomNavigationBarWidget> createState() => _BottomNavigationBarWidgetState();
}

class _BottomNavigationBarWidgetState extends State<BottomNavigationBarWidget> {
  late int selectedIndex = widget.index;

  @override
  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;

    });
  }

  Widget build(BuildContext context) {
    return BottomNavigationBar(

      currentIndex: selectedIndex,
      selectedFontSize: 18,
      selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
      selectedItemColor: Colors.black,

      items:  <BottomNavigationBarItem>[

        BottomNavigationBarItem(
          icon: Icon(Icons.home_outlined),
          label: Strings.audioSection,
        ),

        BottomNavigationBarItem(
          icon: Icon(Icons.bar_chart_outlined),
          label: Strings.pricesSection,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.info_outline),
          label: Strings.logoutSection,
        ),
      ],
      onTap: onItemTapped,
    );
  }
}
