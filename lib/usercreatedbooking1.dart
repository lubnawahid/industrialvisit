import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:industrialvisit/payment.dart';
import 'package:industrialvisit/payment1.dart';
import 'package:industrialvisit/payment3.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'api.dart';
import 'homescreen.dart';

class userbooking1 extends StatefulWidget {
  final int id;


  userbooking1({required this.id});

  @override
  State<userbooking1> createState() => _userbooking1State();
}

class _userbooking1State extends State<userbooking1> {



  bool isLoading = false;
  late SharedPreferences localStorage;
  late int user_id;
  late int id;
  String price='';
  @override

  initState() {
    super.initState();
    _viewPro();
  }
  Future<void> _viewPro() async {
    int id = widget.id;
    // print("price${price}");
    var res = await Api().getData('/api/userbooking_single_view/' +id.toString());
    var body = json.decode(res.body);
    print("items book${body}");
    setState(() {
      price = body['data']['price'];
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
                    MaterialPageRoute(builder: (context) => UserPayment(price:price)));
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
