
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:web_app_dashboard/core/models/learning_progress.dart';
import 'package:web_app_dashboard/core/theme.dart';

class ProgressList extends StatelessWidget {
  final List<LearningProgress> progressValues;
  const ProgressList({Key? key, required this.progressValues}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: ClipRRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
            child: Container(
              decoration: BoxDecorationStyles.progressListDecoration,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView.builder(
                  itemCount: progressValues.length,
                  itemBuilder: (context, index) {
                    return ProgressValueTile(progressValue: progressValues[index],);
                  },
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}


class ProgressValueTile extends StatelessWidget {
  final LearningProgress progressValue;
  const ProgressValueTile({Key? key, required this.progressValue}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final lessonsCount = progressValue.lessonsCount.toString();
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 78,
        decoration:  (progressValue.isCompleted ? BoxDecorationStyles.completedProgressValueTileDecoration : BoxDecorationStyles.uncompletedProgressValueTileDecoration),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 8.0, top: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                Text(progressValue.name, style: TextStyles.progressValueTileTitleTextStyle,),
                SizedBox(height: 8.0,),
                Text(progressValue.desc,style: TextStyles.progressValueTileDescTextStyle,),
              ],),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("$lessonsCount lessons"),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child:  (progressValue.isCompleted ? CompletedIcon() : UncompletedIcon()),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

