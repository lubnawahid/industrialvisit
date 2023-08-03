import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:industrialvisit/login.dart';
import 'package:industrialvisit/travelagency/homescreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'homescreen.dart';

class splash extends StatefulWidget {
  const splash({Key? key}) : super(key: key);

  @override
  State<splash> createState() => _splashState();
}

class _splashState extends State<splash> {

  late SharedPreferences localStorage;
  String user="user";
  String ta="travelagency";
  String role="";
  late SharedPreferences prefs;
  Future<void> checkRoleAndNavigate() async {
    prefs = await SharedPreferences.getInstance();
    role = (prefs.getString('role')?? '');
    print(role);
    if (user == role) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => homescreen()));
    }
    else if (ta == role
    ) {
      Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => agencyhomescreen()));
    }
    else{
      Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => login()));
    }
  }



  @override


  void initState() {
    super.initState();
    startTime();
  }

  startTime() async {
    var duration = new Duration(seconds: 4);
    return Timer(duration, checkRoleAndNavigate);
  }
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children:[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal:30.0),
                child: Image.asset("images/tri.jpg",height: 400,),
              ),

            ]
        ),
      ),
    );
  }
}

