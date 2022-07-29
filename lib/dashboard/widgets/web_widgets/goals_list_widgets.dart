import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:web_app_dashboard/core/models/user_main_goal.dart';
import 'package:web_app_dashboard/core/theme.dart';
import 'package:web_app_dashboard/dashboard/controller/providers.dart';
import 'package:web_app_dashboard/dashboard/widgets/web_widgets/progress_bar_widget.dart';

class MainGoalsGridView extends StatefulWidget {
  final String email;

  const MainGoalsGridView({Key? key, required this.email}) : super(key: key);

  @override
  State<MainGoalsGridView> createState() => _MainGoalsGridViewState();
}

class _MainGoalsGridViewState extends State<MainGoalsGridView> {
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, WidgetRef ref, child) {
        AsyncValue<List<UserMainGoal>> goals =
        ref.watch(mainGoalsProvider(widget.email));

        return goals.when(
          data: (goals) =>
              ListOfGoals(
                goals: goals,
              ),
          loading: () => const EmptyListOfGoals(),
          error: (e, stackTrace) => const CircularProgressIndicator(),
        );
      },
    );
  }
}

class ListOfGoals extends StatelessWidget {
  final List<UserMainGoal> goals;

  const ListOfGoals({Key? key, required this.goals}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 4,
      child: SizedBox(
        width: double.infinity,
        child: GridView.builder(
          itemCount: 4,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4),
          itemBuilder: (context, index) {
            return Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:
                  [
                    AutoSizeText(goals[index].name,style: TextStyles.mainGoalTitleTextStyle, minFontSize: 10, overflow: TextOverflow.ellipsis,),
                    const SizedBox(height: 32,),
                    ProgressBarWidget(avgValue:goals[index].getAverageProgressValue(),),
                    Row(mainAxisAlignment:MainAxisAlignment.center,
                      children:[
                        Text(goals[index].currentValue.toString()),
                        const Text(' / '),
                        Text(goals[index].totalValue.toString()),
                      ],),
                  Text(goals[index].desc, style: TextStyles.mainGoalDescriptionTextStyle,),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}



class EmptyListOfGoals extends StatelessWidget {
  const EmptyListOfGoals({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 4,
      child: SizedBox(
        width: double.infinity,
        child: GridView.builder(
          itemCount: 4,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4),
          itemBuilder: (context, index) {
            return const Card(
              child: Center(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: CircularProgressIndicator(),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

