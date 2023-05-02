import 'package:flutter/material.dart';
import 'package:industrialvisit/homescreen.dart';
import 'package:industrialvisit/registration.dart';
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
      home:homescreen(),
    );
  }

}
