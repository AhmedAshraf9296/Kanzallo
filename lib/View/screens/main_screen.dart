import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kanzalloshop/View/widgets/theme.dart';
import 'package:kanzalloshop/logic/Controller/main_controller.dart';

class MainScreen extends StatelessWidget {
  MainScreen({Key? key}) : super(key: key);
  final controller = Get.find<MainController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Obx(() {
        return Scaffold(
          backgroundColor: context.theme.backgroundColor,
          appBar: AppBar(
            elevation: 0,
            title: Text(controller.title[controller.currentIndex.value]),
            centerTitle: true,
            leading: Container(),
            actions: [
              IconButton(
                onPressed: () {

                },
                icon: Image.asset("assets/images/shop.png"),
              ),
            ],
            backgroundColor: Get.isDarkMode ? greenColor : mainColor,
          ),
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: Get.isDarkMode ? Colors.white : Colors.black,
            currentIndex: controller.currentIndex.value,
            type: BottomNavigationBarType.fixed,
            items: [
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                  color: Get.isDarkMode ? greenColor : pinkClr,
                ),
                label: "",
                activeIcon: Icon(
                  Icons.home,
                  color: Get.isDarkMode ? mainColor : greenColor,
                ),
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.category,
                  color: Get.isDarkMode ? greenColor : pinkClr,
                ),
                label: "",
                activeIcon: Icon(
                  Icons.category,
                  color: Get.isDarkMode ? mainColor : greenColor,
                ),
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.favorite,
                  color: Get.isDarkMode ? greenColor : pinkClr,
                ),
                label: "",
                activeIcon: Icon(
                  Icons.favorite,
                  color: Get.isDarkMode ? mainColor : greenColor,
                ),
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.settings,
                  color: Get.isDarkMode ? greenColor : pinkClr,
                ),
                label: "",
                activeIcon: Icon(
                  Icons.settings,
                  color: Get.isDarkMode ? mainColor : greenColor,
                ),
              ),
            ],
            onTap: (index) {
              controller.currentIndex.value = index;
            },
          ),
          body: IndexedStack(
            index: controller.currentIndex.value,
            children: controller.tabs.value,
          ),
        );
      }),
    );
  }
}
