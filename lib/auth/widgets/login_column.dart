import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:web_app_dashboard/auth/widgets/register_button_widget.dart';
import '../providers/auth_provider_state.dart';


class LoginColumn extends StatelessWidget {
  const LoginColumn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    final authService = Provider.of<ProviderState>(context);

    return Column(

      children: [
        TextField(
          controller: emailController,
          decoration: InputDecoration(
            labelText: "Email",
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        TextField(
          controller: passwordController,
          decoration: InputDecoration(
            labelText: "Password",
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        ElevatedButton(
          onPressed: () {
            authService.signInUser(context,
                email: emailController.text, password: passwordController.text);
          },
          child: Text("Login"),
        ),
        SizedBox(
          height: 16,
        ),
        RegisterButtonWidget(),
      ],
    );
  }
}
