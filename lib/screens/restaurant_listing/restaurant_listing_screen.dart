import 'package:flutter/material.dart';

class RestaurantListingScreen extends StatelessWidget {
  static const String routeName = '/RestaurantListing';

  static Route route() {
    return MaterialPageRoute(
      builder: (_) => const RestaurantListingScreen(),
      settings: const RouteSettings(name: routeName),
    );
  }

  const RestaurantListingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('RestaurantListing Screen')),
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
