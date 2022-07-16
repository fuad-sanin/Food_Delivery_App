import 'package:flutter/material.dart';

class DeliveryTimeScreen extends StatelessWidget {
  static const String routeName = '/DeliveryTime';

  static Route route() {
    return MaterialPageRoute(
      builder: (_) => const DeliveryTimeScreen(),
      settings: const RouteSettings(name: routeName),
    );
  }

  const DeliveryTimeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('DeliveryTime Screen')),
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
