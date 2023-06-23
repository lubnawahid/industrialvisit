import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:industrialvisit/bookeditems.dart';
import 'package:industrialvisit/homescreen.dart';
import 'package:industrialvisit/packagecreation.dart';
import 'package:industrialvisit/packages.dart';
import 'package:industrialvisit/payment.dart';
import 'package:industrialvisit/payment0.dart';
import 'package:industrialvisit/payment1.dart';
import 'package:industrialvisit/profile.dart';
import 'package:industrialvisit/usercreatedpackages.dart';
import 'package:industrialvisit/userprofile.dart';
import 'package:industrialvisit/viewbookings.dart';
import 'package:industrialvisit/viewtravelagency.dart';
import 'package:industrialvisit/viewucpbookings.dart';
import 'package:industrialvisit/welcome.dart';
import 'booking.dart';
import 'chat.dart';
import 'feedback.dart';
import 'login.dart';
// class homescreen extends StatefulWidget {
//   const homescreen({Key? key}) : super(key: key);
//   @override
//   State<homescreen> createState() => _homescreenState();
// }
//
// String? payment;
// class _homescreenState extends State<homescreen> {
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//
//         body: SingleChildScrollView(
//         child:Container(
// height: 900,
//
//
//
//         child:Padding(
//         padding:const EdgeInsets.all(20),
//
//     child: GridView(
//
//
//     children: [
//
//       GestureDetector(
//         onTap: () {
//           Navigator.push(context, MaterialPageRoute(builder: (context)=>packages()));
//         },
//         child: Container(decoration:BoxDecoration(borderRadius: BorderRadius.circular(40),color: Colors.white,),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Image.asset("images/luggage.png",height: 80,),
//
//               Text("Packages",style: TextStyle(color: Colors.black,fontSize: 22,fontStyle: FontStyle.normal),)
//             ],
//           ),
//         ),
//       ),
//       GestureDetector(
//         onTap: () {
//           Navigator.push(context, MaterialPageRoute(builder: (context)=>packagecreation()));
//         },
//         child: Container(decoration:BoxDecoration(borderRadius: BorderRadius.circular(40),color: Colors.white,),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Image.asset("images/product-design.png",height: 80,),
//               Text("Package creation",style: TextStyle(color: Colors.black,fontSize: 22,fontStyle: FontStyle.normal),)
//             ],
//           ),
//         ),
//       ),
//       GestureDetector(
//         onTap: () {
//           Navigator.push(context, MaterialPageRoute(builder: (context)=>usercreatedpackages()));
//         },
//         child: Container(decoration:BoxDecoration(borderRadius: BorderRadius.circular(40),color: Colors.white,),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Image.asset("images/package.png",height: 80,),
//               Text("User Created Packages",style: TextStyle(color: Colors.black,fontSize: 19,fontStyle: FontStyle.normal),)
//             ],
//           ),
//         ),
//       ),
//       // GestureDetector(
//       //   onTap: () {
//       //     Navigator.push(context, MaterialPageRoute(builder: (context)=>booking()));
//       //   },
//       //   child: Container(decoration:BoxDecoration(borderRadius: BorderRadius.circular(40),color: Colors.white,),
//       //     child: Column(
//       //       mainAxisAlignment: MainAxisAlignment.center,
//       //       children: [
//       //         Image.asset("images/booking.png",height: 80,),
//       //        // Text("booking",style: TextStyle(color: Colors.white,fontSize: 30),)
//       //       ],
//       //     ),
//       //   ),
//       // ),
//       GestureDetector(
//         onTap: () {
//           Navigator.push(context, MaterialPageRoute(builder: (context)=>chat()));
//         },
//         child: Container(decoration:BoxDecoration(borderRadius: BorderRadius.circular(40),color: Colors.white,),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Image.asset("images/chat.png",height: 80,),
//
//               Text("Chat",style: TextStyle(color: Colors.black,fontSize: 19,fontStyle: FontStyle.normal),)
//             ],
//           ),
//         ),
//       ),
//     GestureDetector(
//       onTap: () {
//         Navigator.push(context, MaterialPageRoute(builder: (context)=> Pay()));
//       },
//     child: Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(40),color: Colors.white),
//     child: Column(
//     mainAxisAlignment: MainAxisAlignment.center,
//     children: [
//     Image.asset("images/cash-on-delivery.png",height: 80,),
//
//     Text("Payment",style: TextStyle(color: Colors.black,fontSize:19,fontStyle: FontStyle.normal ),)
//     ],
//     ),
//     ),
//     ),
//       GestureDetector(
//         onTap: () {
//           Navigator.push(context, MaterialPageRoute(builder: (context)=>viewbookings()));
//         },
//         child: Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(40),color: Colors.white),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Image.asset("images/eye.png",height: 80,),
//
//               Text("View Bookings",style: TextStyle(color: Colors.black,fontSize:19,fontStyle: FontStyle.normal ),)
//             ],
//           ),
//         ),
//       ),
//       GestureDetector(
//         onTap: () {
//           Navigator.push(context, MaterialPageRoute(builder: (context)=>viewucpbookings()));
//         },
//         child: Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(40),color: Colors.white),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Image.asset("images/read.png",height: 80,),
//
//               Text("Other Bookings",style: TextStyle(color: Colors.black,fontSize:19,fontStyle: FontStyle.normal ),)
//             ],
//           ),
//         ),
//       ),
//     ],
//     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,mainAxisSpacing: 10,crossAxisSpacing: 10),
//     ),
//     ),
//     ),
//     ),
//     appBar: AppBar
//     ( /*leading: IconButton(onPressed:(){},
//     icon:Icon(Icons.menu)),*/
//     title: Text("HomePage"),
//     ),
//
//     backgroundColor: Colors.white,
//     drawer: Drawer(
//     child: ListView(
//     padding: EdgeInsets.zero,
//     children:<Widget> [
//     UserAccountsDrawerHeader(accountName: Text("lubnaWahid"), accountEmail: Text("lubnalubz5714@gamil.com"),
//     currentAccountPicture: CircleAvatar(backgroundColor: Colors.orange,child: Text("L",style: TextStyle(fontSize: 40.0),
//     ),
//     ),
//     ),
//     ListTile(
//     leading: Icon(
//     Icons.home,
//     ),
//     title: const Text('Home'),
//     onTap: (){
//     Navigator.push(context,MaterialPageRoute(builder:(context)=>homescreen()));
//     },
//     ),
//     ListTile(
//     leading: Icon(Icons.person),
//     title: const Text('Profile'),
//     onTap: (){
//     Navigator.push(context, MaterialPageRoute(builder: (context)=>userprofile()));
//     },
//     ),
//     // ListTile(
//     // leading: Icon(Icons.book),
//     // title: const Text('My Booked Items'),
//     // onTap: (){
//     //  Navigator.push(context, MaterialPageRoute(builder: (context)=>const bookeditems()));
//     // },
//     // ),
//     ListTile(
//     leading: Icon(Icons.logout),
//     title: const Text('logout'),
//     onTap: (){
//     Navigator.push(context, MaterialPageRoute(builder: (context)=>const login()));
//     },
//     ),
//     ],
//     )
//     )
//     );
//     }
//   }
class homescreen extends StatefulWidget {
  const homescreen({Key? key}) : super(key: key);

  @override
  State<homescreen> createState() => _homescreenState();
}

class _homescreenState extends State<homescreen> {
  TextEditingController searchController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child:Padding(
            padding:const EdgeInsets.all(20),
            child:
            SingleChildScrollView(
              physics: ScrollPhysics(),
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.center,
                    height: 60,
                    width: MediaQuery.of(context).size.width,
                    decoration:BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      color: Colors.grey[300],
                    ),

                    child: TextField(
                      controller: searchController,
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.search),
                          hintText: "Search",
                          border: InputBorder.none
                      ),
                    ),
                  ),
SizedBox(height: 30,),
                  GridView.count(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    crossAxisCount: 2,
                    childAspectRatio: .85,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20,
                    children: [
                      Container(
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: [
                              BoxShadow(
                                  offset: Offset(0,17),
                                  blurRadius: 17,
                                  spreadRadius: -23
                              )
                            ]
                        ),
                        child: Material(
                          color: Colors.transparent,
                          child: InkWell(
                            onTap: () {
                               Navigator.push(context, MaterialPageRoute(builder: (context)=>packages()));

                            },
                            child: Column(
                              children: [
                                new Image.asset('images/luggage.png',
                                  height: 100,
                                  width: 150,
                                  alignment: Alignment.center,
                                ),
                                SizedBox(height: 6,),
                                Text('Packages',textAlign: TextAlign.center,style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),)

                              ],
                            ),
                          ),
                        ),
                      ),


                      Container(
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: [
                              BoxShadow(
                                  offset: Offset(0,17),
                                  blurRadius: 17,
                                  spreadRadius: -23
                              )
                            ]
                        ),
                        child: Material(
                          color: Colors.transparent,
                          child: InkWell(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>packagecreation()));

                            },
                            child: Column(
                              children: [

                                new Image.asset('images/product-design.png',
                                  height: 120,
                                  width: 120,
                                  alignment: Alignment.topCenter,fit: BoxFit.cover,
                                ),
                                Spacer(),
                                Text('Package Creation',textAlign: TextAlign.center,style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),)

                              ],
                            ),
                          ),
                        ),
                      ),



                      Container(
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: [
                              BoxShadow(
                                  offset: Offset(0,17),
                                  blurRadius: 17,
                                  spreadRadius: -23
                              )
                            ]
                        ),
                        child: Material(
                          color: Colors.transparent,
                          child: InkWell(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>usercreatedpackages()));

                            },
                            child: Column(
                              children: [

                                new Image.asset('images/package.png',
                                  height: 90,
                                  width: 150,
                                  alignment: Alignment.center,
                                ),
                                SizedBox(height: 10,),
                                Text('User Created Packages',textAlign: TextAlign.center,style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),)

                              ],
                            ),
                          ),
                        ),
                      ),

                      Container(
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: [
                              BoxShadow(
                                  offset: Offset(0,17),
                                  blurRadius: 17,
                                  spreadRadius: -23
                              )
                            ]
                        ),
                        child: Material(
                          color: Colors.transparent,
                          child: InkWell(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>viewtravelagency()));
                            },
                            child: Column(
                              children: [

                                new Image.asset('images/chat.png',
                                  height: 90,
                                  width: 150,
                                  alignment: Alignment.center,
                                ),
                                SizedBox(height: 10,),
                                Text('Chat',textAlign: TextAlign.center,style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),)

                              ],
                            ),
                          ),
                        ),
                      ),


                      Container(
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: [
                              BoxShadow(
                                  offset: Offset(0,17),
                                  blurRadius: 17,
                                  spreadRadius: -23
                              )
                            ]
                        ),
                        child: Material(
                          color: Colors.transparent,
                          child: InkWell(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>Pay()));

                            },
                            child: Column(
                              children: [

                                new Image.asset('images/cash-on-delivery.png',
                                  height: 90,
                                  width: 150,
                                  alignment: Alignment.center,
                                ),
                                SizedBox(height: 10,),
                                Text('Payment',textAlign: TextAlign.center,style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),)

                              ],
                            ),
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: [
                              BoxShadow(
                                  offset: Offset(0,17),
                                  blurRadius: 17,
                                  spreadRadius: -23
                              )
                            ]
                        ),
                        child: Material(
                          color: Colors.transparent,
                          child: InkWell(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>viewbookings()));
                            },
                            child: Column(
                              children: [

                                new Image.asset('images/eye.png',
                                  height: 90,
                                  width: 150,
                                  alignment: Alignment.center,
                                ),
                                SizedBox(height: 10,),
                                Text('View Bookings',textAlign: TextAlign.center,style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),)

                              ],
                            ),
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: [
                              BoxShadow(
                                  offset: Offset(0,17),
                                  blurRadius: 17,
                                  spreadRadius: -23
                              )
                            ]
                        ),
                        child: Material(
                          color: Colors.transparent,
                          child: InkWell(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>viewucpbookings()));

                            },
                            child: Column(
                              children: [

                                new Image.asset('images/read.png',
                                  height: 90,
                                  width: 150,
                                  alignment: Alignment.center,
                                ),
                                SizedBox(height: 10,),
                                Text('Other Bookings',textAlign: TextAlign.center,style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),)

                              ],
                            ),
                          ),
                        ),
                      ),


                    ],
                  ),
                ],
              ),
            ),
          )







      ),
      appBar: AppBar(
        /*leading: IconButton(onPressed: () {

          }, icon: Icon(Icons.menu)),*/
        title: Text("HomePage"),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text("Lubna Wahid"),
              accountEmail: Text("Lubnalubz5714@gmail.com"),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.orange,
                child: Text(
                  "L",
                  style: TextStyle(fontSize: 40.0),
                ),
              ),
            ),

            ListTile(
              leading: Icon(
                Icons.home,
              ),
              title: const Text('Home'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>homescreen()));
              },
            ),
            ListTile(
              leading: Icon(
                Icons.person,
              ),
              title: const Text('Profile'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>userprofile()));
              },
            ),
            // ListTile(
            //   leading: Icon(
            //     Icons.task,
            //   ),
            //   title: const Text('Complaint'),
            //   onTap: () {
            //     Navigator.push(context, MaterialPageRoute(builder: (context)=>Complaint_Details()));
            //   },
            // ),
            ListTile(
              leading: Icon(
                Icons.feedback,
              ),
              title: const Text('Feedback'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>feedback()));
              },
            ),
            ListTile(
              leading: Icon(
                Icons.logout,
              ),
              title: const Text('Logout'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>login()));
              },
            ),
          ],
        ),
      ),


    );
  }
}





