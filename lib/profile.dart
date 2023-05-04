import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:industrialvisit/userprofile.dart';

import 'agencyprofile.dart';

class profile extends StatefulWidget {
  const profile({Key? key}) : super(key: key);

  @override
  State<profile> createState() => _profileState();
}

class _profileState extends State<profile> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(


        body:  Container(
            height: 400,

            child:Padding(
                padding:const EdgeInsets.all(20),
                child: GridView(

                  children: [

                    GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>agencyprofile()));
                      },

                      child:  Container(decoration:BoxDecoration(borderRadius: BorderRadius.circular(40),color: Colors.pink,),

                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset("images/travel-agency.png",height: 80,),
                            Text("Travelagency",style: TextStyle(color: Colors.white,fontSize: 30),)
                          ],
                        ),
                      ),
                    ),


                    GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>userprofile()));
                      },
                      child: Container(decoration:BoxDecoration(borderRadius: BorderRadius.circular(40),color: Colors.blueAccent,),

                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset("images/user.png",height: 80,),
                            Text("User",style: TextStyle(color: Colors.white,fontSize: 30),)
                          ],
                        ),
                      ),
                    ),


                  ],
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,mainAxisSpacing: 10,crossAxisSpacing: 10),
                )
            )
        )
    );

  }
}
