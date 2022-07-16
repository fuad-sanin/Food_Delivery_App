import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:foodapp/config/auth_provider.dart';
import 'package:foodapp/config/theme.dart';
import 'package:provider/provider.dart';

import '../signup/signup_screen.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = '/home';
  static Route route() {
    return MaterialPageRoute(
      builder: (_) => const HomeScreen(),
      settings: const RouteSettings(name: routeName),
    );
  }

  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
        stream: context.watch<AuthProvider>().stream(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) return const SignUpScreen();
          return Scaffold(
            appBar: AppBar(
              title: Text(
                'Home',
                style: AppTextStyle.bold(),
              ),
              actions: [
                IconButton(
                  onPressed: () => context.read<AuthProvider>().signOut(),
                  icon: const Icon(Icons.logout),
                  splashRadius: 20,
                )
              ],
            ),
            body: Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/start');
                },
                child: Text(
                  'Location Screen',
                  style: AppTextStyle.whiteBold(),
                ),
              ),
            ),
          );
        });
  }
}
