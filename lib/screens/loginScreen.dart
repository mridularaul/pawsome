import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../utils/bottomNavBar.dart';
import '../utils/constants.dart';

import 'package:firebase_auth/firebase_auth.dart';
class loginScreen extends StatelessWidget{
  final _auth = FirebaseAuth.instance;
  late String email;
  late String password;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(title:Text(""),backgroundColor: Colors.transparent,),
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              height: double.infinity,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/loginbg.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(),
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: yellow,
                      borderRadius: BorderRadius.circular(7),
                      boxShadow: [
                        BoxShadow(color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 1,
                          blurRadius: 5,
                          offset: Offset(0, 3),)
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(30, 20, 30, 20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text("Log In",style: kHeading.copyWith(color: Colors.white,fontSize: 25),textAlign: TextAlign.start,),
                          SizedBox(height: 10,),
                          TextField(
                            onChanged: (value) {
                              email = value;
                            },
                            decoration: kTextFieldDecoration.copyWith(hintText: 'Email ID'),
                          ),
                          SizedBox(height: 10,),
                          TextField(
                            onChanged: (value) {
                              password = value;
                            },
                            decoration: kTextFieldDecoration.copyWith(hintText: 'Password'),
                          ),
                          SizedBox(height: 10,),
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () async {
                                try {
                                  final checkuser = await _auth.signInWithEmailAndPassword(email: email, password: password);
                                  if(checkuser!=null){
                                    Get.offAll(() => BottomNavBar());
                                  }
                                } catch (e) {
                                  print(e);
                                }

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
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),


          ],
        ),
      ),
    );
  }

}