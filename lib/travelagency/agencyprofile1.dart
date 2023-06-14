// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// import '../agencyprofile.dart';
// import '../agencyprofile.dart';
// import '../agencyprofile.dart';
// import '../welcome.dart';
// import 'homescreen.dart';
//
//
// class agencyprofile1 extends StatefulWidget {
//   const agencyprofile1({Key? key}) : super(key: key);
//
//   @override
//   State<agencyprofile1> createState() => _agencyprofileState1();
// }
//
// class _agencyprofileState1 extends State<agencyprofile1> {
//
//   bool isObscurePassword = true;
//
//   int currentTab = 2;
//   final List<Widget> screen = [
//
//     agencyprofile1(),
//
//   ];
//
//   Widget currentScreen = agencyprofile1();
//
//   TextEditingController unameController = TextEditingController();
//   TextEditingController plcController = TextEditingController();
//   TextEditingController emailController = TextEditingController();
//   TextEditingController pwdController = TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//
//
//       appBar: AppBar(
//         backgroundColor: Colors.pinkAccent,
//         title: Text("Profile"),
//         actions: [
//           IconButton(
//             tooltip: "Logout",
//             onPressed: () {
//               Navigator.push(
//                   context, MaterialPageRoute(builder: (context) => welcome()));
//             },
//             icon: Icon(
//               Icons.logout,
//             ),
//           )
//         ],
//       ),
//
//       body: Container(
//         padding: EdgeInsets.only(left: 15, top: 20, right: 15),
//         child: GestureDetector(
//           onTap: () {
//             FocusScope.of(context).unfocus();
//           },
//           child: ListView(
//             children: [
//               Center(
//                 child: Stack(
//                   children: [
//                     Container(
//                       width: 130,
//                       height: 130,
//                       decoration: BoxDecoration(
//                           border: Border.all(width: 4, color: Colors.white),
//                           boxShadow: [
//                             BoxShadow(
//                                 spreadRadius: 2,
//                                 blurRadius: 10,
//                                 color: Colors.black.withOpacity(0.1)
//                             )
//                           ],
//                           shape: BoxShape.circle,
//                           image: DecorationImage(
//                             fit: BoxFit.cover,
//                             image: NetworkImage(
//                                 ""
//                             ),
//                           )
//                       ),
//                     ),
//                     Positioned(
//                       bottom: 0,
//                       right: 0,
//                       child: Container(
//                           height: 40,
//                           width: 40,
//                           decoration: BoxDecoration(
//                               shape: BoxShape.circle,
//                               border: Border.all(
//                                   width: 4,
//                                   color: Colors.white
//                               ),
//                               color: Colors.blue
//                           ),
//                           child: Icon(
//                             Icons.edit,
//                             color: Colors.white,
//                           )
//                       ),
//                     ),
//
//
//                   ],
//                 ),
//               ),
//               SizedBox(height: 30,),
//
//               buildTextField(" name", "raghu PS", false),
//               buildTextField("adress", "Ps", false),
//               buildTextField("agencyname", "sarikha agency", false),
//               buildTextField("agencyplace", "calicut", false),
//
//               buildTextField("Email", "Artistps@gmail.com", false),
//               buildTextField("Password", "9898934", true),
//               buildTextField("Phone number", "9897458711", false),
//
//               SizedBox(height: 30,),
//
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   OutlinedButton(
//                     onPressed: () {
//                       Navigator.push(context, MaterialPageRoute(
//                           builder: (context) => agencyprofile()));
//                     },
//                     child: Text("CANCEL", style: TextStyle(
//                         fontSize: 15,
//                         letterSpacing: 2,
//                         color: Colors.black
//                     )),
//                     style: OutlinedButton.styleFrom(
//                         padding: EdgeInsets.symmetric(horizontal: 50),
//                         shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(20))
//                     ),
//                   ),
//
//                   ElevatedButton(
//                     onPressed: () {},
//                     child: Text("SUBMIT", style: TextStyle(
//                         fontSize: 15, letterSpacing: 2, color: Colors.white),),
//                     style: ElevatedButton.styleFrom(
//                         primary: Colors.pinkAccent,
//                         padding: EdgeInsets.symmetric(horizontal: 50),
//                         shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(20))
//                     ),
//                   )
//                 ],
//               )
//             ],
//           ),
//         ),
//       ),
//
//     );
//   }
//
//   Widget buildTextField(String labelText, String placeholder,
//       bool isPasswordTextField) {
//     return Padding(
//       padding: EdgeInsets.only(bottom: 30),
//       child: TextFormField(
//         obscureText: isPasswordTextField ? isObscurePassword : false,
//         decoration: InputDecoration(
//             suffixIcon: isPasswordTextField ?
//             IconButton(
//               onPressed: () {
//                 setState(() {
//                   isObscurePassword = !isObscurePassword;
//                 });
//               },
//               icon: Icon(Icons.remove_red_eye, color: Colors.grey,),
//             ) : null,
//             contentPadding: EdgeInsets.only(bottom: 5),
//             labelText: labelText,
//             floatingLabelBehavior: FloatingLabelBehavior.always,
//             hintText: placeholder,
//             hintStyle: TextStyle(
//                 fontSize: 16,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.grey
//             )
//
//         ),
//       ),
//     );
//   }
// }
//
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../api.dart';
import '../login.dart';
import '../profile.dart';
import 'homescreen.dart';

class agencyprofile1 extends StatefulWidget {
  const agencyprofile1({Key? key}) : super(key: key);

  @override
  State<agencyprofile1> createState() => _agencyprofile1State();
}

class _agencyprofile1State extends State<agencyprofile1> {


  bool isObscurePassword=true;
  late int user_id;
  String name="";
  String agencyname='';
  String place='';
  String phonenumber='';
  late SharedPreferences prefs;
  TextEditingController nameController=TextEditingController();
  TextEditingController agencynameController=TextEditingController();

  TextEditingController placeController=TextEditingController();
  TextEditingController phonenumberController=TextEditingController();
  @override

  void initState() {
    // TODO: implement initState
    super.initState();
    _viewPro();
  }
  int currentTab = 2;
  Future<void> _viewPro() async {
    prefs = await SharedPreferences.getInstance();
    user_id = (prefs.getInt('user_id') ?? 0 );
    print('login_idupdate ${user_id }');
    var res = await Api().getData('/api/travelagency_single_view/'+user_id.toString());

    var body = json.decode(res.body);
    print(body);


    setState(() {
      name = body['data']['name'];
      agencyname = body['data']['agencyname'];
      place = body['data']['place'];
      phonenumber = body['data']['phonenumber'];



      nameController.text = name;
      agencynameController.text = agencyname;
      placeController.text=place;
      phonenumberController.text=phonenumber;

    });
  }


  Future<void> _update(String name,String agencyname,String place, String contact) async {

    prefs = await SharedPreferences.getInstance();
    user_id = (prefs.getInt('user_id') ?? 0 );
    print(user_id);
    var uri = Uri.parse(Api().url+'/api/travelagencyprofile_update/'+user_id.toString()); // Replace with your API endpoint
    var request = http.MultipartRequest('PUT', uri);
    request.fields['name'] = name;
    request.fields['agencyname'] = agencyname;
    request.fields['place'] = place;
    request.fields['phonenumber'] = contact;

    print(request.fields);
    final response = await request.send();
    print(response);

    if (response.statusCode == 200) {
      print('Profile Updated successfully');
      Navigator.push(
          this.context, MaterialPageRoute(builder: (context) => agencyhomescreen()));
    } else {
      print('Error Updating profile. Status code: ${response.statusCode}');
    }
  }

  Widget currentScreen = profile();
    Widget build(BuildContext context) {
      return Scaffold(

        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Text("Profile"),
          leading: IconButton(
            onPressed: (){
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back),
          ),
          actions: [
            IconButton(
              tooltip: "Logout",
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>login()));
              },
              icon: Icon(
                Icons.logout,
                size: 28,
              ),
            )
          ],
        ),

        body: Container(
          padding: EdgeInsets.only(left: 15, top: 20, right: 15),
          child: GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
            },
            child: ListView(
              children: [

                Center(
                  child: Stack(
                    children: [
                      Container(
                        width: 130,
                        height: 130,
                        decoration: BoxDecoration(
                            border: Border.all(width: 4, color: Colors.white),
                            boxShadow: [
                              BoxShadow(
                                  spreadRadius: 2,
                                  blurRadius: 10,
                                  color: Colors.black.withOpacity(0.1)
                              )
                            ],
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage("images/travel-agency.png"),
                            )
                        ),
                      ),



                    ],
                  ),
                ),
                SizedBox(height: 60,),
                buildTextField("Name",nameController),
                buildTextField("Agency name",agencynameController),
                buildTextField("Place",placeController),
                buildTextField("Phone number", phonenumberController),

                SizedBox(height: 70,),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    OutlinedButton(
                      onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>agencyhomescreen()));
                      },
                      child: Text("CANCEL",style: TextStyle(
                          fontSize: 15,
                          letterSpacing: 2,
                          color: Colors.black
                      )),
                      style: OutlinedButton.styleFrom(
                          padding: EdgeInsets.symmetric(horizontal: 50),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))
                      ),
                    ),

                    ElevatedButton(
                      onPressed: (){
                        _update(nameController.text,agencynameController.text,placeController.text,phonenumberController.text);
                      },
                      child: Text("EDIT",style: TextStyle(fontSize: 15, letterSpacing: 2, color: Colors.white),),
                      style: ElevatedButton.styleFrom(
                          primary: Colors.blue,
                          padding: EdgeInsets.symmetric(horizontal: 50),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),

      );
    }

  Widget buildTextField(String labelText,TextEditingController controller){
    return Padding(
      padding: EdgeInsets.only(bottom: 30),
      child: TextFormField(
        controller: controller,
        //obscureText: isPasswordTextField ? isObscurePassword: false,
        decoration: InputDecoration(
          // suffixIcon: isPasswordTextField ?
          //     IconButton(
          //         onPressed: () {
          //           setState(() {
          //             isObscurePassword=!isObscurePassword;
          //           });
          //         },
          //         icon: Icon(Icons.remove_red_eye,color: Colors.grey,),
          //     ):null,
          contentPadding: EdgeInsets.only(bottom: 5),
          labelText: labelText,
          labelStyle: TextStyle(fontSize: 18,color: Colors.blue),
          floatingLabelBehavior: FloatingLabelBehavior.always,

          // hintText: controller,
          // hintStyle: TextStyle(
          //   fontSize: 16,
          //   fontWeight: FontWeight.bold,
          //   color: Colors.grey
          // )

        ),
      ),
    );
  }

  static ClassNotify() {}
}





