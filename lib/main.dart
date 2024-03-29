import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:web_app_dashboard/generated/l10n.dart';
import 'package:web_app_dashboard/responsive/responsive_layout.dart';
import 'auth/pages/login_page/login_page.dart';
import 'auth/pages/login_page/login_page_mobile.dart';
import 'auth/pages/register_page/register_page.dart';
import 'auth/pages/start_page.dart';

void main() async {

  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      title: 'Supabase Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: <String, WidgetBuilder>{
        '/login': (_) => const ResponsiveLayout(
              desktopBody: LoginPage(),
              smallBody: LoginPageMobile(),
              tabletBody: LoginPageMobile(),
              mobileAppBody: LoginPageMobile(),
            ),
        '/register': (_) => const RegisterPage(),
      },
      home: const StartPage(),
    );
  }
}
