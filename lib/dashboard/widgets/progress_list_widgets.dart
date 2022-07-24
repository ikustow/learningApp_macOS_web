

import 'package:flutter/material.dart';
import 'package:web_app_dashboard/core/models/learning_progress.dart';

class ProgressList extends StatelessWidget {
  final List<LearningProgress> progressValues;
  const ProgressList({Key? key, required this.progressValues}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: progressValues.length,
        itemBuilder: (context, index) {
          return ProgressValueTile(progressValue: progressValues[index],);
        },
      ),
    );
  }
}



class ProgressValueTile extends StatelessWidget {
  final LearningProgress progressValue;
  const ProgressValueTile({Key? key, required this.progressValue}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 78,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8), color: Colors.grey[200]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(children: [
              Text(progressValue.name),
              Text(progressValue.desc),
            ],),
            Icon(Icons.add),
          ],
        ),
      ),
    );
  }
}
