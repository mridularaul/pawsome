import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:pawfect/screens/adoptDetails.dart';
import 'package:pawfect/utils/constants.dart';

import '../database/database.dart';


class adoptionScreen extends StatefulWidget{
  @override
  State<adoptionScreen> createState() => _adoptionScreenState();
}

class _adoptionScreenState extends State<adoptionScreen> {
  late String petname;
  late String breed;
  late String gender;
  late String owner_email;
  late String weight;
  Stream? adoptionstream;
  Stream? petdetailsstream;
  Stream? userdetailstream;
  getonload() async {
    adoptionstream = await AdoptionMethods().getAdoptiondetails();
    setState(() {
      print("getonload");
    });
  }
  @override
  void initState() {
    getonload();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Adoption",style: kText.copyWith(fontSize: 25),),backgroundColor: yellow,),
      body:  StreamBuilder(
        stream: adoptionstream,
        builder: (context, AsyncSnapshot snapshot) {
          return snapshot.hasData
              ? GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount( childAspectRatio:4/5,crossAxisCount: 2),
              itemCount: snapshot.data.docs.length,
              //itemCount: 1,
              itemBuilder: (context, index) {
                DocumentSnapshot dbadoption = snapshot.data.docs[index];
                return adoptCard(dbadoption);
              })
              : Container(
            height: 20,
            width: 20,
            color: Colors.green,
          );
        }),

    );
  }
}
Widget adoptCard(DocumentSnapshot petData){
  return InkWell(
    onTap: (){
      Get.to(()=>adoptDetails(petData: petData,));
    },
    child: Padding(
      padding: const EdgeInsets.all(10),
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
          padding: const EdgeInsets.fromLTRB(8, 13, 8, 13),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 100,
                width: 100,
                //color: Colors.yellow,
                //child: Image.asset('assets/images/dog1.png'),
                child: Image.network(petData["ImageURL"]),
              ),
              SizedBox(height: 10,),

              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(petData['animalname'],style: kText.copyWith(fontSize: 17,fontWeight: FontWeight.bold),),
                    Text(petData['sexname'],style: kText.copyWith(fontSize: 12),),
                  ],
                ),
              ),
              SizedBox(height: 3,),
              Expanded(child: Text(petData['breedname'],style: kText.copyWith(fontSize: 13),textAlign: TextAlign.center,)),
            ],
          ),
        ),
      ),
    ),
  );
}