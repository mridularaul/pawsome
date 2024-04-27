import 'package:flutter/material.dart';

import '../utils/constants.dart';

class setProfile extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(

        children: [
          Text("Name",style: kText,),
          TextField(
            decoration: kTextFieldDecoration,
          ),
          SizedBox(height: 10,),
          Text("Address",style: kText,),
          TextField(
            decoration: kTextFieldDecoration,
          ),
          SizedBox(height: 10,),
          Text("Phone Number",style: kText,),
          TextField(
            decoration: kTextFieldDecoration,
          ),
          SizedBox(height: 10,),
        ],
      ),
    );
  }

}