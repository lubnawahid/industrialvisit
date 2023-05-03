import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:industrialvisit/homescreen.dart';
import 'package:industrialvisit/packagecreation.dart';
import 'package:industrialvisit/payment.dart';
import 'package:industrialvisit/payment1.dart';
import 'package:industrialvisit/welcome.dart';

import 'booking.dart';
import 'chat.dart';


import 'login.dart';

class homescreen extends StatefulWidget {
  const homescreen({Key? key}) : super(key: key);

  @override
  State<homescreen> createState() => _homescreenState();
}

class _homescreenState extends State<homescreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(


        body: SingleChildScrollView(
          child:Container(
            height: 400,

            child:Padding(
              padding:const EdgeInsets.all(20),
              child: GridView(


                children: [

                  GestureDetector(
                    onTap: () {
                      // Navigator.push(context, MaterialPageRoute(builder: (context)=>agencyregister()));
                    },

                    child:  Container(decoration:BoxDecoration(borderRadius: BorderRadius.circular(40),color: Colors.pink,),

                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset("images/luggage.png",height: 80,),
                          Text("Packages",style: TextStyle(color: Colors.white,fontSize: 30),)
                        ],
                      ),
                    ),
                  ),



                  GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>packagecreation()));
                    },
                    child: Container(decoration:BoxDecoration(borderRadius: BorderRadius.circular(40),color: Colors.yellow,),

                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset("images/product-design.png",height: 80,),
                          Text("Packagecreation",style: TextStyle(color: Colors.white,fontSize: 23),)
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>booking()));
                    },
                    child: Container(decoration:BoxDecoration(borderRadius: BorderRadius.circular(40),color: Colors.black12,),

                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset("images/booking.png",height: 80,),
                          // Text("Booking",style: TextStyle(color: Colors.white,fontSize: 30),)
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) =>payment()));
                    },
                    child: Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(40),color: Colors.lightBlueAccent),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset("images/cash-on-delivery.png",height: 80,),
                          Text("Payment",style: TextStyle(color: Colors.white,fontSize:30 ),)
                        ],
                      ),
                    ),
                  ),

                  GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>chat()));
                    },
                    child: Container(decoration:BoxDecoration(borderRadius: BorderRadius.circular(40),color: Colors.green,),

                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset("images/chat.png",height: 80,),
                          Text("Chat",style: TextStyle(color: Colors.white,fontSize: 30),)
                        ],
                      ),
                    ),
                  ),



                ],
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,mainAxisSpacing: 10,crossAxisSpacing: 10),
              ),

            ),
          ),
        ),
        appBar: AppBar
          ( /*leading: IconButton(onPressed:(){},
    icon:Icon(Icons.menu)),*/
          title: Text("HomePage"),
        ),
        drawer: Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children:<Widget> [
                UserAccountsDrawerHeader(accountName: Text("lubnaWahid"), accountEmail: Text("lubnalubz5714@gamil.com"),
                  currentAccountPicture: CircleAvatar(backgroundColor: Colors.orange,child: Text("L",style: TextStyle(fontSize: 40.0),
                  ),
                  ),
                ),
                ListTile(
                  leading: Icon(
                    Icons.home,
                  ),
                  title: const Text('Home'),
                  onTap: (){
                    Navigator.push(context,MaterialPageRoute(builder:(context)=>homescreen()));
                  },
                ),
                ListTile(
                  leading: Icon(Icons.person),
                  title: const Text('Profile'),
                  onTap: (){
                    // Navigator.push(context, MateriaPageRoutle(builder: (context)=>));
                  },
                ),
                ListTile(
                  leading: Icon(Icons.book),
                  title: const Text('My Booked Items'),
                  onTap: (){
                    // Navigator.push(context, MaterialPageRoute(builder: (context)=>));
                  },
                ),
                ListTile(
                  leading: Icon(Icons.logout),
                  title: const Text('logout'),
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>const welcome()));
                  },
                ),
              ],
            )
        )
    );


  }
}

