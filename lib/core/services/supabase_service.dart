import 'dart:math';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:supabase/supabase.dart';
import 'package:web_app_dashboard/auth/pages/login_page/login_page.dart';
import 'package:web_app_dashboard/auth/pages/login_page/login_page_mobile.dart';
import 'package:web_app_dashboard/core/models/learning_progress.dart';
import 'package:web_app_dashboard/core/models/random_word.dart';
import 'package:web_app_dashboard/core/models/user_main_goal.dart';
import 'package:web_app_dashboard/dashboard/pages/dashboard.dart';
import 'package:web_app_dashboard/dashboard/pages/dashboard_mobile_web.dart';
import 'package:web_app_dashboard/dashboard/pages/dashboard_mobile_app.dart';
import 'package:web_app_dashboard/dashboard/pages/dashboard_tablet.dart';
import 'package:web_app_dashboard/responsive/responsive_layout.dart';
import '../../consts.dart';

class SupaBaseService {
  final client = SupabaseClient(supabaseUrl, token);

  Future<void> signUpUser(context, {String? email, String? password}) async {
    debugPrint("email:$email password:$password");
    final result = await client.auth.signUp(email!, password!);

    debugPrint(result.data?.toJson().toString());

    if (result.data != null) {
      Navigator.pushReplacementNamed(context, '/login');
    } else if (result.error?.message != null) {
    } else if (result.error?.message == null) {
      Navigator.pushReplacementNamed(context, '/login');
    }
  }

  Future<void> signInUser({context, String? email, String? password}) async {
    debugPrint("email:$email password:$password");
    final result = await client.auth.signIn(email: email!, password: password!);
    debugPrint(result.data!.toJson().toString());

    if (result.data != null) {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('user', result.user!.id.toString());
      await prefs.setString('email', result.user!.email.toString());

      var savedUser = await prefs.getString('user');
      var savedEmail = await prefs.getString('email');

      final dashboardRoute = ResponsiveLayout(
        smallBody: DashboardSmallWidget(
          email: savedEmail.toString(),
          username: savedUser.toString(),
        ),
        desktopBody: Dashboard(
          email: savedEmail.toString(),
          username: savedUser.toString(),
        ),
        tabletBody: DashboardTablet(
          email: savedEmail.toString(),
          username: savedUser.toString(),
        ),
        mobileAppBody:DashboardMobileApp(
          email: savedEmail.toString(),
          username: savedUser.toString(),
        ),
      );

      Navigator.of(context).pushReplacement(
        new MaterialPageRoute(builder: (context) => dashboardRoute),
      );
    } else if (result.error?.message != null) {
      Navigator.pushReplacementNamed(context, '/login');
    }
  }

  Future<void> logout(context) async {
    await client.auth.signOut();

    final pref = await SharedPreferences.getInstance();
    await pref.clear();


    final loginPageRoute = ResponsiveLayout(
      smallBody: LoginPageMobile(),
      desktopBody: LoginPage(),
      tabletBody: LoginPageMobile(), mobileAppBody: LoginPageMobile(),
    );

    Navigator.of(context).pushReplacement(
      new MaterialPageRoute(builder: (context) => loginPageRoute),
    );
  }

  static Future<List<UserMainGoal>> getMainGoalsByUser(email) async {
    final client = SupabaseClient(supabaseUrl, token);

    final response = await client
        .from('UserMainGoals')
        .select()
        .eq('userEmail', email)
        .execute();

    final List<UserMainGoal> goals = [];

    for (final dataRow in response.data) {
      final goal = UserMainGoal(
        totalValue: (dataRow['totalValue'] ?? 0) as int,
        id: (dataRow['id'] ?? 0) as int,
        userEmail: (dataRow['userEmail'] ?? '') as String,
        name: (dataRow['name'] ?? '') as String,
        desc: (dataRow['desc'] ?? '') as String,
        currentValue: (dataRow['currentValue'] ?? 0) as int,
      );
      goals.add(goal);
    }

    return goals;
  }

  static Future<List<LearningProgress>> getCurrentProgressByUser(email) async {
    final client = SupabaseClient(supabaseUrl, token);

    final response = await client
        .from('LearningProgress')
        .select()
        .eq('userEmail', email)
        .execute();

    final List<LearningProgress> progressValues = [];

    for (final dataRow in response.data) {
      final value = LearningProgress(
        name: (dataRow['name'] ?? '') as String,
        desc: (dataRow['desc'] ?? '') as String,
        lessonsCount: (dataRow['lessons'] ?? 0) as int,
        isCompleted: (dataRow['completed'] ?? false) as bool,
      );
      progressValues.add(value);
    }

    return progressValues;
  }

  static Future<List<RandomWord>> getRandomWordToLearn(id) async {
    final client = SupabaseClient(supabaseUrl, token);

    final response = await client.from('RandomWord').select().execute();

    final List<RandomWord> allWords = [];

    for (final dataRow in response.data) {
      final value = RandomWord(
        id: (dataRow['id'] ?? 0) as int,
        value: (dataRow['value'] ?? '') as String,
        phoneticValue: (dataRow['desc'] ?? '') as String,
        translateValue: (dataRow['transvalue'] ?? '') as String,
      );
      allWords.add(value);
    }

    final rangeValue = allWords.length;

    Random random = new Random();
    int randomNumber = random.nextInt(rangeValue);

    final wordToLearn = getRandomValue(allWords, id);
    final List<RandomWord> newStateList = [wordToLearn];

    print(wordToLearn);
    return newStateList;
  }

 static getRandomValue(allWords, index){
    Random random = new Random();
    int randomNumber = random.nextInt(allWords.length-1);

    print(index);
    print(allWords.length-1);
    if (index != randomNumber){
      final wordToLearn = allWords[randomNumber];
      return wordToLearn;
    }
    else
    {
      getRandomValue(allWords, index);
    }
  }

}
