import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../agencyprofile.dart';
import '../agencyprofile.dart';
import '../agencyprofile.dart';
import 'homescreen.dart';

class agencyprofile1 extends StatefulWidget {
  const agencyprofile1({Key? key}) : super(key: key);

  @override
  State<agencyprofile1> createState() => _agencyprofile1State();
}

class _agencyprofile1State extends State<agencyprofile1> {
  @override
  Widget build(BuildContext context) {



return Scaffold(
appBar: AppBar(
title: Text("Agency Profile"),


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





labelText: " agency name",

hintText: "agency name",

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

ElevatedButton(onPressed: (){
Navigator.push(context, MaterialPageRoute(builder: (context)=>agencyhomescreen()));

},
style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.0)),primary: Colors.blue,fixedSize: Size(300,50)),





child: Text('Save',style: TextStyle(color: Colors.white),),

),
],
),
),
);
}
}




