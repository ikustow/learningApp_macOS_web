import 'package:flutter/material.dart';
import 'package:supabase/supabase.dart';

const String supabaseUrl = "https://bluchzwajzpsbbcdyrxg.supabase.co";
const String token = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImJsdWNoendhanpwc2JiY2R5cnhnIiwicm9sZSI6ImFub24iLCJpYXQiOjE2NTgwMDU5NDYsImV4cCI6MTk3MzU4MTk0Nn0.ti0V1Nf8CDNK2Y9wtgMzwCxp2EzStpPs9rQBVz85OZY";


class ProviderState {



  final client = SupabaseClient(supabaseUrl, token);


  Future<void> signUpUser(context, {String? email, String? password}) async {
    debugPrint("email:$email password:$password");
    final result = await client.auth.signUp(email!, password!);

    debugPrint(result.data?.toJson().toString());

    if (result.data != null) {
      Navigator.pushReplacementNamed(context, '/login');

    } else if (result.error?.message != null) {

    }
    else if (result.error?.message == null) {
      Navigator.pushReplacementNamed(context, '/login');
    }

  }

  Future<void> signInUser(context, {String? email, String? password}) async {
    debugPrint("email:$email password:$password");
    final result = await client.auth.signIn(email: email!, password: password!);
    debugPrint(result.data!.toJson().toString());

    if (result.data != null) {
      Navigator.pushReplacementNamed(context, '/dashboard');
      } else if (result.error?.message != null) {
      Navigator.pushReplacementNamed(context, '/register');
    }
  }

  Future<void> logout (context)async{
    await client.auth.signOut();
    Navigator.pushReplacementNamed(context, '/login');
  }
}