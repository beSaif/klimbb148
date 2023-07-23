import 'package:flutter/material.dart';
import 'package:klimbb148/controllers/app_controller.dart';
import 'package:klimbb148/controllers/profile_controller.dart';
import 'package:klimbb148/screens/home_screen/components/profile_card_list_widget.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer2<ProfileController, AppController>(
        builder: (context, profileController, appController, child) {
      return Scaffold(
          appBar: AppBar(
            title: const Text("Profile List"),
            actions: [
              // add + button to add new profile
              IconButton(
                  onPressed: () {
                    Navigator.pushNamed(context, "/create_profile_screen");
                  },
                  icon: const Icon(Icons.add))
            ],
          ),
          body: profileController.isLoading
              ? const Center(child: CircularProgressIndicator())
              : profileController.profileModelList.isNotEmpty
                  ? ProfileCardList(
                      profileController: profileController,
                      appController: appController,
                    )
                  : Center(
                      child: Text(
                      "No profiles found. Please add a profile.",
                      style:
                          appController.themeData.textTheme.bodySmall!.copyWith(
                        color: appController.themeData.colorScheme.primary,
                      ),
                    )));
    });
  }
}
