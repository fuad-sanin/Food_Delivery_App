// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:foodapp/config/auth_provider.dart';
import 'package:foodapp/config/constants.dart';
import 'package:provider/provider.dart';

import '../signup/signup_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _email = TextEditingController(),
      _pass = TextEditingController();

  @override
  void dispose() {
    _email.dispose();
    _pass.dispose();

    super.dispose();
  }

  void signIn(AuthProvider provider) async {
    final msg = await provider.signIn(_email.text, _pass.text);
    if (msg == '') return;
    // ignore: use_build_context_synchronously
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    // ignore: use_build_context_synchronously
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
  }

  @override
  Widget build(BuildContext context) {
    final authProvider = context.watch<AuthProvider>();
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          body: Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text('login'),
                htspace20,
                TextField(
                  controller: _email,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text('Email'),
                  ),
                ),
                htspace20,
                TextField(
                  controller: _pass,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text('Password'),
                  ),
                ),
                htspace40,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                        onPressed: () => Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (_) => const SignUpScreen())),
                        child: const Text('Sign up'))
                  ],
                ),
                if (authProvider.loading)
                  const CircularProgressIndicator(
                    strokeWidth: 2,
                  ),
                if (!authProvider.loading)
                  SizedBox(
                    width: double.maxFinite,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        elevation: MaterialStateProperty.all(0),
                      ),
                      onPressed: () => signIn(authProvider),
                      child: const Text('Sign in'),
                    ),
                  )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
