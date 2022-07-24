
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:web_app_dashboard/core/models/learning_progress.dart';
import 'package:web_app_dashboard/core/models/random_word.dart';
import 'package:web_app_dashboard/core/models/user_main_goal.dart';
import 'package:web_app_dashboard/core/services/supabase_service.dart';


final mainGoalsProvider = FutureProvider.family< List<UserMainGoal>, String>((ref, email)  async {

  final goals = SupaBaseService.getMainGoalsByUser(email);
  return goals;

});

final currentUserProgress = FutureProvider.family< List<LearningProgress>, String>((ref, email)  async {

  final progressValues = SupaBaseService.getCurrentProgressByUser(email);
  return progressValues;

});

class RandomWordController extends StateNotifier <List<RandomWord>> {
  RandomWordController(List<RandomWord> state) : super(state);


  updateWord(int id) async {
    final newState =
        await SupaBaseService.getRandomWordToLearn(id);
    state = newState ;
  }

}


final randomWordProvider = StateNotifierProvider<RandomWordController, List<RandomWord>>((ref) {

  final List<RandomWord> initiaWords = [];
    final value = RandomWord(
      id: ( 0) as int,
      value: ("Bank") as String,
      phoneticValue:  ("Bank") as String,
      translateValue:  ("Bank") as String,
    );
  initiaWords.add(value);

  return RandomWordController(initiaWords);
});

