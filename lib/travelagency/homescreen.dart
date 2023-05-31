import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:industrialvisit/login.dart';
import 'package:industrialvisit/travelagency/agencyprofile1.dart';
import 'package:industrialvisit/travelagency/userpackagedetail.dart';
import 'package:industrialvisit/travelagency/viewbookings.dart';
import 'package:industrialvisit/travelagency/viewpayment.dart';

import '../agencyprofile.dart';
import '../welcome.dart';
import 'managepackages.dart';

class agencyhomescreen extends StatefulWidget {
  const agencyhomescreen({Key? key}) : super(key: key);

  @override
  State<agencyhomescreen> createState() => _agencyhomescreenState();
}

class _agencyhomescreenState extends State<agencyhomescreen> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        body: SingleChildScrollView(
          child:Container(
            height: 600,



            child:Padding(
              padding:const EdgeInsets.all(20),
              child: GridView(


                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>managepackages()));
                    },
                    child: Container(decoration:BoxDecoration(borderRadius: BorderRadius.circular(40),color: Colors.blue,),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset("images/project-management.png",height: 80,),
SizedBox(height: 18,),
                          Text("Manage Packages",style: TextStyle(color: Colors.white,fontSize: 20),)
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>userpackagedetail()));
                    },
                    child: Container(decoration:BoxDecoration(borderRadius: BorderRadius.circular(40),color: Colors.pink,),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset("images/eye.png",height: 80,),
                          SizedBox(height: 17,),
                          Text("View Users Package",style: TextStyle(color: Colors.white,fontSize: 16),)
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>viewbookings()));
                    },
                    child: Container(decoration:BoxDecoration(borderRadius: BorderRadius.circular(40),color: Colors.red,),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset("images/vision.png",height: 80,),
                           SizedBox(height: 18,),
                           Text("View bookings",style: TextStyle(color: Colors.white,fontSize: 23),)
                        ],
                      ),
                    ),
                  ),

                  GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>viewpayment()));
                    },
                    child: Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(40),color: Colors.lightBlueAccent),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset("images/payment-method.png",height: 80,),
SizedBox(height: 20,),
                          Text("View Payment",style: TextStyle(color: Colors.white,fontSize:23 ),)
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
          (
          backgroundColor: Colors.pinkAccent,/*leading: IconButton(onPressed:(){},
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
                    Navigator.push(context,MaterialPageRoute(builder:(context)=> const agencyhomescreen()));
                  },
                ),
                ListTile(
                  leading: Icon(Icons.person),
                  title: const Text('Profile'),
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>agencyprofile1()));
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
