import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pawfect/screens/chat.dart';
import 'package:pawfect/utils/constants.dart';
import 'package:get/get.dart';

class communityScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Community',
            style: kText,
          ),
          backgroundColor: Color(0xffffcd00),
        ),
        body: Column(
          children: [
                  SizedBox(height: 30,),
                  GestureDetector(
                    onTap: () {
                      Get.to(()=>ChatScreen(community: "Tippy Toes",));
                      print("hey");
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          height: 60,
                          width: 60,
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(7),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 1,
                            blurRadius: 5,
                            offset: Offset(0, 3),
                          )
                        ],
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Tippy Toes", style: kText,),
                        Text("Food quatity is low refill soon")
                      ],
                    ),
                    Icon(
                      Icons.arrow_circle_right
                    )
                      ],
                    ),
                  ),
                  SizedBox(height: 30,),
                  GestureDetector(
                    onTap: () {
                      Get.to(()=>ChatScreen(community: "Mini Mischief",));
                      print("hey");
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          height: 60,
                          width: 60,
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(7),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 1,
                            blurRadius: 5,
                            offset: Offset(0, 3),
                          )
                        ],
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Mini Mischief", style: kText,),
                        Text("Food quatity is low refill soon")
                      ],
                    ),
                    Icon(
                      Icons.arrow_circle_right
                    )
                      ],
                    ),
                  )
          ],
        ));
  }
}
