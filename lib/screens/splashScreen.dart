import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pawfect/screens/loginScreen.dart';
import 'package:pawfect/screens/signinScreen.dart';
import 'package:pawfect/utils/constants.dart';
import 'package:get/get.dart';

class splashScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            //crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Welcome to",style: kHeading.copyWith(color: yellow),),
              Text("Pawsome",style: kHeading.copyWith(fontSize: 55,color: yellow),),
              SizedBox(
                child: Image.asset('assets/images/splashimg.png'),
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: (){
                      Get.to(() => loginScreen());
                    },
                    child: Text("Log in",style: kText.copyWith(color: yellow),),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(side: BorderSide(strokeAlign: BorderSide.strokeAlignInside, color: yellow,),borderRadius: BorderRadius.circular(7)),

                      elevation: 8,
                      shadowColor: Colors.grey
                  ),
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: (){
                    Get.to(() => signinScreen());
                  },
                  child: Text("Sign up",style: kText.copyWith(color: Colors.white),),
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
        ),
      ),
    );
  }

}