import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../utils/constants.dart';

class blogPage extends StatelessWidget{
  blogPage({required this.blogData ,super.key});
  DocumentSnapshot blogData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Blog",style: kText.copyWith(fontSize: 25),),backgroundColor: yellow,),

      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(blogData['BlogName'],style: kHeading,),
                SizedBox(height: 10,),
                Text("By ${blogData['Author']}",style: kText.copyWith(fontWeight: FontWeight.bold,fontSize: 17),),
                SizedBox(height: 20,),
                Text(blogData['Content']),
              ],
            ),
          ),
        ),
      ),
    );
  }

}