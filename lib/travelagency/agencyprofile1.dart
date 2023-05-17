import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../agencyprofile.dart';
import '../agencyprofile.dart';
import '../agencyprofile.dart';
import '../welcome.dart';
import 'homescreen.dart';


class agencyprofile1 extends StatefulWidget {
  const agencyprofile1({Key? key}) : super(key: key);

  @override
  State<agencyprofile1> createState() => _agencyprofileState1();
}

class _agencyprofileState1 extends State<agencyprofile1> {

  bool isObscurePassword = true;

  int currentTab = 2;
  final List<Widget> screen = [

    agencyprofile1(),

  ];

  Widget currentScreen = agencyprofile1();

  TextEditingController unameController = TextEditingController();
  TextEditingController plcController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController pwdController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(


      appBar: AppBar(
        title: Text("Profile"),
        actions: [
          IconButton(
            tooltip: "Logout",
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => welcome()));
            },
            icon: Icon(
              Icons.logout,
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
                            image: NetworkImage(
                                ""
                            ),
                          )
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                  width: 4,
                                  color: Colors.white
                              ),
                              color: Colors.blue
                          ),
                          child: Icon(
                            Icons.edit,
                            color: Colors.white,
                          )
                      ),
                    ),


                  ],
                ),
              ),
              SizedBox(height: 30,),

              buildTextField(" name", "raghu PS", false),
              buildTextField("adress", "Ps", false),
              buildTextField("agencyname", "sarikha agency", false),


              buildTextField("Email", "Artistps@gmail.com", false),
              buildTextField("Password", "9898934", true),
              buildTextField("Phone number", "9897458711", false),

              SizedBox(height: 30,),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  OutlinedButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(
                          builder: (context) => agencyprofile()));
                    },
                    child: Text("CANCEL", style: TextStyle(
                        fontSize: 15,
                        letterSpacing: 2,
                        color: Colors.black
                    )),
                    style: OutlinedButton.styleFrom(
                        padding: EdgeInsets.symmetric(horizontal: 50),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20))
                    ),
                  ),

                  ElevatedButton(
                    onPressed: () {},
                    child: Text("SUBMIT", style: TextStyle(
                        fontSize: 15, letterSpacing: 2, color: Colors.white),),
                    style: ElevatedButton.styleFrom(
                        primary: Colors.blue,
                        padding: EdgeInsets.symmetric(horizontal: 50),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20))
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

  Widget buildTextField(String labelText, String placeholder,
      bool isPasswordTextField) {
    return Padding(
      padding: EdgeInsets.only(bottom: 30),
      child: TextFormField(
        obscureText: isPasswordTextField ? isObscurePassword : false,
        decoration: InputDecoration(
            suffixIcon: isPasswordTextField ?
            IconButton(
              onPressed: () {
                setState(() {
                  isObscurePassword = !isObscurePassword;
                });
              },
              icon: Icon(Icons.remove_red_eye, color: Colors.grey,),
            ) : null,
            contentPadding: EdgeInsets.only(bottom: 5),
            labelText: labelText,
            floatingLabelBehavior: FloatingLabelBehavior.always,
            hintText: placeholder,
            hintStyle: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.grey
            )

        ),
      ),
    );
  }
}

