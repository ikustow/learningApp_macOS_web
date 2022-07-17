import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/auth_provider_state.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    final authService = Provider.of<ProviderState>(context);

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            controller: emailController,
            decoration: InputDecoration(
              labelText: "Email",
            ),
          ),
          SizedBox(
            height: 16,
          ),
          TextField(
            controller: passwordController,
            decoration: InputDecoration(
              labelText: "Password",
            ),
          ),
          SizedBox(
            height: 16,
          ),
          ElevatedButton(onPressed: ()  {
             authService.signUpUser(context,
                email: emailController.text,
                password: passwordController.text);
          }, child: Text("Register")),
          SizedBox(
            height: 16,
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/login');
              },
              child: Text("Already have account?"))
        ],
      ),
    );
  }
}
