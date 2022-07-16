import 'package:flutter/material.dart';

class FilterScreen extends StatelessWidget {
  static const String routeName = '/Filter';

  static Route route() {
    return MaterialPageRoute(
      builder: (_) => const FilterScreen(),
      settings: const RouteSettings(name: routeName),
    );
  }

  const FilterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Filter Screen')),
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/');
            },
            child: const Text('Home Screen')),
      ),
    );
  }
}
