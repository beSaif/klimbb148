import 'package:flutter/material.dart';
import 'package:klimbb148/controllers/app_controller.dart';
import 'package:klimbb148/screens/first_launch_screen/first_launch_screen.dart';
import 'package:klimbb148/screens/home_screen/home_screen.dart';
import 'package:provider/provider.dart';

class Initial extends StatelessWidget {
  const Initial({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AppController>(builder: (context, appController, child) {
      if (appController.isFirstLaunch) {
        return const FirstLaunchScreen();
      } else if (appController.isLoading) {
        return const Scaffold(body: Center(child: CircularProgressIndicator()));
      } else {
        return const HomeScreen();
      }
    });
  }
}
