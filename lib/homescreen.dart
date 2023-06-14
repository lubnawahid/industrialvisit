import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:industrialvisit/bookeditems.dart';
import 'package:industrialvisit/homescreen.dart';
import 'package:industrialvisit/packagecreation.dart';
import 'package:industrialvisit/packages.dart';
import 'package:industrialvisit/payment.dart';
import 'package:industrialvisit/payment1.dart';
import 'package:industrialvisit/profile.dart';
import 'package:industrialvisit/usercreatedpackages.dart';
import 'package:industrialvisit/userprofile.dart';
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
height: 600,



        child:Padding(
        padding:const EdgeInsets.all(20),

    child: GridView(


    children: [

      GestureDetector(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context)=>packages()));
        },
        child: Container(decoration:BoxDecoration(borderRadius: BorderRadius.circular(40),color: Colors.white,),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("images/luggage.png",height: 80,),

              Text("Packages",style: TextStyle(color: Colors.black,fontSize: 22,fontStyle: FontStyle.normal),)
            ],
          ),
        ),
      ),
      GestureDetector(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context)=>packagecreation()));
        },
        child: Container(decoration:BoxDecoration(borderRadius: BorderRadius.circular(40),color: Colors.white,),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("images/product-design.png",height: 80,),
              Text("Package creation",style: TextStyle(color: Colors.black,fontSize: 22,fontStyle: FontStyle.normal),)
            ],
          ),
        ),
      ),
      GestureDetector(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context)=>usercreatedpackages()));
        },
        child: Container(decoration:BoxDecoration(borderRadius: BorderRadius.circular(40),color: Colors.white,),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("images/package.png",height: 80,),
              Text("User Created Packages",style: TextStyle(color: Colors.black,fontSize: 19,fontStyle: FontStyle.normal),)
            ],
          ),
        ),
      ),
      // GestureDetector(
      //   onTap: () {
      //     Navigator.push(context, MaterialPageRoute(builder: (context)=>booking()));
      //   },
      //   child: Container(decoration:BoxDecoration(borderRadius: BorderRadius.circular(40),color: Colors.white,),
      //     child: Column(
      //       mainAxisAlignment: MainAxisAlignment.center,
      //       children: [
      //         Image.asset("images/booking.png",height: 80,),
      //        // Text("booking",style: TextStyle(color: Colors.white,fontSize: 30),)
      //       ],
      //     ),
      //   ),
      // ),
      GestureDetector(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context)=>chat()));
        },
        child: Container(decoration:BoxDecoration(borderRadius: BorderRadius.circular(40),color: Colors.white,),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("images/chat.png",height: 80,),

              Text("Chat",style: TextStyle(color: Colors.black,fontSize: 19,fontStyle: FontStyle.normal),)
            ],
          ),
        ),
      ),
    GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context)=>payment()));
      },
    child: Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(40),color: Colors.white),
    child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
    Image.asset("images/cash-on-delivery.png",height: 80,),

    Text("Payment",style: TextStyle(color: Colors.black,fontSize:19,fontStyle: FontStyle.normal ),)
    ],
    ),
    ),
    ),
      GestureDetector(
        onTap: () {
         // Navigator.push(context, MaterialPageRoute(builder: (context)=>payment()));
        },
        child: Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(40),color: Colors.white),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("images/eye.png",height: 80,),

              Text("View Bookings",style: TextStyle(color: Colors.black,fontSize:19,fontStyle: FontStyle.normal ),)
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

    backgroundColor: Colors.white,
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
    Navigator.push(context, MaterialPageRoute(builder: (context)=>userprofile()));
    },
    ),
    // ListTile(
    // leading: Icon(Icons.book),
    // title: const Text('My Booked Items'),
    // onTap: (){
    //  Navigator.push(context, MaterialPageRoute(builder: (context)=>const bookeditems()));
    // },
    // ),
    ListTile(
    leading: Icon(Icons.logout),
    title: const Text('logout'),
    onTap: (){
    Navigator.push(context, MaterialPageRoute(builder: (context)=>const login()));
    },
    ),
    ],
    )
    )
    );
    }
  }






