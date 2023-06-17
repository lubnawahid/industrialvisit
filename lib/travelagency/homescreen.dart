import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:industrialvisit/login.dart';
import 'package:industrialvisit/travelagency/agencyprofile1.dart';
import 'package:industrialvisit/travelagency/userpackagedetail.dart';
import 'package:industrialvisit/travelagency/viewbookings.dart';
import 'package:industrialvisit/travelagency/viewpayment.dart';

import '../agencyprofile.dart';
//import '../welcome.dart';
import '../chat.dart';
import 'chat.dart';
import 'managepackages.dart';

// class agencyhomescreen extends StatefulWidget {
//   const agencyhomescreen({Key? key}) : super(key: key);
//
//   @override
//   State<agencyhomescreen> createState() => _agencyhomescreenState();
// }
//
// class _agencyhomescreenState extends State<agencyhomescreen> {
//   @override
//   Widget build(BuildContext context) {
//
//     return Scaffold(
//         body: SingleChildScrollView(
//           child:Container(
//             height: 600,
//
//
//
//             child:Padding(
//               padding:const EdgeInsets.all(20),
//               child: GridView(
//
//
//                 children: [
//                   GestureDetector(
//                     onTap: () {
//                       Navigator.push(context, MaterialPageRoute(builder: (context)=>managepackages()));
//                     },
//                     child: Container(decoration:BoxDecoration(borderRadius: BorderRadius.circular(40),color: Colors.white,),
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Image.asset("images/project-management.png",height: 80,),
// SizedBox(height: 18,),
//                           Text("Manage Packages",style: TextStyle(color: Colors.black,fontSize: 20),)
//                         ],
//                       ),
//                     ),
//                   ),
//                   GestureDetector(
//                     onTap: () {
//                       Navigator.push(context, MaterialPageRoute(builder: (context)=>userpackagedetail()));
//                     },
//                     child: Container(decoration:BoxDecoration(borderRadius: BorderRadius.circular(40),color: Colors.white,),
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Image.asset("images/eye.png",height: 80,),
//                           SizedBox(height: 17,),
//                           Text("View Users Package",style: TextStyle(color: Colors.black,fontSize: 16),)
//                         ],
//                       ),
//                     ),
//                   ),
//                   GestureDetector(
//                     onTap: () {
//                       Navigator.push(context, MaterialPageRoute(builder: (context)=>viewbookings()));
//                     },
//                     child: Container(decoration:BoxDecoration(borderRadius: BorderRadius.circular(40),color: Colors.white,),
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Image.asset("images/vision.png",height: 80,),
//                            SizedBox(height: 18,),
//                            Text("View bookings",style: TextStyle(color: Colors.black,fontSize: 23),)
//                         ],
//                       ),
//                     ),
//                   ),
//
//                   GestureDetector(
//                     onTap: () {
//                       Navigator.push(context, MaterialPageRoute(builder: (context)=>viewpayment()));
//                     },
//                     child: Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(40),color: Colors.white),
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Image.asset("images/payment-method.png",height: 80,),
// SizedBox(height: 20,),
//                           Text("View Payment",style: TextStyle(color: Colors.black,fontSize:23 ),)
//                         ],
//                       ),
//                     ),
//                   ),
//
//                 ],
//                 gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,mainAxisSpacing: 10,crossAxisSpacing: 10),
//               ),
//             ),
//           ),
//         ),
//         appBar: AppBar
//           (
//           backgroundColor: Colors.blue,/*leading: IconButton(onPressed:(){},
//     icon:Icon(Icons.menu)),*/
//           title: Text("HomePage"),
//         ),
//         backgroundColor: Colors.white,
//         drawer: Drawer(
//
//             child: ListView(
//               padding: EdgeInsets.zero,
//               children:<Widget> [
//                 UserAccountsDrawerHeader(accountName: Text("lubnaWahid"), accountEmail: Text("lubnalubz5714@gamil.com"),
//                   currentAccountPicture: CircleAvatar(backgroundColor: Colors.orange,child: Text("L",style: TextStyle(fontSize: 40.0),
//                   ),
//                   ),
//                 ),
//                 ListTile(
//                   leading: Icon(
//                     Icons.home,
//                   ),
//                   title: const Text('Home'),
//                   onTap: (){
//                     Navigator.push(context,MaterialPageRoute(builder:(context)=> const agencyhomescreen()));
//                   },
//                 ),
//                 ListTile(
//                   leading: Icon(Icons.person),
//                   title: const Text('Profile'),
//                   onTap: (){
//                     Navigator.push(context, MaterialPageRoute(builder: (context)=>agencyprofile1()));
//                   },
//                 ),
//
//                 ListTile(
//                   leading: Icon(Icons.logout),
//                   title: const Text('logout'),
//                   onTap: (){
//                     Navigator.push(context, MaterialPageRoute(builder: (context)=>const login()));
//                   },
//                 ),
//               ],
//             )
//         )
//     );
//   }
// }

class agencyhomescreen extends StatefulWidget {
  const agencyhomescreen({Key? key}) : super(key: key);

  @override
  State<agencyhomescreen> createState() => _agencyhomescreenState();
}

class _agencyhomescreenState extends State<agencyhomescreen> {
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
SizedBox(height: 50,),
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
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>managepackages()));

                            },
                            child: Column(
                              children: [
                                new Image.asset('images/project-management.png',
                                  height: 100,
                                  width: 150,
                                  alignment: Alignment.center,
                                ),
                                SizedBox(height: 6,),
                                Text('Manage Packages',textAlign: TextAlign.center,style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),)

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
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>userpackagedetail()));

                            },
                            child: Column(
                              children: [

                                new Image.asset('images/eye.png',
                                  height: 120,
                                  width: 120,
                                  alignment: Alignment.topCenter,fit: BoxFit.cover,
                                ),
                                Spacer(),
                                Text('View Users Package',textAlign: TextAlign.center,style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),)

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
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>agencychat()));

                            },
                            child: Column(
                              children: [

                                new Image.asset('images/chatting.jpg',
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
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>viewbookings()));

                            },
                            child: Column(
                              children: [

                                new Image.asset('images/vision.png',
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
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>viewpayment()));
                            },
                            child: Column(
                              children: [

                                new Image.asset('images/payment-method.png',
                                  height: 90,
                                  width: 150,
                                  alignment: Alignment.center,
                                ),
                                SizedBox(height: 10,),
                                Text('View Payment',textAlign: TextAlign.center,style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),)

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
                Navigator.push(context, MaterialPageRoute(builder: (context)=>agencyhomescreen()));
              },
            ),
            ListTile(
              leading: Icon(
                Icons.person,
              ),
              title: const Text('Profile'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>agencyprofile1()));
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
            // ListTile(
            //   leading: Icon(
            //     Icons.feedback,
            //   ),
            //   title: const Text('Feedback'),
            //   onTap: () {
            //     Navigator.push(context, MaterialPageRoute(builder: (context)=>RatingBarScreen()));
            //   },
            // ),
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






















