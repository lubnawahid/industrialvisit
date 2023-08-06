import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:industrialvisit/payment.dart';
import 'package:industrialvisit/payment1.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'api.dart';
import 'homescreen.dart';

class booking1 extends StatefulWidget {
  final int id;
  final int agency;


  booking1({required this.id,required this.agency});

  @override
  State<booking1> createState() => _booking1State();
}

class _booking1State extends State<booking1> {



   bool isLoading = false;
   late SharedPreferences localStorage;
   late int user_id,travelagency_id;

   late int id;
   String price='';
  @override

  initState() {
    super.initState();
    _viewPro();
    int id = widget.id;
    print("widgwetid${id}");
    int aid = widget.agency;
    print("agenttid${aid}");
  }
   Future<void> _viewPro() async {
     int id = widget.id;
     // print("widgwetid${id}");
     //
     // localStorage = await SharedPreferences.getInstance();
     // user_id = (localStorage.getInt('user_id') ?? 0);
     // print('login_id ${user_id}');
     var res = await Api().getData('/api/booking_single_view/' +id.toString());
     var body = json.decode(res.body);
     print("items book${body}");
     setState(() {
       price = body['data']['packagecost'];
       print("price${price}");

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
                    MaterialPageRoute(builder: (context) => Payment2(price:price,travelagency_id:widget.agency)));
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
