import 'package:flutter/material.dart';
import 'package:industrialvisit/homescreen.dart';
import 'package:industrialvisit/login.dart';
import 'package:industrialvisit/registration.dart';
import 'package:industrialvisit/travelagency/homescreen.dart';
import 'forgotpassword.dart';
import 'userregister.dart';


class login extends StatefulWidget {
    const login({ Key? key }) : super(key: key);

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  String user="user";
  String ta="agency";
  TextEditingController userController=TextEditingController();
  TextEditingController pwdController=TextEditingController();
    @override
    Widget build(BuildContext context) {
    return Scaffold(

    body:Column(
    mainAxisAlignment:MainAxisAlignment.center,
    children: [
    Text("LOGIN",style: TextStyle(color: Colors.black,fontSize: 20,fontWeight:FontWeight.bold),

    ),
    SizedBox(height: 20.0,),
    Align(alignment: Alignment.center,
    child: Text('welcome back!',style: TextStyle(color:Colors.black,fontSize: 17),textAlign: TextAlign.center,),

    ),

    Padding(
    padding: const EdgeInsets.all(8),
    child: TextField(
        controller: userController,
    decoration: InputDecoration(
    prefixIcon:Icon(Icons.person),
    labelText: "username",
    hintText: "username",
    border: OutlineInputBorder(borderRadius:BorderRadius.circular(30)),

    ),


    ),
    ),SizedBox(height: 20),

    Padding(
    padding: const EdgeInsets.all(8),
    child: TextField(
      controller: pwdController,
    obscureText: true,
    decoration: InputDecoration(

    prefixIcon: Icon(Icons.lock),
    labelText: "password",
    hintText: "password",
    suffixIcon: Icon(Icons.remove_red_eye),


    border: OutlineInputBorder(borderRadius: BorderRadius.circular(30))
    ),

    ),
    ),
    SizedBox(height: 20,),
    TextButton(onPressed: (){
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => fpassword()));
    },
        child:Text("Forgot Password?",style: TextStyle(color:Colors.pinkAccent,fontSize: 14),),


    ),
    ElevatedButton(
      child: Text("Login",style: TextStyle(color: Colors.white),),
      onPressed: () {
      if (pwdController.text == user) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => homescreen()));
      } else if (pwdController.text == ta) {
        Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => agencyhomescreen()));
      }else{
        print("error");
      }
    },
    style:ElevatedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.0)),primary: Colors.pinkAccent,fixedSize: Size(300, 50)),

    ),
    SizedBox(height: 30.0,),
    Row(
    children: [
    const Text('Does not have an account?',style:TextStyle(fontSize: 16),),
    SizedBox(width: 10,),
    TextButton(onPressed: (){
    Navigator.push(context, MaterialPageRoute(builder: (context)=>registration()));
    },
    child: const Text('Register Here',style: TextStyle(color:Colors.pinkAccent,fontSize: 16),),
    ),

    ],
    mainAxisAlignment: MainAxisAlignment.center,
    ),



    ],

    )

    );
    }
}
