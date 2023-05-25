import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:industrialvisit/userregister.dart';
import 'login.dart';


class userregister extends StatefulWidget {
  const userregister({Key? key}) : super(key: key);

  @override
  State<userregister> createState() => _userregisterState();
}

class _userregisterState extends State<userregister> {


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
                    prefixIcon: Icon(Icons.mail),

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





                      labelText: "email",

                      hintText: "email",
                      prefixIcon: Icon(Icons.mail),

                      border: OutlineInputBorder(borderRadius:BorderRadius.circular(30)),

                    ),

                  )  ),
              Padding(

                  padding: const EdgeInsets.all(8),

                  child: TextField(

                    decoration: InputDecoration(





                      labelText: "phone number",

                      hintText: "phone number",
                      prefixIcon: Icon(Icons.phone_android),

                      border: OutlineInputBorder(borderRadius:BorderRadius.circular(30)),

                    ),

                  )  ),
              Padding(

                  padding: const EdgeInsets.all(8),

                  child: TextField(

                    decoration: InputDecoration(





                      labelText: "college name",

                      hintText: "college name",
                      prefixIcon: Icon(Icons.drive_file_rename_outline),

                      border: OutlineInputBorder(borderRadius:BorderRadius.circular(30)),

                    ),

                  )  ),

              Padding(

                  padding: const EdgeInsets.all(8),

                  child: TextField(

                    decoration: InputDecoration(





                      labelText: " college number",

                      hintText: "college number",
                      prefixIcon: Icon(Icons.phone),

                      border: OutlineInputBorder(borderRadius:BorderRadius.circular(30)),

                    ),

                  )  ),
              Padding(

                  padding: const EdgeInsets.all(8),

                  child: TextField(

                    decoration: InputDecoration(





                      labelText: " year",

                      hintText: "year",
                      prefixIcon: Icon(Icons.calendar_month),

                      border: OutlineInputBorder(borderRadius:BorderRadius.circular(30)),

                    ),

                  )  ),
              Padding(

                  padding: const EdgeInsets.all(8),

                  child: TextField(

                    decoration: InputDecoration(





                      labelText: "college place",

                      hintText: "college place",
                      prefixIcon: Icon(Icons.place),

                      border: OutlineInputBorder(borderRadius:BorderRadius.circular(30)),

                    ),

                  )  ),



          SizedBox(height: 20,),

              ElevatedButton(onPressed: (){
    Navigator.push(context, MaterialPageRoute(builder: (context)=>login()));

              },style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.0)),primary: Colors.pinkAccent,fixedSize: Size(300,50)),





                child: Text('Register',style: TextStyle(color: Colors.white),),

              ),

              SizedBox(height: 30.0,),

              Row(

                children: [

                  const Text('Already have an account?',style:TextStyle(fontSize: 16),),

                  TextButton(onPressed: (){

                    Navigator.push(context, MaterialPageRoute(builder: (context)=>login(),));

                  },

                    child: const Text('login',style: TextStyle(color:Colors.pinkAccent,fontSize: 16),),

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



