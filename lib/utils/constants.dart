import 'package:flutter/material.dart';

const Color yellow = Color(0xffFFCD00);

const kHeading = TextStyle(color: Colors.black, fontSize: 35, fontFamily: 'Fredoka',fontWeight: FontWeight.bold);
const kText = TextStyle(color: Colors.black, fontSize: 15, fontFamily: 'Fredoka');

const kTextFieldDecoration = InputDecoration(

  hintText: 'Enter',
  hintStyle:
  TextStyle(color: Colors.grey, fontSize: 12, fontFamily: 'Fredoka'),
  filled: true,
  fillColor:Colors.white,
  contentPadding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 5.0),
  border: OutlineInputBorder(
    borderSide: BorderSide(color: yellow, width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(2.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: yellow, width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(2.0)),
  ),
);
//For community chat
const kSendButtonTextStyle = TextStyle(
  color: Color(0xffFFCD00),
  fontWeight: FontWeight.bold,
  fontSize: 18.0,
);

const kMessageTextFieldDecoration = InputDecoration(
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  hintText: 'Type your message here...',
  border: InputBorder.none,
);

const kMessageContainerDecoration = BoxDecoration(
  border: Border(
    top: BorderSide(color: Color(0xffFFCD00), width: 2.0),
  ),
);