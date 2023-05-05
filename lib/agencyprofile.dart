import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'homescreen.dart';

class agencyprofile extends StatefulWidget {
  const agencyprofile({Key? key}) : super(key: key);

  @override
  State<agencyprofile> createState() => _agencyprofileState();
}

class _agencyprofileState extends State<agencyprofile> {
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
    Navigator.push(context, MaterialPageRoute(builder: (context)=>homescreen()));

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




