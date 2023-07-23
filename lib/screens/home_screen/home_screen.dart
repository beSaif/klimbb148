import 'package:flutter/material.dart';
import 'package:klimbb148/controllers/app_controller.dart';
import 'package:klimbb148/controllers/profile_controller.dart';
import 'package:klimbb148/models/profile_model.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    BorderRadiusGeometry borderRadius = const BorderRadius.only(
      topLeft: Radius.circular(10),
      topRight: Radius.circular(10),
      bottomLeft: Radius.circular(10),
    );
    return Consumer2<ProfileController, AppController>(
        builder: (context, profileController, appController, child) {
      return Scaffold(
          appBar: AppBar(
            title: const Text("Profile List"),
          ),
          body: profileController.isLoading
              ? const Center(child: CircularProgressIndicator())
              : Padding(
                  padding: const EdgeInsets.all(15),
                  child: ListView.builder(
                      itemCount: profileController.profileModelList.length,
                      itemBuilder: (context, index) {
                        List<ProfileModel> profileModelList =
                            profileController.profileModelList;

                        if (profileModelList.isEmpty) {
                          return const Center(child: Text("No data found!"));
                        }
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Material(
                            elevation: 4,
                            borderRadius: borderRadius,
                            child: Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                borderRadius: borderRadius,
                                color: appController
                                    .themeData.colorScheme.secondary,
                              ),
                              height: 120,
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Text("#${index + 1}",
                                          style: appController
                                              .themeData.textTheme.displayLarge!
                                              .copyWith(
                                                  color: appController.themeData
                                                      .colorScheme.tertiary)),
                                      const Spacer(),
                                      Text("Profile Details",
                                          style: appController
                                              .themeData.textTheme.bodyMedium!
                                              .copyWith(
                                                  color: appController.themeData
                                                      .colorScheme.tertiary)),
                                    ],
                                  ),
                                  Divider(
                                    color: appController
                                        .themeData.colorScheme.tertiary,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          children: [
                                            Text("Coordinates",
                                                style: appController.themeData
                                                    .textTheme.bodySmall!
                                                    .copyWith(
                                                        color: appController
                                                            .themeData
                                                            .colorScheme
                                                            .tertiary)),
                                            const SizedBox(height: 5),
                                            Text(
                                                "( ${profileModelList[index].lat}, ${profileModelList[index].lng} )",
                                                style: appController.themeData
                                                    .textTheme.bodyMedium!
                                                    .copyWith(
                                                        color: appController
                                                            .themeData
                                                            .colorScheme
                                                            .tertiary)),
                                          ],
                                        ),
                                        Column(
                                          children: [
                                            Text("Font Size",
                                                style: appController.themeData
                                                    .textTheme.bodySmall!
                                                    .copyWith(
                                                        color: appController
                                                            .themeData
                                                            .colorScheme
                                                            .tertiary)),
                                            const SizedBox(height: 5),
                                            Text(
                                                "${profileModelList[index].fontSize}",
                                                style: appController.themeData
                                                    .textTheme.bodyMedium!
                                                    .copyWith(
                                                        color: appController
                                                            .themeData
                                                            .colorScheme
                                                            .tertiary)),
                                          ],
                                        ),
                                        Column(
                                          children: [
                                            Text("Color",
                                                style: appController.themeData
                                                    .textTheme.bodySmall!
                                                    .copyWith(
                                                        color: appController
                                                            .themeData
                                                            .colorScheme
                                                            .tertiary)),
                                            const SizedBox(height: 5),
                                            Container(
                                              height: 25,
                                              width: 25,
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: appController
                                                        .themeData
                                                        .colorScheme
                                                        .tertiary),
                                                color: Color(int.parse(
                                                    profileModelList[index]
                                                        .color!)),
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
                      }),
                ));
    });
  }
}
