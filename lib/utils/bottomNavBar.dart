import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pawfect/screens/adoptionScreen.dart';
import 'package:pawfect/screens/communityScreen.dart';
import 'package:pawfect/screens/home.dart';
import 'package:pawfect/screens/petcareScreen.dart';
import 'package:pawfect/screens/profileScreen.dart';
import 'appBarController.dart';
import 'constants.dart';

class BottomNavBar extends StatelessWidget{

  AppBarController appBarController = Get.put(AppBarController());

  BottomNavBar({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppBarController>(
        builder: (appBarController){
          return Scaffold(
            body: Stack(
              children: [
                Obx(
                      ()=>IndexedStack(
                    index: appBarController.selectedIndex.value,
                    children: [
                      communityScreen(),
                      petcareScreen(),
                      homeScreen(),
                      adoptionScreen(),
                      profileScreen(),
                    ],
                  ),

                ),
              ],
            ),
            bottomNavigationBar: Obx(
                  ()=>BottomNavigationBar(

                fixedColor: yellow,
                onTap: (index){
                  appBarController.changeIndex(index);
                },
                currentIndex: appBarController.selectedIndex.value,
                items: const [
                  BottomNavigationBarItem(
                    icon: ImageIcon(AssetImage('assets/images/leaderboard.png')),
                    label: 'Community',
                  ),
                  BottomNavigationBarItem(
                    icon: ImageIcon(AssetImage('assets/images/powercard.png')),
                    label: 'Petcare',
                  ),
                  BottomNavigationBarItem(
                    icon: ImageIcon(AssetImage('assets/images/map.png')),
                    label: 'Home',
                  ),
                  BottomNavigationBarItem(
                    icon: ImageIcon(AssetImage('assets/images/info.png')),
                    label: 'Adoption',
                  ),
                  BottomNavigationBarItem(
                    icon: ImageIcon(AssetImage('assets/images/info.png')),
                    label: 'Profile',
                  ),

                ],
              ),
            ),

          );
        }
    );


  }

}