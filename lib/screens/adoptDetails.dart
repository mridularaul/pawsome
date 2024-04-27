import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pawfect/utils/constants.dart';

class adoptDetails extends StatefulWidget{
  DocumentSnapshot petData;

  adoptDetails({required this.petData ,super.key});

  @override
  State<adoptDetails> createState() => _adoptDetailsState();
}

class _adoptDetailsState extends State<adoptDetails> {
   String button = "Send Application";
    Color color = Colors.red;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Adoption",style: kText.copyWith(fontSize: 25),),backgroundColor: yellow,),

      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                //height: 250,
                //color: Colors.yellow,
                 //child: Image.asset('assets/images/dog1.png'),
                child: ImageExpanded(image:widget.petData["ImageURL"]),
                //child: Image.network(petData["ImageURL"]),
                // child: Image(
                //   image: NetworkImage(petData["ImageURL"]),
                // ),
              ),

              Container(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Container(
                          width: double.infinity,
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(widget.petData['animalname'],style: kHeading.copyWith(fontSize: 20),),
                                    Text(widget.petData['breedname'],style: kText,),
                                  ],
                                ),
                                Container(
                                  height: 40,
                                  width: 40,
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
                                  child: Icon((widget.petData['sexname']=='Female')?Icons.female:Icons.male),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
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
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Age",style: kText.copyWith(color: Colors.white,fontWeight: FontWeight.bold),),
                                    Text(widget.petData['animalage'],style: kText.copyWith(color: Colors.white),),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(width: 15,),
                            Container(
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
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Species Type",style: kText.copyWith(color: Colors.white,fontWeight: FontWeight.bold),),
                                  Text(widget.petData['speciesname'],style: kText.copyWith(color: Colors.white),),
                                ],
                              ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
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
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Location",style: kText.copyWith(color: Colors.white,fontWeight: FontWeight.bold),),
                                    Text(widget.petData['Location'],style: kText.copyWith(color: Colors.white),),
                                ],
                              ),
                              ),
                            ),
                            SizedBox(width: 15,),
                            Container(
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
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Contact Us",style: kText.copyWith(color: Colors.white,fontWeight: FontWeight.bold),),
                                    Text(widget.petData['Contact'],style: kText.copyWith(color: Colors.white),),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: (){
                              setState(() {
                                button = "Application Sent";
                                color = Colors.green;
                              });
                            },
                            child: Text(button,style: kText.copyWith(color: Colors.white),),
                            style: ElevatedButton.styleFrom(
                                backgroundColor: color,
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
                                elevation: 8,
                                shadowColor: Colors.grey
                            ),
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
      ),
    );
  }
}
class ImageExpanded extends StatelessWidget {
  const ImageExpanded({
    Key? key,
    required this.image,
  }) : super(key: key);

  final String image;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),

          child: FadeInImage(
            placeholderFit: BoxFit.scaleDown,
            // placeholderFilterQuality: FilterQuality.high,
            placeholder:
            Image.asset('assets/images/loading.png').image,

            image: NetworkImage(image),
          ),
        ),
      ),
      onTap: () {
        showGeneralDialog(
            barrierDismissible: true,
            barrierLabel: '',
            context: context,
            pageBuilder: (context, a1, a2) {
              return BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
                child: Material(
                  color: Colors.transparent,
                  child: Stack(
                    children: [
                      Center(
                          child:
                          InteractiveViewer(child: Image.network(image))),
                      Positioned.fill(
                          child: Align(
                            alignment: Alignment.bottomRight,
                            child: IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: const Icon(Icons.close),
                            ),
                          ))
                    ],
                  ),
                ),
              );
            });
      },
    );
  }
}
