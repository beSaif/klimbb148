import 'package:flutter/material.dart';
import 'package:klimbb148/configs/constants.dart';
import 'package:klimbb148/controllers/app_controller.dart';
import 'package:klimbb148/models/profile_model.dart';

class ProfileCard extends StatelessWidget {
  const ProfileCard({
    super.key,
    required this.appController,
    required this.profileModelList,
    required this.index,
  });

  final AppController appController;
  final List<ProfileModel> profileModelList;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Material(
        elevation: 4,
        borderRadius: borderRadius3,
        child: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: borderRadius3,
            color: appController.themeData.colorScheme.secondary,
          ),
          height: 120,
          child: Column(
            children: [
              Row(
                children: [
                  Text("#${index + 1}",
                      style: appController.themeData.textTheme.displayLarge!
                          .copyWith(
                              color: appController
                                  .themeData.colorScheme.tertiary)),
                  const Spacer(),
                  Text("Profile Details",
                      style: appController.themeData.textTheme.bodyMedium!
                          .copyWith(
                              color: appController
                                  .themeData.colorScheme.tertiary)),
                ],
              ),
              Divider(
                color: appController.themeData.colorScheme.tertiary,
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Text("Coordinates",
                            style: appController.themeData.textTheme.bodySmall!
                                .copyWith(
                                    color: appController
                                        .themeData.colorScheme.tertiary)),
                        const SizedBox(height: 5),
                        Text(
                            "( ${profileModelList[index].lat}, ${profileModelList[index].lng} )",
                            style: appController.themeData.textTheme.bodyMedium!
                                .copyWith(
                                    color: appController
                                        .themeData.colorScheme.tertiary)),
                      ],
                    ),
                    Column(
                      children: [
                        Text("Font Size",
                            style: appController.themeData.textTheme.bodySmall!
                                .copyWith(
                                    color: appController
                                        .themeData.colorScheme.tertiary)),
                        const SizedBox(height: 5),
                        Text("${profileModelList[index].fontSize}",
                            style: appController.themeData.textTheme.bodyMedium!
                                .copyWith(
                                    color: appController
                                        .themeData.colorScheme.tertiary)),
                      ],
                    ),
                    Column(
                      children: [
                        Text("Color",
                            style: appController.themeData.textTheme.bodySmall!
                                .copyWith(
                                    color: appController
                                        .themeData.colorScheme.tertiary)),
                        const SizedBox(height: 5),
                        Container(
                          height: 25,
                          width: 25,
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: appController
                                    .themeData.colorScheme.tertiary),
                            color: Color(
                                int.parse(profileModelList[index].color!)),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
