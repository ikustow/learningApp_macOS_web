import 'package:flutter/material.dart';
import 'package:web_app_dashboard/auth/widgets/register_button_widget.dart';
import '../../core/services/supabase_service.dart';

class LoginColumn extends StatelessWidget {
  const LoginColumn({Key? key}) : super(key: key);

  @override
  Widget build(
    BuildContext context,
  ) {
    final authService = SupaBaseService();
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
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
        MaterialButton(
            color: Colors.blue.shade700,
            textColor: Colors.white,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
            minWidth: double.infinity,
            height: 52,
            elevation: 24,
            onPressed: () async {
              await authService.signInUser(
                context: context,
                email: emailController.text,
                password: passwordController.text,
              );
            },
            child: Text("Login")),
        SizedBox(
          height: 16,
        ),
        RegisterButtonWidget(),
      ],
    );
  }
}
