import 'package:flutter/material.dart';
import 'package:klimbb148/controllers/app_controller.dart';
import 'package:klimbb148/controllers/profile_controller.dart';
import 'package:klimbb148/screens/home_screen/components/profile_card_list_widget.dart';
import 'package:klimbb148/services/isar_db.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final IsarService isarService = IsarService();

  @override
  Widget build(BuildContext context) {
    return Consumer2<ProfileController, AppController>(
        builder: (context, profileController, appController, child) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (appController.isFirstLaunch) {
          appController.setisFirstLaunch(false);

          Navigator.pushNamed(context, "/create_profile_screen");
        }
      });

      return Scaffold(
          appBar: AppBar(
            title: const Text("Profile List"),
            actions: [
              IconButton(
                  onPressed: () {
                    isarService.cleanDb();
                  },
                  icon: const Icon(Icons.delete)),
              IconButton(
                  onPressed: () {
                    Navigator.pushNamed(context, "/create_profile_screen");
                  },
                  icon: const Icon(Icons.add))
            ],
          ),
          body: profileController.isLoading
              ? const Center(child: CircularProgressIndicator())
              : ProfileCardList(
                  profileController: profileController,
                  appController: appController,
                ));
    });
  }
}
