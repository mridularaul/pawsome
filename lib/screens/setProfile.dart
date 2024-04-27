import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../database/database.dart';
import '../main.dart';
import '../utils/bottomNavBar.dart';
import '../utils/constants.dart';

class setProfile extends StatelessWidget{
  late String name;
  late String city;
  late String phone;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Set Profile",style: kText.copyWith(fontSize: 25),),),
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/signin.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),          SafeArea(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(30, 20, 30, 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Name",style: kText,),
                      TextField(
                        onChanged: (value){
                          name = value;
                        },
                        decoration: kTextFieldDecoration,
                      ),
                      SizedBox(height: 15,),
                      Text("City",style: kText,),
                      TextField(
                        onChanged: (value){
                          city = value;
                        },
                        decoration: kTextFieldDecoration,
                      ),
                      SizedBox(height: 15,),
                      Text("Phone Number",style: kText,),
                      TextField(
                        onChanged: (value){
                          phone = value;
                        },
                        decoration: kTextFieldDecoration,
                      ),
                      SizedBox(height: 15,),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: (){
                            UserProfileMethods().addUserDetails(
                                {
                                  "username" : name,
                                  "email" : email,
                                  "phone" : phone,
                                  "city" : city,
                                }
                            );

                            Get.off(() => BottomNavBar());
                          },
                          child: Text("Continue",style: kText.copyWith(color: Colors.white),),
                          style: ElevatedButton.styleFrom(
                              backgroundColor: yellow,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),

                              elevation: 8,
                              shadowColor: Colors.grey
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

}