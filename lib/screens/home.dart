import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pawfect/main.dart';
import 'package:pawfect/screens/addPet.dart';
import 'package:pawfect/utils/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../database/database.dart';
import 'appointmentScreen.dart';

late User loggedInUser;
class homeScreen extends StatefulWidget {
  @override
  State<homeScreen> createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {
  final _auth = FirebaseAuth.instance;
  void getCurrentUser() async {
    try {
      final user = await _auth.currentUser;
      if (user != null) {
        loggedInUser = user;
      }
    } catch (e) {
      print(e);
    }
  }
  Stream? petdetailsstream;
  Stream? userdetailstream;
  Stream? appointmentstream;

  getonload() async {
    petdetailsstream = await PetProfileMethods().getPetDetails();
    userdetailstream = await UserProfileMethods().getUserDetails();
    appointmentstream = await AppointmentMethods().getappointmentDetails();
    setState(() {
      print("getonload");
    });
  }
  @override
  void initState() {
    getonload();
    getCurrentUser();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home",style: kText.copyWith(fontSize: 25),),backgroundColor: yellow,),
      floatingActionButton: FloatingActionButton(
          onPressed: (){
        Get.to(Appointment());
      },
      child: Icon(Icons.add,),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Hello\n${loggedInUser.email} ",style: kHeading,),
                    SizedBox(height: 15,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('My Pets', style: kText.copyWith(fontSize: 18)),
                        ElevatedButton(
                          onPressed: () {
                            Get.to(()=>addPet());
                            // Add pet button action
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: yellow,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
                              elevation: 8,
                              shadowColor: Colors.grey
                          ),
                          child: Text('Add a Pet', style: kText),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
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
                      height: 150,
                      width: double.infinity,
                      child: StreamBuilder(
                        stream: petdetailsstream,
                        builder: (context,AsyncSnapshot snapshot) {
                          return snapshot.hasData
                              ? ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: snapshot.data.docs.length,
                            itemBuilder: (context, index) {
          
                              DocumentSnapshot dbpet = snapshot.data.docs[index];
                              return dbpet["email"] == loggedInUser.email? Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          children: [
                                            Container(
                                              height: 95,
                                              width: 95,
                                              child: Image.asset('assets/images/dog1.png'),
                                            ),
                                            Text(
                                              dbpet['pet name'],
                                              style: kText,
                                            )
                                          ],
                                        ),
                                      ):Container();
                            },
                          ):Center(child: Text("Oops! Looks like you did not add any pet"),);
                        },),
                      // child: ListView.builder(
                      //   scrollDirection: Axis.horizontal,
                      //   itemCount: 4,
                      //
                      //   itemBuilder: (context, index) {
                      //     return Padding(
                      //       padding: const EdgeInsets.all(8.0),
                      //       child: Column(
                      //         children: [
                      //           Container(
                      //             height: 95,
                      //             width: 95,
                      //             child: Image.asset('assets/images/dog1.png'),
                      //           ),
                      //           Text(
                      //             'Pet ${index + 1}',
                      //             style: kText,
                      //           )
                      //         ],
                      //       ),
                      //     );
                      //   },
                      // ),
                    ),
                    //from here
                    SizedBox(height: 30,),
                    Text('My Appointments', style: kText.copyWith(fontSize: 18)),
                    SizedBox(height: 10,),

                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
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
                      height: 250,
                      width: double.infinity,
                      child: StreamBuilder(
                        stream: appointmentstream,
                        builder: (context, AsyncSnapshot snapshot){
                          return snapshot.hasData
                              ? ListView.builder(
                            itemCount: snapshot.data.docs.length,
                            itemBuilder: (context, index){
                              DocumentSnapshot dbappoint = snapshot.data.docs[index];
                              return dbappoint['email']==loggedInUser.email? AppointmentTile(petName: dbappoint['pet name'], title: dbappoint['title'], date: dbappoint['appointment date'], time: dbappoint['appointment time']):Container();
                              // return Column(
                              //   children: [
                              //     Text('Title:' + dbappoint['title']),
                              //     Text("Name: "+dbappoint['pet name']),
                              //     Text('Appointment Date' + dbappoint['appointment date']),
                              //     Text('Appointment Time' + dbappoint['appointment time'])
                              //   ],
                              // );
                            },
                          ):Container(child: Text("No Appointments"),);
                        },
                      ),
                    )
                  ],
                ),
              ),
          
            ],
          ),
        ),
      ),
    );
  }
}
class AppointmentTile extends StatelessWidget {
  final String petName;
  final String title;
  final String date;
  final String time;

  const AppointmentTile({
    required this.petName,
    required this.title,
    required this.date,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
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
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.only(bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Pet Name: $petName', style: kText),
          Text('Title: $title', style: kText),
          Text('Date: $date', style: kText),
          Text('Time: $time', style: kText),
        ],
      ),
    );
  }
}
