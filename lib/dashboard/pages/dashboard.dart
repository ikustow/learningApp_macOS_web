import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../widgets/drawer_widget.dart';


class Dashboard extends StatelessWidget {
  final String username;
  final String email;
  const Dashboard ({Key? key, required this.username, required this.email}) : super(key: key);


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          DrawerWidget(),
          Expanded(
            flex: 2,
            child: Column(
              children: [
                // first 4 boxes in grid
                AspectRatio(
                  aspectRatio: 4,
                  child: SizedBox(
                    width: double.infinity,
                    child: GridView.builder(
                      itemCount: 4,
                      gridDelegate:
                      const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 4),
                      itemBuilder: (context, index) {
                        return Card();
                      },
                    ),
                  ),
                ),

                // list of previous days
              ],
            ),
          ),
        ],),
      )
    );
  }
}
