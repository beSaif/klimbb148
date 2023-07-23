import 'package:flutter/material.dart';
import 'package:klimbb148/configs/constants.dart';
import 'package:klimbb148/controllers/app_controller.dart';
import 'package:klimbb148/controllers/profile_controller.dart';
import 'package:klimbb148/screens/create_profile_screen.dart/components/color_picker_widget.dart';
import 'package:provider/provider.dart';

class CreateProfileScreen extends StatelessWidget {
  const CreateProfileScreen({super.key});

  final Color screenPickerColor = Colors.green;

  @override
  Widget build(BuildContext context) {
    return Consumer2<AppController, ProfileController>(
        builder: (context, appController, profileController, child) {
      InputDecoration inputDecoration = InputDecoration(
        labelStyle: appController.themeData.textTheme.bodyMedium,
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white, width: 1.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
              color: appController.themeData.colorScheme.secondary, width: 1.0),
        ),
      );
      return Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Material(
                elevation: 4,
                borderRadius: borderRadius3,
                child: Container(
                  // height: MediaQuery.of(context).size.height * 0.8,
                  decoration: BoxDecoration(
                    borderRadius: borderRadius3,
                    color: appController.themeData.colorScheme.primary,
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        // AppBar
                        Row(
                          children: [
                            IconButton(
                              icon: const Icon(Icons.arrow_back),
                              onPressed: () {
                                Navigator.pop(context);
                                profileController.resetCreateProfile();
                              },
                            ),
                            Center(
                              child: Text(
                                "Create Profile",
                                style: appController
                                    .themeData.textTheme.bodyMedium,
                              ),
                            ),
                          ],
                        ),

                        const Divider(
                          color: Colors.white,
                        ),

                        Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(15),
                              child: Column(
                                children: [
                                  TextField(
                                      controller:
                                          profileController.latController,
                                      style: appController
                                          .themeData.textTheme.bodyMedium,
                                      decoration: inputDecoration.copyWith(
                                        labelText: "Latitude",
                                      )),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  TextField(
                                    controller: profileController.lngController,
                                    style: appController
                                        .themeData.textTheme.bodyMedium,
                                    decoration: inputDecoration.copyWith(
                                        labelText: "Longitude"),
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  TextField(
                                    controller:
                                        profileController.fontSizeController,
                                    style: appController
                                        .themeData.textTheme.bodyMedium,
                                    decoration: inputDecoration.copyWith(
                                        labelText: "Font Size"),
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  ColorPickerWidget(
                                    appController: appController,
                                    profileController: profileController,
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: Colors.white,
                                          ),
                                          onPressed: () {
                                            profileController
                                                .resetCreateProfile();
                                            Navigator.pop(context);
                                          },
                                          child: const Text(
                                            "Cancel",
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 15,
                                      ),
                                      Expanded(
                                        child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: Colors.green,
                                          ),
                                          onPressed: () {
                                            profileController
                                                .createProfile()
                                                .then((value) {
                                              Navigator.pop(context);
                                              profileController
                                                  .resetCreateProfile();
                                            });
                                          },
                                          child: const Text("Save"),
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 2),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
