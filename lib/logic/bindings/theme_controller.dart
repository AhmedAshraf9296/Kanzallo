import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ThemeController {
  final GetStorage boxStorage = GetStorage();
  final key = 'isDarkMode';

  saveThemDataInBox(bool isDark) {
    boxStorage.write(key, isDark);
  }

  bool getThemDataFromBox() {
    return boxStorage.read<bool>(key) ?? false;
  }

  ThemeMode get themeDataGet => getThemDataFromBox()? ThemeMode.dark:ThemeMode.light;

  void changeThem() {
    Get.changeThemeMode(getThemDataFromBox()?ThemeMode.light:ThemeMode.dark);

    saveThemDataInBox(!getThemDataFromBox());
  }
}
