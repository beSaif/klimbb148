import 'package:flutter/material.dart';
import 'package:klimbb148/controllers/app_controller.dart';
import 'package:klimbb148/controllers/profile_controller.dart';
import 'package:klimbb148/models/profile_model.dart';
import 'package:klimbb148/screens/home_screen/components/profile_card_widget.dart';

class ProfileCardList extends StatelessWidget {
  const ProfileCardList({
    super.key,
    required this.profileController,
    required this.appController,
  });

  final ProfileController profileController;
  final AppController appController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: ListView.builder(
          itemCount: profileController.profileModelList.length,
          itemBuilder: (context, index) {
            List<ProfileModel> profileModelList =
                profileController.profileModelList.reversed.toList();

            if (profileModelList.isEmpty) {
              return const Center(child: Text("No data found!"));
            }
            return ProfileCard(
                index: index,
                appController: appController,
                profileModelList: profileModelList);
          }),
    );
  }
}
