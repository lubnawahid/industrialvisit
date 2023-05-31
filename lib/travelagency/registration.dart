import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:industrialvisit/travelagency/login.dart';
import 'package:industrialvisit/travelagency/registration.dart';

class agencyregistration extends StatefulWidget {
  const agencyregistration({Key? key}) : super(key: key);

  @override
  State<agencyregistration> createState() => _agencyregistrationState();
}

class _agencyregistrationState extends State<agencyregistration> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Registration"),


      ),
      body: SingleChildScrollView(
        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,

          children: [

            Text("REGISTER HERE!", style: TextStyle(color: Colors.black),),

            SizedBox(height: 20,),

            Padding(

              padding: const EdgeInsets.all(8),

              child: TextField(

                decoration: InputDecoration(

                  labelText: "name",

                  hintText: "name",

                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30)),


                ),

              ),

            ),

            Padding(

                padding: const EdgeInsets.all(8),

                child: TextField(

                  decoration: InputDecoration(


                    labelText: "address",

                    hintText: "address",

                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30)),

                  ),

                )),


            Padding(

                padding: const EdgeInsets.all(8),

                child: TextField(

                  decoration: InputDecoration(


                    labelText: " agency name",

                    hintText: "agency name",

                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30)),

                  ),

                )),
            Padding(

                padding: const EdgeInsets.all(8),

                child: TextField(

                  decoration: InputDecoration(


                    labelText: " email",

                    hintText: "email",

                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30)),

                  ),

                )),

            Padding(

                padding: const EdgeInsets.all(8),

                child: TextField(

                  decoration: InputDecoration(


                    labelText: "username",

                    hintText: "username",

                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30)),

                  ),

                )),


            Padding(

                padding: const EdgeInsets.all(8),

                child: TextField(

                  obscureText: true,

                  decoration: InputDecoration(


                    labelText: "password",

                    hintText: "password",

                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30)),

                  ),

                )),

            Padding(

                padding: const EdgeInsets.all(8),

                child: TextField(

                  obscureText: true,
                  decoration: InputDecoration(


                    labelText: "confirm password",

                    hintText: "confirm password",

                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30)),

                  ),

                )),


            Padding(

                padding: const EdgeInsets.all(8),

                child: TextField(

                  decoration: InputDecoration(


                    labelText: " email",

                    hintText: "email",

                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30)),

                  ),

                )),
            Padding(

                padding: const EdgeInsets.all(8),

                child: TextField(

                  decoration: InputDecoration(


                    labelText: " phone number",

                    hintText: "phone number",

                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30)),

                  ),

                )),


            SizedBox(height: 20,),

            ElevatedButton(
              onPressed: () {
   // Navigator.push(context, MaterialPageRoute(builder: (context)=>agencylogin()));
    },

              style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50.0)),
                  primary: Colors.blue,
                  fixedSize: Size(300, 50)),


              child: Text('Register', style: TextStyle(color: Colors.white),),

            ), SizedBox(height: 30.0,),

            Row(

              children: [

                const Text(
                  'Already have an account?', style: TextStyle(fontSize: 16),),

                TextButton(onPressed: () {
                  //Navigator.push(context,MaterialPageRoute(builder: (context) => agencylogin(),));
                },

                  child: const Text('login', style: TextStyle(fontSize: 16),),

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


