import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'booking1.dart';

class booking extends StatefulWidget {
  const booking({Key? key}) : super(key: key);

  @override
  State<booking> createState() => _bookingState();
}

class _bookingState extends State<booking> {
  @override
  Widget build(BuildContext context) {
     return Scaffold(
        appBar: AppBar(
        title: Text("Booking"),


    ),
       body: SingleChildScrollView(
       child:   Column(

       mainAxisAlignment:MainAxisAlignment.center,

       children: [

       Text("BOOK HERE!",style: TextStyle(color: Colors.black),),

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


    SizedBox(height: 20,),

    Padding(

    padding: const EdgeInsets.all(8),

    child: TextField(

    decoration: InputDecoration(

    labelText: "college name",

    hintText: "college name",

    border: OutlineInputBorder(borderRadius:BorderRadius.circular(30)),





    ),

    ),

    ),


    SizedBox(height: 20,),

    Padding(

    padding: const EdgeInsets.all(8),

    child: TextField(

    decoration: InputDecoration(

    labelText: "date",

    hintText: "datee",

    border: OutlineInputBorder(borderRadius:BorderRadius.circular(30)),





    ),

    ),

    ),


    SizedBox(height: 20,),

    Padding(

    padding: const EdgeInsets.all(8),

    child: TextField(

    decoration: InputDecoration(

    labelText: "place",

    hintText: "place",

    border: OutlineInputBorder(borderRadius:BorderRadius.circular(30)),





    ),

    ),

    ),



    SizedBox(height: 20,),

    Padding(

    padding: const EdgeInsets.all(8),

    child: TextField(

    decoration: InputDecoration(

    labelText: "number of students",

    hintText: "number of students",

    border: OutlineInputBorder(borderRadius:BorderRadius.circular(30)),





    ),

    ),

    ),


    SizedBox(height: 20,),

    Padding(

    padding: const EdgeInsets.all(8),

    child: TextField(

    decoration: InputDecoration(

    labelText: "days",

    hintText: "days",

    border: OutlineInputBorder(borderRadius:BorderRadius.circular(30)),





    ),

    ),

    ),
    SizedBox(height: 20,),

    ElevatedButton(onPressed: (){

      Navigator.push(context, MaterialPageRoute(builder: (context)=>const booking1()));
    },style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.0)),primary: Colors.blue,fixedSize: Size(300,50)),





    child: Text('Book Now!',style: TextStyle(color: Colors.white),),

    ),

],
       ),
       ),
    );
  }
}
