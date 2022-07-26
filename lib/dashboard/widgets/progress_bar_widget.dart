import 'package:flutter/material.dart';

import '../../core/theme.dart';

class ProgressBarWidget extends StatelessWidget {

  final int avgValue;

  const ProgressBarWidget({Key? key, required this.avgValue}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 4,
      child: SizedBox(
        width: double.infinity,
        child: GridView.builder(
          padding: EdgeInsets.only(left: 8, right: 8),
          itemCount: 5,
          gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 5),
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(2.0),
              child: Container(
                  height: 2,
                  width: 2,
                  // color: Colors.amber,
                  decoration: (avgValue <= index ? BoxDecorationStyles.uncompletedProgressStep : BoxDecorationStyles.completedProgressStep)
              ),
            );
          },
        ),
      ),
    );
  }
}