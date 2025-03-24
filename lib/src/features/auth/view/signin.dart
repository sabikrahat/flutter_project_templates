import 'package:flutter/material.dart';

class SigninView extends StatelessWidget {
  const SigninView({super.key});

  static const String name = 'signin';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sign In')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Handle sign-in logic here
          },
          child: const Text('Sign In'),
        ),
      ),
    );
  }
}
