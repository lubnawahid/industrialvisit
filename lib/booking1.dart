import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:industrialvisit/payment.dart';
import 'package:industrialvisit/payment1.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'api.dart';
import 'homescreen.dart';

class booking1 extends StatefulWidget {

  const booking1({Key? key}) : super(key: key);

  @override
  State<booking1> createState() => _booking1State();
}

class _booking1State extends State<booking1> {



   bool isLoading = false;
   late SharedPreferences localStorage;
   late int user_id;
   String packagecost='';
  @override

  initState() {
    super.initState();
    _viewPro();
  }
   Future<void> _viewPro() async {
     // int id = widget.id;
      print("price${packagecost}");
     var res = await Api().getData('/api/booking_all_view/');
     var body = json.decode(res.body);
     print(body);
     setState(() {
       packagecost = body['data']['packagecost'];
       // collegename = body['data']['collegename'];
       // bookingdate = body['data']['bookingdate'];
       // // place = body['data']['place'];
       // numberofstudents = body['data']['numberofstudents'];

     });
   }
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
                    MaterialPageRoute(builder: (context) => Payment2(packagecost:packagecost)));
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
