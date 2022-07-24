import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:supabase/supabase.dart';
import 'package:web_app_dashboard/auth/pages/login_page/login_page.dart';
import 'package:web_app_dashboard/auth/pages/login_page/login_page_mobile.dart';
import 'package:web_app_dashboard/dashboard/pages/dashboard.dart';
import 'package:web_app_dashboard/dashboard/pages/dashboard_mobile.dart';
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
        mobileBody: DashboardMobile(
          email: savedEmail.toString(),
          username: savedUser.toString(),
        ),
        desktopBody: Dashboard(
          email: savedEmail.toString(),
          username: savedUser.toString(),
        ),
      );

      Navigator.of(context).pushReplacement(
        new MaterialPageRoute(
          builder: (context) => dashboardRoute
        ),
      );
    } else if (result.error?.message != null) {
      Navigator.pushReplacementNamed(context, '/login');
    }
  }

  Future<void> logout(context) async {
    await client.auth.signOut();

    final loginPageRoute = ResponsiveLayout(
      mobileBody: LoginPageMobile(),
      desktopBody: LoginPage(),
    );

    Navigator.of(context).pushReplacement(
      new MaterialPageRoute(
          builder: (context) => loginPageRoute
      ),
    );
  }
}
