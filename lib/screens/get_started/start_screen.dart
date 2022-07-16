import 'package:flutter/material.dart';

import '../../utils/helper.dart';

class StartScreen extends StatelessWidget {
  static const String routeName = '/Start';

  static Route route() {
    return MaterialPageRoute(
      builder: (_) => const StartScreen(),
      settings: const RouteSettings(name: routeName),
    );
  }

  const StartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          Container(
            margin: EdgeInsets.only(
              bottom: 210,
            ),
            height: double.infinity,
            width: double.infinity,
            child: Image.asset(
              Helper.getAssetName("bg1.jpg", "virtual"),
              fit: BoxFit.fill,
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            // ignore: sized_box_for_whitespace
            child: Container(
              height: 260,
              width: double.infinity,
              child: const DecoratedBox(
                decoration: BoxDecoration(color: Colors.red),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
