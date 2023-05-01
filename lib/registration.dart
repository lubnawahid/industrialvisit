import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:industrialvisit/userregister.dart';

import 'agencyregister.dart';

class registration extends StatefulWidget {
  const registration({Key? key}) : super(key: key);

  @override
  State<registration> createState() => _registrationState();
}

class _registrationState extends State<registration> {
  @override
  Widget build(BuildContext context) {


    return Scaffold(


        body:  Container(
          height: 400,

          child:Padding(
              padding:const EdgeInsets.all(20),
              child: GridView(

          children: [

          GestureDetector(
          onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context)=>agencyregister()));
        },

          child:  Container(decoration:BoxDecoration(borderRadius: BorderRadius.circular(40),color: Colors.pink,),

            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("images/travel-agency.png",height: 80,),
                Text("Travelagency",style: TextStyle(color: Colors.white,fontSize: 30),)
              ],
            ),
          ),
        ),


        GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context)=>userregister()));
          },
          child: Container(decoration:BoxDecoration(borderRadius: BorderRadius.circular(40),color: Colors.blueAccent,),

            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("images/user.png",height: 80,),
                Text("User",style: TextStyle(color: Colors.white,fontSize: 30),)
              ],
            ),
          ),
        ),


        ],
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,mainAxisSpacing: 10,crossAxisSpacing: 10),
    )
    )
    )
    );

  }
}
