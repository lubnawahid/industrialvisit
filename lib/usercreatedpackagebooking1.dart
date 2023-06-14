import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'homescreen.dart';

class usercreatedpackagebooking1 extends StatefulWidget {
  const usercreatedpackagebooking1({Key? key}) : super(key: key);

  @override
  State<usercreatedpackagebooking1> createState() => _usercreatedpackagebooking1State();
}

class _usercreatedpackagebooking1State extends State<usercreatedpackagebooking1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("images/pay.png",
                height: 600,
                width: 300,
                alignment: Alignment.center,),
              Padding(
                padding: EdgeInsets.all(10),
                child: Text("Your Booking was done successfully",
                  textAlign: TextAlign.center, selectionColor: Colors.blue,),
              ),


              ElevatedButton(onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => homescreen()));
              },
                style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50.0)),
                    primary: Colors.blue,
                    fixedSize: Size(200, 50)),
                child: Text("OK", style: TextStyle(color: Colors.white),),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

