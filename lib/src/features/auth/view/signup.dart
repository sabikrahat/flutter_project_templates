import 'package:flutter/material.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});

  static const String name = 'signup';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sign Up')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Handle sign-up logic here
          },
          child: const Text('Sign Up'),
        ),
      ),
    );
  }
}
