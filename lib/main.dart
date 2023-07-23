import 'package:flutter/material.dart';
import 'package:klimbb148/controllers/app_controller.dart';
import 'package:klimbb148/controllers/profile_controller.dart';
import 'package:klimbb148/screens/home_screen/home_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => ProfileController()),
    ChangeNotifierProvider(create: (_) => AppController())
  ], child: const MainApp()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AppController>(builder: (context, appController, child) {
      return SafeArea(
        child: MaterialApp(
            debugShowCheckedModeBanner: false,
            home: const HomeScreen(),
            theme: appController.themeData),
      );
    });
  }
}
