import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'login.dart';

class agencyregister extends StatefulWidget {
  const agencyregister({Key? key}) : super(key: key);

  @override
  State<agencyregister> createState() => _agencyregisterState();
}

class _agencyregisterState extends State<agencyregister> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Registration"),


      ),
      body: SingleChildScrollView(
        child:   Column(

          mainAxisAlignment:MainAxisAlignment.center,

          children: [

            Text("REGISTER HERE!",style: TextStyle(color: Colors.black),),

            SizedBox(height: 20,),

            Padding(

              padding: const EdgeInsets.all(8),

              child: TextField(

                decoration: InputDecoration(

                  labelText: "name",

                  hintText: "name",
                  prefixIcon: Icon(Icons.person),

                  border: OutlineInputBorder(borderRadius:BorderRadius.circular(30)),





                ),

              ),

            ),

            Padding(

                padding: const EdgeInsets.all(8),

                child: TextField(

                  decoration: InputDecoration(





                    labelText: "address",

                    hintText: "address",
                    prefixIcon: Icon(Icons.location_on),

                    border: OutlineInputBorder(borderRadius:BorderRadius.circular(30)),

                  ),

                )  ),


            Padding(

                padding: const EdgeInsets.all(8),

                child: TextField(

                  decoration: InputDecoration(





                    labelText: " agency name",

                    hintText: "agency name",
                    prefixIcon: Icon(Icons.person_2),

                    border: OutlineInputBorder(borderRadius:BorderRadius.circular(30)),

                  ),

                )  ),
            Padding(

                padding: const EdgeInsets.all(8),

                child: TextField(

                  decoration: InputDecoration(





                    labelText: " email",

                    hintText: "email",
                    prefixIcon: Icon(Icons.mail),
                    border: OutlineInputBorder(borderRadius:BorderRadius.circular(30)),

                  ),

                )  ),

            Padding(

                padding: const EdgeInsets.all(8),

                child: TextField(

                  decoration: InputDecoration(





                    labelText: "username",

                    hintText: "username",
                    prefixIcon: Icon(Icons.person),
                    border: OutlineInputBorder(borderRadius:BorderRadius.circular(30)),

                  ),

                )  ),





            Padding(

                padding: const EdgeInsets.all(8),

                child: TextField(

                  obscureText: true,

                  decoration: InputDecoration(





                    labelText: "password",

                    hintText: "password",
                    prefixIcon: Icon(Icons.lock),
                    border: OutlineInputBorder(borderRadius:BorderRadius.circular(30)),

                  ),

                )  ),

            Padding(

                padding: const EdgeInsets.all(8),

                child: TextField(

                  obscureText: true,
                  decoration: InputDecoration(





                    labelText: "confirm password",

                    hintText: "confirm password",
                    prefixIcon: Icon(Icons.lock),
                    border: OutlineInputBorder(borderRadius:BorderRadius.circular(30)),

                  ),

                )  ),



            Padding(

                padding: const EdgeInsets.all(8),

                child: TextField(

                  decoration: InputDecoration(





                    labelText: "place",

                    hintText: "place",
                    prefixIcon: Icon(Icons.location_on),
                    border: OutlineInputBorder(borderRadius:BorderRadius.circular(30)),

                  ),

                )  ),
            Padding(

                padding: const EdgeInsets.all(8),

                child: TextField(

                  decoration: InputDecoration(





                    labelText: " phone number",

                    hintText: "phone number",
                    prefixIcon: Icon(Icons.phone_android),
                    border: OutlineInputBorder(borderRadius:BorderRadius.circular(30)),

                  ),

                )  ),



            SizedBox(height: 20,),

            ElevatedButton(onPressed: (){
    Navigator.push(context, MaterialPageRoute(builder: (context)=>login()));

            },style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.0)),primary: Colors.blue,fixedSize: Size(300,50)),





              child: Text('Register',style: TextStyle(color: Colors.white),),

            ),SizedBox(height: 30.0,),

            Row(

              children: [

                const Text('Already have an account?',style:TextStyle(fontSize: 16),),

                TextButton(onPressed: (){

                  Navigator.push(context, MaterialPageRoute(builder: (context)=>login(),));

                },

                  child: const Text('login',style: TextStyle(fontSize: 16),),

                ),



              ],

              mainAxisAlignment: MainAxisAlignment.center,

            ),




          ],
        ),


      ),

    );




  }

}