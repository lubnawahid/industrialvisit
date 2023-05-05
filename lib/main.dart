import 'package:flutter/material.dart';
import 'package:industrialvisit/homescreen.dart';

import 'package:industrialvisit/packagecreation.dart';
import 'package:industrialvisit/packages.dart';
import 'package:industrialvisit/registration.dart';
import 'package:industrialvisit/travelagency/login.dart';
import 'package:industrialvisit/travelagency/registration.dart';
import 'package:industrialvisit/welcome.dart';

import 'login.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:welcome(),

    );
  }

}
