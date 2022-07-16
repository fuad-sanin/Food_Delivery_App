import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:foodapp/config/auth_provider.dart';
import 'package:foodapp/config/constants.dart';
import 'package:foodapp/screens/screens.dart';
import 'package:provider/provider.dart';

import '../login/loginScreen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _email = TextEditingController(),
      _pass = TextEditingController();

  @override
  void dispose() {
    _email.dispose();
    _pass.dispose();

    super.dispose();
  }

  void signUp(AuthProvider provider) async {
    final msg = await provider.signUp(_email.text, _pass.text);
    if (msg == '') return;
    // ignore: use_build_context_synchronously
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    // ignore: use_build_context_synchronously
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
  }

  @override
  Widget build(BuildContext context) {
    final authProvider = context.watch<AuthProvider>();
    return StreamBuilder<User?>(
        stream: authProvider.stream(),
        builder: (context, snapshot) {
          if (snapshot.hasData) return const HomeScreen();
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
                      const Text('SignUp'),
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
                                      builder: (_) => const LoginScreen())),
                              child: const Text('Login'))
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
                            onPressed: () => signUp(authProvider),
                            child: const Text('Sign up'),
                          ),
                        )
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}
