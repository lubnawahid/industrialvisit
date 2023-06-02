import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:industrialvisit/homescreen.dart';
import 'package:industrialvisit/login.dart';
import 'package:industrialvisit/registration.dart';
import 'package:industrialvisit/travelagency/homescreen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'api.dart';
import 'forgotpassword.dart';


class login extends StatefulWidget {
    const login({ Key? key }) : super(key: key);

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {

  String user="user";
  String ta="travelagency";
  String role="";
  String status ="";
  String ststatus="1";
  bool _isLoading = false;
  late SharedPreferences localStorage;


  TextEditingController userController=TextEditingController();
  TextEditingController pwdController=TextEditingController();

  _pressLoginButton() async {
    setState(() {
      _isLoading = true;
    });
    var data = {
      'username': userController.text.trim(), //username for email
      'password': pwdController.text.trim()
    };
   // print("data${data}");
    var res = await Api().authData(data, '/api/user_login');
    var body = json.decode(res.body);
    //print(body);
    if (body['success'] == true) {
      print(body);

      role = body['data']['role'];
      status = body['data']['l_status'];
      print("status${status}");
      print("ststatus${ststatus}");
      print("user${user}");
      print("agency${ta}");




     // print('travelagency_id ${body['data']['travelagency_id']}');


      if (user == role ) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => homescreen()));
      }
      else if (ta == role &&
ststatus == status
      ) {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => agencyhomescreen()));

        localStorage = await SharedPreferences.getInstance();
        localStorage.setString('role', role.toString());
        localStorage.setInt('login_id', body['data']['login_id']);
        localStorage.setInt('user_id', body['data']['user_id']);

        //localStorage.setInt('travelagency_id',body['data']['user_id']);
        print('login_id ${body['data']['login_id']}');
         print('user_id ${body['data']['user_id']}');

      }



      else {
        Fluttertoast.showToast(
          msg: "Please wait for admin approval",
          backgroundColor: Colors.grey,
        );
      }
    }
  }
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
        _pressLoginButton();
      },
     // if (pwdController.text == user) {
      //  Navigator.push(
          //  context, MaterialPageRoute(builder: (context) => homescreen()));
     // } else if (pwdController.text == ta) {
       // Navigator.push(
         //   context,
           // MaterialPageRoute(builder: (context) => agencyhomescreen()));
     // }else{
      //  print("error");
    //  }
   // },
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
