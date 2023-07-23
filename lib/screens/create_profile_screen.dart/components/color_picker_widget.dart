import 'package:flex_color_picker/flex_color_picker.dart';
import 'package:flutter/material.dart';
import 'package:klimbb148/controllers/app_controller.dart';
import 'package:klimbb148/controllers/profile_controller.dart';

class ColorPickerWidget extends StatelessWidget {
  const ColorPickerWidget({
    super.key,
    required this.appController,
    required this.profileController,
  });

  final AppController appController;
  final ProfileController profileController;

  @override
  Widget build(BuildContext context) {
    Color dialogPickerColor = Color(int.parse(profileController.selectedColor));

    TextStyle bodySmall = appController.themeData.textTheme.bodySmall!
        .copyWith(color: Colors.black);

    Future<bool> colorPickerDialog() async {
      const Color guidePrimary = Color(0xFF6200EE);
      const Color guidePrimaryVariant = Color(0xFF3700B3);
      const Color guideSecondary = Color(0xFF03DAC6);
      const Color guideSecondaryVariant = Color(0xFF018786);
      const Color guideError = Color(0xFFB00020);
      const Color guideErrorDark = Color(0xFFCF6679);
      const Color blueBlues = Color(0xFF174378);

      final Map<ColorSwatch<Object>, String> colorsNameMap =
          <ColorSwatch<Object>, String>{
        ColorTools.createPrimarySwatch(guidePrimary): 'Guide Purple',
        ColorTools.createPrimarySwatch(guidePrimaryVariant):
            'Guide Purple Variant',
        ColorTools.createAccentSwatch(guideSecondary): 'Guide Teal',
        ColorTools.createAccentSwatch(guideSecondaryVariant):
            'Guide Teal Variant',
        ColorTools.createPrimarySwatch(guideError): 'Guide Error',
        ColorTools.createPrimarySwatch(guideErrorDark): 'Guide Error Dark',
        ColorTools.createPrimarySwatch(blueBlues): 'Blue blues',
      };
      return ColorPicker(
        color: dialogPickerColor,
        onColorChanged: (Color color) {
          profileController.setSelectedColor(color.value.toString());
        },
        width: 40,
        height: 40,
        borderRadius: 4,
        spacing: 5,
        runSpacing: 5,
        wheelDiameter: 155,
        heading: Text(
          'Select color',
          style: Theme.of(context).textTheme.titleSmall,
        ),
        subheading: Text(
          'Select color shade',
          style: Theme.of(context).textTheme.titleSmall,
        ),
        wheelSubheading: Text(
          'Selected color and its shades',
          style: Theme.of(context).textTheme.titleSmall,
        ),
        showMaterialName: true,
        showColorName: true,
        showColorCode: true,
        copyPasteBehavior: const ColorPickerCopyPasteBehavior(
          longPressMenu: true,
        ),
        materialNameTextStyle: bodySmall,
        colorNameTextStyle: bodySmall,
        colorCodeTextStyle: bodySmall,
        pickerTypeTextStyle: bodySmall,
        pickersEnabled: const <ColorPickerType, bool>{
          ColorPickerType.both: false,
          ColorPickerType.primary: true,
          ColorPickerType.accent: true,
          ColorPickerType.bw: false,
          ColorPickerType.custom: true,
          ColorPickerType.wheel: true,
        },
        customColorSwatchesAndNames: colorsNameMap,
      ).showPickerDialog(
        context,
        transitionBuilder: (BuildContext context, Animation<double> a1,
            Animation<double> a2, Widget widget) {
          final double curvedValue =
              Curves.easeInOutBack.transform(a1.value) - 1.0;
          return Transform(
            transform: Matrix4.translationValues(0.0, curvedValue * 200, 0.0),
            child: Opacity(
              opacity: a1.value,
              child: widget,
            ),
          );
        },
        transitionDuration: const Duration(milliseconds: 400),
        constraints:
            const BoxConstraints(minHeight: 460, minWidth: 300, maxWidth: 320),
      );
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: [
          Expanded(
            child: ListTile(
              title: Text(
                'Pick a color of your choice',
                style: appController.themeData.textTheme.bodyMedium,
              ),
              subtitle: Text(
                "Tap the color to change",
                style: appController.themeData.textTheme.bodySmall,
              ),
              trailing: Material(
                elevation: 4,
                child: Container(
                  color: Colors.white,
                  padding: const EdgeInsets.all(4),
                  child: ColorIndicator(
                    width: 44,
                    height: 44,
                    borderRadius: 4,
                    color: dialogPickerColor,
                    onSelectFocus: false,
                    onSelect: () async {
                      final Color colorBeforeDialog = dialogPickerColor;

                      if (!(await colorPickerDialog())) {
                        profileController.setSelectedColor(
                            colorBeforeDialog.value.toString());
                      }
                    },
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
