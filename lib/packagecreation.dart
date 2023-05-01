import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class packagecreation extends StatefulWidget {
  const packagecreation({Key? key}) : super(key: key);

  @override
  State<packagecreation> createState() => _packagecreationState();
}

class _packagecreationState extends State<packagecreation> {
  @override
  Widget build(BuildContext context) {



    return Scaffold(
      appBar: AppBar(
        title: Text("Package Creation"),


      ),
      body: SingleChildScrollView(
        child:   Column(

          mainAxisAlignment:MainAxisAlignment.center,

          children: [

            Text("Comment Your Favourite Spot Here!",style: TextStyle(color: Colors.black),),

            SizedBox(height: 20,),

            Padding(

              padding: const EdgeInsets.all(8),

              child: TextField(

                decoration: InputDecoration(

                  labelText: "company name",

                  hintText: "company name",

                  border: OutlineInputBorder(borderRadius:BorderRadius.circular(30)),





                ),

              ),

            ),

            Padding(

                padding: const EdgeInsets.all(8),

                child: TextField(

                  decoration: InputDecoration(





                    labelText: "place",

                    hintText: "place",

                    border: OutlineInputBorder(borderRadius:BorderRadius.circular(30)),

                  ),

                )  ),

            Padding(

                padding: const EdgeInsets.all(8),

                child: TextField(

                  decoration: InputDecoration(





                    labelText: "place",

                    hintText: "place",

                    border: OutlineInputBorder(borderRadius:BorderRadius.circular(30)),

                  ),

                )  ),

            Padding(

                padding: const EdgeInsets.all(8),

                child: TextField(

                  decoration: InputDecoration(





                    labelText: "date",

                    hintText: "date",

                    border: OutlineInputBorder(borderRadius:BorderRadius.circular(30)),

                  ),

                )  ),





            Padding(

                padding: const EdgeInsets.all(8),

                child: TextField(



                  decoration: InputDecoration(





                    labelText: "days",

                    hintText: "days",

                    border: OutlineInputBorder(borderRadius:BorderRadius.circular(30)),

                  ),

                )  ),









            SizedBox(height: 20,),

            ElevatedButton(onPressed: (){},style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.0)),primary: Colors.blue,fixedSize: Size(300,50)),





              child: Text('Create',style: TextStyle(color: Colors.white),),

            ),





          ],
        ),


      ),

    );




  }

}





