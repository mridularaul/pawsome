import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../database/database.dart';
import '../main.dart';
import '../utils/bottomNavBar.dart';
import '../utils/constants.dart';

class addPet extends StatelessWidget{
  late String age;
  late String weight;
  late String petname;
  late String breed;
  late String gender;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Add Pet",style: kText.copyWith(fontSize: 25),),backgroundColor: yellow,),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(30, 20, 30, 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Pet Name",style: kText,),
                    TextField(
                      onChanged: (value){
                        petname = value;
                      },
                      decoration: kTextFieldDecoration,
                    ),
                    SizedBox(height: 15,),
                    Text("Breed Name",style: kText,),
                    TextField(
                      onChanged: (value){
                        breed = value;
                      },
                      decoration: kTextFieldDecoration,
                    ),
                    SizedBox(height: 15,),
                    Text("Gender",style: kText,),
                    TextField(
                      onChanged: (value){
                        gender = value;
                      },
                      decoration: kTextFieldDecoration,
                    ),
                    SizedBox(height: 15,),
                    Text("Age",style: kText,),
                    TextField(
                      onChanged: (value){
                        age = value;
                      },
                      decoration: kTextFieldDecoration,
                    ),
                    SizedBox(height: 15,),
                    Text("Weight",style: kText,),
                    TextField(
                      onChanged: (value){
                        weight = value;
                      },
                      decoration: kTextFieldDecoration,
                    ),
                    SizedBox(height: 15,),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: (){
                          PetProfileMethods().addPetDetails(
                              {
                                "pet name": petname,
                                "breed": breed,
                                "gender":gender,
                                "age": age,
                                "weight":weight
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
      ),
    );
  }

}