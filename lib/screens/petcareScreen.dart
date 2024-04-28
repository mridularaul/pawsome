import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pawfect/database/database.dart';
import 'package:pawfect/screens/blogPage.dart';

import '../utils/constants.dart';

class petcareScreen extends StatefulWidget{
  @override
  State<petcareScreen> createState() => _petcareScreenState();
}

class _petcareScreenState extends State<petcareScreen> {
  Stream? blogstream;

  getonload() async {
    blogstream = await BlogsMethods().getblogDetails();
    setState(() {
      print("getonload");
    });
  }
  @override
  void initState() {
    getonload();
    super.initState();
  }

  Widget data(){
    return StreamBuilder(
        stream: blogstream,
        builder: (context, AsyncSnapshot snapshot) {
          print(snapshot.hasData);
          return snapshot.hasData
              ? ListView.builder(
              itemCount: snapshot.data.docs.length,
              //itemCount: 1,
              itemBuilder: (context, index) {
                DocumentSnapshot dbblog = snapshot.data.docs[index];
                return GestureDetector(
                  onTap: () {
                    Get.to(()=>blogPage(blogData: dbblog,));

                    print("hey");
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(7),
                        boxShadow: [
                          BoxShadow(color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 1,
                            blurRadius: 5,
                            offset: Offset(0, 3),)
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [

                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(dbblog["BlogName"], style: kText.copyWith(fontWeight: FontWeight.bold),),
                                    Text(dbblog["Author"],style: kText,)
                                  ],
                                ),
                              ),
                            ),
                            Icon(
                                Icons.arrow_circle_right
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              })
              : Container(
            height: 20,
            width: 20,
            color: Colors.green,
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: yellow,
        title: Text('Pet Care', style: kText.copyWith(fontSize: 25),),
      ),
      body: Column(
        children: [
          SizedBox(height: 30,),
          Expanded(child: data()),

        ],
      ),
    );
  }
}