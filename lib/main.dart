import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:web_app_dashboard/responsive/responsive_layout.dart';
import 'auth/pages/login_page/login_page.dart';
import 'auth/pages/login_page/login_page_mobile.dart';
import 'consts.dart';
import 'dashboard/pages/dashboard.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: supabaseUrl,
    anonKey: token,
  );
  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Supabase Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        routes: <String, WidgetBuilder>{
         // '/': (_) =>  StartPage(),
          '/login': (_) => ResponsiveLayout(
            desktopBody: LoginPage(),
            mobileBody: LoginPageMobile(),),
        //  '/dashboard': (_) =>  Dashboard(username:"test", email: "test",),
         // '/home': (_) => const HomePage(),
        },
      home: StartPage(),
        // home: ResponsiveLayout(
        //   desktopBody: LoginPage(),
        //   mobileBody: LoginPageMobile(),
    );
  }
}


class StartPage extends StatefulWidget {
  const StartPage({Key? key}) : super(key: key);

  @override
  _StartPageState createState() => _StartPageState();
}

class _StartPageState extends AuthState<StartPage> {
  @override
  void initState() {
    recoverSupabaseSession();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: CircularProgressIndicator()),
    );
  }
}


class AuthState<T extends StatefulWidget> extends SupabaseAuthState<T> {
  @override
  void onUnauthenticated() {
    if (mounted) {

      Navigator.pushReplacementNamed(context, '/login');
    }
  }

  @override
  void onAuthenticated(Session session) {
    if (mounted) {
      Navigator.pushReplacementNamed(context, '/dashboard');
    }
  }

  @override
  void onPasswordRecovery(Session session) {}

  @override
  void onErrorAuthenticating(String message) {
    Navigator.pushReplacementNamed(context, '/login');
  }
}