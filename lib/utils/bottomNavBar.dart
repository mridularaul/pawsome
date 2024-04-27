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
                fixedColor: Colors.white,
                onTap: (index){
                  appBarController.changeIndex(index);
                },
                currentIndex: appBarController.selectedIndex.value,
                items: const [
                  BottomNavigationBarItem(
                    icon: ImageIcon(AssetImage('assets/images/community.png')),
                    label: 'Community',
                    backgroundColor: yellow,
                  ),
                  BottomNavigationBarItem(
                    icon: ImageIcon(AssetImage('assets/images/home.png')),
                    label: 'Petcare',
                    backgroundColor: yellow,
                  ),
                  BottomNavigationBarItem(
                    icon: ImageIcon(AssetImage('assets/images/home.png')),
                    label: 'Home',
                    backgroundColor: yellow,
                  ),
                  BottomNavigationBarItem(
                    icon: ImageIcon(AssetImage('assets/images/home.png')),
                    label: 'Adoption',
                    backgroundColor: yellow,
                  ),
                  BottomNavigationBarItem(
                    icon: ImageIcon(AssetImage('assets/images/home.png')),
                    label: 'Profile',
                    backgroundColor: yellow,
                  ),

                ],
              ),
            ),

          );
        }
    );


  }

}