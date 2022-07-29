import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:web_app_dashboard/core/models/learning_progress.dart';
import 'package:web_app_dashboard/core/theme.dart';
import 'package:web_app_dashboard/dashboard/controller/providers.dart';
import 'package:web_app_dashboard/dashboard/widgets/web_widgets/empty_progress_list_widgets.dart';

class CurrentProgressListMobile extends StatefulWidget {
  final String email;
  const CurrentProgressListMobile({Key? key, required this.email}) : super(key: key);

  @override
  State<CurrentProgressListMobile> createState() => _CurrentProgressListMobileState();
}

class _CurrentProgressListMobileState extends State<CurrentProgressListMobile> {
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context,  WidgetRef ref, child) {

        AsyncValue<List<LearningProgress>> progressValues = ref.watch(currentUserProgress(widget.email));

        return progressValues.when(
          data: (progressValues) => ProgressListMobile(progressValues: progressValues,),
          loading: () => const EmptyProgressList(),
          error: (e, stackTrace) => const CircularProgressIndicator(),
        );
      },
    );
  }
}

class ProgressListMobile extends StatelessWidget {
  final List<LearningProgress> progressValues;
  const ProgressListMobile({Key? key, required this.progressValues}) : super(key: key);

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
                    return ProgressValueTileMobile(progressValue: progressValues[index],);
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


class ProgressValueTileMobile extends StatelessWidget {
  final LearningProgress progressValue;
  const ProgressValueTileMobile({Key? key, required this.progressValue}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final lessonsCount = progressValue.lessonsCount.toString();
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration:  (progressValue.isCompleted ? BoxDecorationStyles.completedProgressValueTileDecoration : BoxDecorationStyles.uncompletedProgressValueTileDecoration),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 8.0, top: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(progressValue.name, style: TextStyles.progressValueTileTitleTextStyle,),
                  const SizedBox(height: 8.0,),
                  Text(progressValue.desc,style: TextStyles.progressValueTileDescTextStyle,),
                  Padding(
                    padding: const EdgeInsets.only( top: 8.0,bottom: 8.0),
                    child: Text("$lessonsCount lessons"),
                  ),
                ],),
            ),
          ],
        ),
      ),
    );
  }
}