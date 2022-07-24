
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:web_app_dashboard/core/models/user_main_goal.dart';
import 'package:web_app_dashboard/dashboard/controller/providers.dart';

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

      builder: (context,  WidgetRef ref, child) {
        AsyncValue<List<UserMainGoal>> goals = ref.watch(mainGoalsProvider(widget.email));

        return goals.when(
          data: (goals) => ListOfGoals(goals: goals,),
          loading: () => EmptyListOfGoals(),
          error: (e, stackTrace) => Text("Error!!!"),
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
          gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4),
          itemBuilder: (context, index) {
            return Card(
              child: Column(children: [
                Text(goals[index].name),
                Text(goals[index].desc),
                Text(goals[index].currentValue.toString()),
                Text(goals[index].totalValue.toString()),
              ],),
            );
          },
        ),
      ),
    );
  }
}


class EmptyListOfGoals extends StatelessWidget {

  const EmptyListOfGoals({Key? key, }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 4,
      child: SizedBox(
        width: double.infinity,
        child: GridView.builder(
          itemCount: 4,
          gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4),
          itemBuilder: (context, index) {
            return Card(
            );
          },
        ),
      ),
    );
  }
}