import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/models/user_main_goal.dart';
import '../../../core/theme.dart';
import '../../controller/providers.dart';
import '../web_widgets/progress_bar_widget.dart';

class MainGoalsMobileGridView extends StatefulWidget {
  final String email;

  const MainGoalsMobileGridView({Key? key, required this.email}) : super(key: key);

  @override
  State<MainGoalsMobileGridView> createState() => _MainGoalsGridViewMobileState();
}

class _MainGoalsGridViewMobileState extends State<MainGoalsMobileGridView> {
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, WidgetRef ref, child) {
        AsyncValue<List<UserMainGoal>> goals =
        ref.watch(mainGoalsProvider(widget.email));

        return goals.when(
          data: (goals) =>
              ListOfGoalsMobile(
                goals: goals,
              ),
          loading: () => const EmptyListOfGoalsMobile(),
          error: (e, stackTrace) => const CircularProgressIndicator(),
        );
      },
    );
  }
}

class ListOfGoalsMobile extends StatelessWidget {
  final List<UserMainGoal> goals;

  const ListOfGoalsMobile({Key? key, required this.goals}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width*0.9,
      child: GridView.builder(
        shrinkWrap: true,
        itemCount: 4,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (context, index) {
          return Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AutoSizeText(
                    goals[index].name,
                    style: TextStyles.mainGoalTitleTextStyle,
                    minFontSize: 10,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  ProgressBarWidget(
                    avgValue: goals[index].getAverageProgressValue(),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(goals[index].currentValue.toString()),
                      const Text(' / '),
                      Text(goals[index].totalValue.toString()),
                    ],
                  ),
                  Text(
                    goals[index].desc,
                    style: TextStyles.mainGoalDescriptionTextStyle,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class EmptyListOfGoalsMobile extends StatelessWidget {
  const EmptyListOfGoalsMobile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: GridView.builder(
        shrinkWrap: true,
        itemCount: 4,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2),
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
    );
  }
}