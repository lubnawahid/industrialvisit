import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:industrialvisit/agencyregister.dart';
import 'package:industrialvisit/travelagency/homescreen.dart';
import 'package:industrialvisit/travelagency/registration.dart';

class agencylogin extends StatefulWidget {
  const agencylogin({Key? key}) : super(key: key);

  @override
  State<agencylogin> createState() => _agencyloginState();
}

class _agencyloginState extends State<agencylogin> {
  String user="user";
  String ta="agency";
  TextEditingController userController=TextEditingController();
  TextEditingController pwdController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:AppBar(
          title: Text("login page"),


        ),
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
            ElevatedButton(onPressed: (){
              if(userController.text==user){

              }else if(userController.text==ta){

              }
              Navigator.push(context, MaterialPageRoute(builder: (context)=>agencyhomescreen()));
            },
              style:ElevatedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.0)),primary: Colors.pinkAccent,fixedSize: Size(300, 50)),
              child: Text("Login",style: TextStyle(color: Colors.white),),
            ),
            SizedBox(height: 30.0,),
            Row(
              children: [
                const Text('Does not have an account?',style:TextStyle(fontSize: 16),),
                SizedBox(width: 10,),
                TextButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>const agencyregistration()));
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