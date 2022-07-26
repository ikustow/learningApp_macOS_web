

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:web_app_dashboard/core/models/learning_progress.dart';

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
              decoration: progressListDecoration,
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

 final BoxDecoration progressListDecoration = BoxDecoration(
  borderRadius: BorderRadius.circular(6),
     boxShadow: [
       BoxShadow(
         color: Colors.white70.withOpacity(0.5),
         spreadRadius: 3,
         blurRadius: 3,
         offset: Offset(3, 3), // changes position of shadow
       ),
     ],

 // border: Border.all(width: 0.5, color: Colors.blue.shade200),
  color: Colors.white70.withOpacity(.6)
);

final BoxDecoration completedProgressValueTileDecoration = BoxDecoration(
  borderRadius: BorderRadius.circular(6),
  color: Colors.greenAccent.withOpacity(.5),
  boxShadow: [
    BoxShadow(
      color: Colors.greenAccent.withOpacity(0.5),
      spreadRadius: 3,
      blurRadius: 5,
      offset: Offset(0, 3), // changes position of shadow
    ),
  ],
);

final BoxDecoration uncompletedProgressValueTileDecoration = BoxDecoration(
    borderRadius: BorderRadius.circular(6),
    border: Border.all(
      color: Colors.greenAccent,
      width: 1,
    ),
    color: Colors.white70.withOpacity(.5),

);

final TextStyle progressValueTileTitleTextStyle =  TextStyle(
  fontSize: 16,
  letterSpacing: 1,
  color: Colors.black,
  fontWeight: FontWeight.normal,
);

final TextStyle progressValueTileDescTextStyle =  TextStyle(
  fontSize: 14,
  color: Colors.black54,
  fontWeight: FontWeight.normal,
);


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
        decoration:  (progressValue.isCompleted ? completedProgressValueTileDecoration : uncompletedProgressValueTileDecoration),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 8.0, top: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                Text(progressValue.name, style: progressValueTileTitleTextStyle,),
                SizedBox(height: 8.0,),
                Text(progressValue.desc,style: progressValueTileDescTextStyle,),
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

class CompletedIcon extends StatelessWidget {
  const CompletedIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: completedIconDecoration,
      child: Icon(Icons.done, color: Colors.greenAccent,),
    );
  }
}

final BoxDecoration completedIconDecoration = BoxDecoration(
  borderRadius: BorderRadius.circular(6),
  color: Colors.white70.withOpacity(.5),

);

final BoxDecoration uncompletedIconDecoration = BoxDecoration(
  borderRadius: BorderRadius.circular(6),
  color: Colors.lightGreen.withOpacity(.5),

);

class UncompletedIcon extends StatelessWidget {
  const UncompletedIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: uncompletedIconDecoration,
      child: Icon(Icons.arrow_forward_rounded, color: Colors.white,),
    );
  }
}
