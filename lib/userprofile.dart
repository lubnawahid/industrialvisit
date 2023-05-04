import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class userprofile extends StatefulWidget {
  const userprofile({Key? key}) : super(key: key);

  @override
  State<userprofile> createState() => _userprofileState();
}

class _userprofileState extends State<userprofile> {
  @override
  Widget build(BuildContext context) {



return Scaffold(
appBar: AppBar(
title: Text("User Profile"),


),
body: SingleChildScrollView(
child:   Column(

mainAxisAlignment:MainAxisAlignment.center,

children: [

//Text("REGISTER HERE!",style: TextStyle(color: Colors.black),),

SizedBox(height: 20,),

Padding(

padding: const EdgeInsets.all(8),

child: TextField(

decoration: InputDecoration(

labelText: "name",

hintText: "name",

border: OutlineInputBorder(borderRadius:BorderRadius.circular(30)),





),

),

),


Padding(

padding: const EdgeInsets.all(8),

child: TextField(

decoration: InputDecoration(





labelText: "address",

hintText: "address",

border: OutlineInputBorder(borderRadius:BorderRadius.circular(30)),

),

)  ),


Padding(

padding: const EdgeInsets.all(8),

child: TextField(

decoration: InputDecoration(





labelText: "college name",

hintText: "college name",

border: OutlineInputBorder(borderRadius:BorderRadius.circular(30)),

),

)  ),

Padding(

padding: const EdgeInsets.all(8),

child: TextField(

decoration: InputDecoration(





labelText: " email",

hintText: "email",

border: OutlineInputBorder(borderRadius:BorderRadius.circular(30)),

),

)  ),
Padding(

padding: const EdgeInsets.all(8),

child: TextField(

decoration: InputDecoration(





labelText: " phone number",

hintText: "phone number",

border: OutlineInputBorder(borderRadius:BorderRadius.circular(30)),

),

)  ),



SizedBox(height: 20,),

ElevatedButton(onPressed: (){},style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.0)),primary: Colors.blue,fixedSize: Size(300,50)),





child: Text('save',style: TextStyle(color: Colors.white),),

),
    ],
),
),
    );
  }
}
