import 'package:get/get.dart';
import 'package:kanzalloshop/View/screens/category_screen.dart';
import 'package:kanzalloshop/View/screens/favorites_screen.dart';
import 'package:kanzalloshop/View/screens/home_screen.dart';

import '../../View/screens/settings_screen.dart';

class MainController extends GetxController {
  RxInt currentIndex = 0.obs;

  final tabs = [
    const HomeScreen(),
    const CategoryScreen(),
     FavoriteScreen(),
    SettingsScreen(),
  ].obs;

  final title = [
    "KanzalloShop",
    "Categories",
    "Favorites",
    "Settings"
  ].obs;
}
