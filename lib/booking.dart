import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'api.dart';
import 'booking1.dart';

class booking extends StatefulWidget {
  final int id;
  const booking({required this.id});


  @override
  State<booking> createState() => _bookingState();
}

class _bookingState extends State<booking> {
  String name = "";
  String collegename = "";
  String date = "";
  String place = "";
  String numberofstudents = "";
  late int user_id;
  late SharedPreferences localStorage;
  bool  _isLoading = false;



  DateTime selectedDate = DateTime.now();
  late SharedPreferences prefs;
  late String startDate;
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime.now(),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        startDate =
        '${selectedDate.year}-${selectedDate.month}-${selectedDate.day}';
      });
    }
  }
  @override
  initState() {
    super.initState();
    _viewPro();
  }
  Future<void> _viewPro() async {
    int id = widget.id;
    print("id${id}");
    var res = await Api().getData('/api/packages_single_view/' + id.toString());
    var body = json.decode(res.body);
    print(body);
    setState(() {
      name = body['data']['name'];
      collegename = body['data']['collegename'];
      date = body['data']['date'];
      place = body['data']['place'];
      numberofstudents = body['data']['numberofstudents'];

    });
  }
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

    labelText: "Full Name",

    hintText: "Full Name",
    prefixIcon: Icon(Icons.person),

    border: OutlineInputBorder(borderRadius:BorderRadius.circular(30)),





    ),

    ),

    ),


    SizedBox(height: 20,),

    Padding(

    padding: const EdgeInsets.all(8),

    child: TextField(

    decoration: InputDecoration(

    labelText: "College Name",

    hintText: "College Name",
    prefixIcon: Icon(Icons.school),

    border: OutlineInputBorder(borderRadius:BorderRadius.circular(30)),





    ),

    ),

    ),


    SizedBox(height: 20,),

         Container(
           padding:  const EdgeInsets.all(20.0),

           child: Row(
             children: [
               ElevatedButton(
                 onPressed: () => _selectDate(context),
                 child: const Text('Select date'),

               ),SizedBox(width: 20,),
               Container(
                 height: 45,
                 width: 150,
                 margin: const EdgeInsets.all(15.0),
                 padding: const EdgeInsets.all(3.0),
                 decoration: BoxDecoration(
                     border: Border.all(color: Colors.black26)),
                 child: Padding(
                   padding: const EdgeInsets.only(top: 8.0),
                   child: Text(
                     '${selectedDate.year}-${selectedDate.month}-${selectedDate.day}',
                     style: TextStyle(fontSize: 16, color: Colors.black38),
                   ),
                 ),
               ),

             ],
           ),
         ),

    SizedBox(height: 20,),

    Padding(

    padding: const EdgeInsets.all(8),

    child: TextField(

    decoration: InputDecoration(

    labelText: "Place",

    hintText: "Place",
    prefixIcon: Icon(Icons.location_on),

    border: OutlineInputBorder(borderRadius:BorderRadius.circular(30)),





    ),

    ),

    ),



    SizedBox(height: 20,),

    Padding(

    padding: const EdgeInsets.all(8),

    child: TextField(

    decoration: InputDecoration(

    labelText: "Number of Students",

    hintText: "Number of Students",
    prefixIcon: Icon(Icons.person),

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
