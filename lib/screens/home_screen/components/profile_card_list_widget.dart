import 'package:flutter/material.dart';
import 'package:klimbb148/controllers/app_controller.dart';
import 'package:klimbb148/controllers/profile_controller.dart';
import 'package:klimbb148/models/profile_model.dart';
import 'package:klimbb148/screens/home_screen/components/profile_card_widget.dart';
import 'package:klimbb148/services/isar_db.dart';

class ProfileCardList extends StatelessWidget {
  ProfileCardList({
    super.key,
    required this.profileController,
    required this.appController,
  });

  final ProfileController profileController;
  final AppController appController;
  final IsarService isarService = IsarService();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: StreamBuilder<List<ProfileModel>>(
          stream: isarService.listenToProfiles(),
          builder: (contex, snapshot) {
            debugPrint("snapshot: ${snapshot.data}");
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
            if (snapshot.data == null || snapshot.data?.isEmpty == true) {
              return Center(
                  child: Text(
                "No profiles found. Please add a profile.",
                style: appController.themeData.textTheme.bodySmall!.copyWith(
                  color: appController.themeData.colorScheme.primary,
                ),
              ));
            }

            return ListView.builder(
                itemCount: snapshot.data?.length ?? 0,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      appController.updateSelectedIndex(index + 1);
                      // appController.setSelectedIndexId(index + 1);
                      // appController.changeColorSchemePrimary(
                      //     Color(int.parse(snapshot.data![index].color!)));
                    },
                    child: ProfileCard(
                        appController: appController,
                        profileModelList: snapshot.data!,
                        index: index),
                  );
                });
          }),
    );
  }
}
