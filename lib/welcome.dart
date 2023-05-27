import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:industrialvisit/login.dart';
import 'package:industrialvisit/registration.dart';
import 'package:industrialvisit/welcome.dart';

class welcome extends StatelessWidget {
  const welcome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        const Text("Welcome!",style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold),),
    const SizedBox(height: 4,),
    const Align(
    alignment: Alignment.center,
    child: Text("This application will Helps you to an memorable industrial visit ",style: TextStyle(fontSize: 20),textAlign: TextAlign.center,),
    ),
    const SizedBox(height: 35,),

        Image.asset(
          "images/welcome.jpg",
          width: 520.0,
          height: 395.0,
          fit: BoxFit.cover,
        ),
        const SizedBox(height: 35,),

        ElevatedButton(onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>const LoginPage()));
        },
          style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(29.0)),backgroundColor: Colors.pinkAccent,fixedSize: Size(350, 57)),
          child: const Text("Login",style: TextStyle(
              fontSize: 18,color: Colors.white
          ),),),
        const SizedBox(height: 35,),

        ElevatedButton(onPressed: (){
      Navigator.push(context, MaterialPageRoute(builder: (context)=>const registration()));
        },
          style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(29.0)),backgroundColor: Colors.pinkAccent,fixedSize: Size(350, 57)),
          child: const Text("Signup",style: TextStyle(
              fontSize: 18,color: Colors.white
          )),),
        ]
        ),

    );
  }
}




