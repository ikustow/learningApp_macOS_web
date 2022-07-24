
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:web_app_dashboard/core/models/learning_progress.dart';
import 'package:web_app_dashboard/dashboard/controller/providers.dart';
import 'package:web_app_dashboard/dashboard/widgets/empty_progress_list_widgets.dart';
import 'package:web_app_dashboard/dashboard/widgets/progress_list_widgets.dart';

class CurrentProgressList extends StatefulWidget {
  final String email;
  const CurrentProgressList({Key? key, required this.email}) : super(key: key);

  @override
  State<CurrentProgressList> createState() => _CurrentProgressListState();
}

class _CurrentProgressListState extends State<CurrentProgressList> {
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context,  WidgetRef ref, child) {

        AsyncValue<List<LearningProgress>> progressValues = ref.watch(currentUserProgress(widget.email));

        return progressValues.when(
          data: (progressValues) => ProgressList(progressValues: progressValues,),
          loading: () => EmptyProgressList(),
          error: (e, stackTrace) => Text("Error!!!"),
        );
      },
    );
  }
}