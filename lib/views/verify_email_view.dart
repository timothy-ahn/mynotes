import 'package:flutter/material.dart';
import 'package:mynotes/constants/routes.dart';
import 'package:mynotes/services/auth/auth_service.dart';

class VerifyEmailView extends StatefulWidget {
  const VerifyEmailView({super.key});

  @override
  State<VerifyEmailView> createState() => _VerifyEmailViewState();
}

class _VerifyEmailViewState extends State<VerifyEmailView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Verify Email'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          const Text("We've sent you an email verification."),
          const Text(
              "If you haven't received a verification email yet, press the button bellow"),
          TextButton(
            onPressed: () async {
              await AuthSerivce.firebase().sendEmailVerification();
            },
            child: const Text('Send email verification'),
          ),
          TextButton(
            onPressed: () async {
              await AuthSerivce.firebase().logOut();
              if (!context.mounted) return;
              Navigator.of(context).pushNamedAndRemoveUntil(
                registerRoute,
                (route) => false,
              );
            },
            child: const Text('Restart'),
          )
        ],
      ),
    );
  }
}
