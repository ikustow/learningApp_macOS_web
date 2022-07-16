import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'auth/pages/login_page.dart';
import 'auth/pages/register_page.dart';
import 'auth/providers/auth_provider_state.dart';
import 'dashboard/pages/dashboard.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<ProviderState>(create:(_) => ProviderState(),)
      ],
      child: MaterialApp(
        title: 'Supabase Demo',
        debugShowCheckedModeBanner: false,
        initialRoute: 'login',
        routes: {
          '/login': (_) => const LoginPage(),
          '/register': (_) => const RegisterPage(),
          '/dashboard': (_) => const Dashboard(),
        },
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const LoginPage(),
      ),
    );
  }
}

