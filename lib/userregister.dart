import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:industrialvisit/login.dart';
import 'api.dart';

class userregister extends StatefulWidget {
  const userregister({Key? key}) : super(key: key);

  @override
  State<userregister> createState() => _userregisterState();
}

class _userregisterState extends State<userregister> {
  bool _isLoading=false;
  final _formKey = GlobalKey<FormState>();
  bool _obscureText = true;
  TextEditingController namecontroller =TextEditingController();
  TextEditingController addresscontroller = TextEditingController();
  TextEditingController collegenamecontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController phonenumbercontroller = TextEditingController();
  TextEditingController yearcontroller = TextEditingController();
  TextEditingController collegeplacecontroller = TextEditingController();
  TextEditingController collegenumbercontroller = TextEditingController();
  TextEditingController usernamecontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  void registerUser()async {
    setState(() {
      _isLoading = true;
    });
    var data = {
      "name": namecontroller.text.trim(),
      "address": addresscontroller.text.trim(),
      "collegename": collegenamecontroller.text.trim(),
      "email": emailcontroller.text.trim(),
      "phonenumber": phonenumbercontroller.text,
      "year": yearcontroller.text,
      "collegeplace": collegeplacecontroller.text.trim(),
      "collegenumber": collegenumbercontroller.text,
      "username": usernamecontroller.text,
      "password": passwordcontroller.text,
    };
    print("user data${data}");
    var res = await Api().authData(data,'/api/user_register');
    var body = json.decode(res.body);
    print('body${body}');
    if(body['success']==true)
    {
      Fluttertoast.showToast(
        msg: body['message'].toString(),
        backgroundColor: Colors.grey,
      );

      Navigator.push(context, MaterialPageRoute(builder: (context)=>login()));

    }
    else
    {
      Fluttertoast.showToast(
        msg: body['message'].toString(),
        backgroundColor: Colors.grey,
      );

    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Registration"),
        backgroundColor: Colors.pinkAccent,
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          autovalidateMode: AutovalidateMode.always,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "REGISTER HERE!",
                style: TextStyle(color: Colors.black),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: TextFormField(
                  validator: (value){
                    if (value == null || value.isEmpty){
                  return 'please enter some text';
                    }
                    return null;
                  },
                  controller: namecontroller,
                  decoration: InputDecoration(
                    labelText: "name",
                    hintText: "Enter Your Name",
                    prefixIcon: Icon(Icons.mail),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),),
                  ),
                ),
              ),
              Padding(
                  padding: const EdgeInsets.all(8),
                  child:TextFormField(
                    validator: (value){
                      if (value == null || value.isEmpty){
                        return 'please enter some text';
                      }
                      return null;
                    },
                    controller: addresscontroller,
                    decoration: InputDecoration(
                      labelText: "address",
                      hintText: "Enter Your Address",
                      prefixIcon: Icon(Icons.location_on),
                      border: OutlineInputBorder(

                          borderRadius: BorderRadius.circular(30)),
                    ),
                  )),
              Padding(
                  padding: const EdgeInsets.all(8),
                  child: TextFormField(
                    validator: (value){
                      if (value == null || value.isEmpty){
                        return 'please enter some text';
                      }
                      return null;
                    },
                    controller: usernamecontroller,
                    decoration: InputDecoration(
                      labelText: "username",
                      hintText: "Enter Your Username",
                      prefixIcon: Icon(Icons.person),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30)),
                    ),
                  )),
              Padding(
                  padding: const EdgeInsets.all(8),
                  child: TextFormField(
                    validator: (valuePass) {
                      if(valuePass!.isEmpty){
                        return 'Please enter your password';
                      }
                      else if(valuePass.length<6){
                        return 'Password is too short';
                      }
                      else
                        {
                          return null;
                        }
                    },
                    obscureText: _obscureText,
                    controller: passwordcontroller,
                    decoration: InputDecoration(
                      labelText: "Password",
                      hintText: "Password",
                      prefixIcon: Icon(Icons.lock),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30)),
                    ),
                  )
              ),
              Card(

                  margin: EdgeInsets.all(8),
                  child: TextFormField(
                    validator: (valueConPass){
                      if (valueConPass!.isEmpty){
                        return 'Please confirm your Password';
                      }
                      else if (valueConPass.length<6){
                        return 'Please check your password';

                      }
                      else if (valueConPass == passwordcontroller){
                        return null;
                      }
                    },
                    obscureText: _obscureText,
                    decoration: InputDecoration(
                      labelText: "confirm password",
                      hintText: "confirm password",

                      prefixIcon: Icon(Icons.lock),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30)),
                    ),
                  )),
              Padding(
                  padding: const EdgeInsets.all(8),
                  child: TextFormField(
    validator: (valueMail) {
    if (valueMail!.isEmpty) {
    return 'Please enter Email Id';
    }

    RegExp email = new RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    if (email.hasMatch(valueMail)) {
      return null;
    } else {
      return 'Invalid Email Id';
    }
    },
                    keyboardType: TextInputType.emailAddress,
controller: emailcontroller,
                    decoration: InputDecoration(
                      labelText: "email",
                      hintText: "email",
                      prefixIcon: Icon(Icons.mail),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30)),
                    ),
                  )),
              Padding(
                  padding: const EdgeInsets.all(8),
                  child: TextFormField(
                    validator: (value){
                      if (value!.isEmpty){
                        return "Please enter Mobile Number";

                      }
                      RegExp number = new RegExp(r'(^(?:[+0]9)?[0-9]{10,12}$)');

                      if (number.hasMatch(value)) {
                    return null;
      }
                      else {
    return 'Invalid Mobile Number';
    }
    },
    keyboardType: TextInputType.number,
                    controller: phonenumbercontroller,
                    decoration: InputDecoration(
                      labelText: "phone number",
                      hintText: "phone number",
                      labelStyle: TextStyle(fontSize: 15,color: Colors.black),
                      prefixIcon: Icon(Icons.phone_android),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30)),
                    ),
                  )),
              Padding(
                  padding: const EdgeInsets.all(8),
                  child: TextFormField(
                    validator: (value){
                      if (value == null || value.isEmpty){
                        return 'please enter some text';
                      }
                      return null;
                    },
                    controller: collegenamecontroller,
                    decoration: InputDecoration(
                      labelText: "college name",
                      hintText: "college name",
                      prefixIcon: Icon(Icons.drive_file_rename_outline),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30)),
                    ),
                  )),
              Padding(
                  padding: const EdgeInsets.all(8),
                  child: TextFormField(
                    validator: (value){
                      if (value!.isEmpty){
                        return "Please enter college Number";

                      }
                      RegExp number = new RegExp(r'(^(?:[+0]9)?[0-9]{10,12}$)');

                      if (number.hasMatch(value)) {
                        return null;
                      }
                      else {
                        return 'Invalid College Number';
                      }
                    },
                    keyboardType: TextInputType.number,
                    controller: collegenumbercontroller,
                    decoration: InputDecoration(
                      labelText: " college number",
                      hintText: "college number",
                      prefixIcon: Icon(Icons.phone),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30)),
                    ),
                  )),
              Padding(
                  padding: const EdgeInsets.all(8),
                  child: TextFormField(
                    validator: (valuePass) {
                      if(valuePass!.isEmpty){
                        return 'Please enter your year';
                      }
                      else if(valuePass.length<4){

                      }
                      else
                      {
                        return null;
                      }
                    },
                    controller: yearcontroller,
                    decoration: InputDecoration(
                      labelText: " year",
                      hintText: "year",
                      prefixIcon: Icon(Icons.calendar_month),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30)),
                    ),
                  )),
              Padding(
                  padding: const EdgeInsets.all(8),
                  child:TextFormField(
                    validator: (value){
                      if (value == null || value.isEmpty){
                        return 'please enter some text';
                      }
                      return null;
                    },
                    controller: collegeplacecontroller,
                    decoration: InputDecoration(
                      labelText: "college place",
                      hintText: "college place",
                      prefixIcon: Icon(Icons.place),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30)),
                    ),
                  )),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                registerUser();
                },
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50.0)),
                    primary: Colors.pinkAccent,
                    fixedSize: Size(300, 50)),
                child: Text(
                  'Register',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              SizedBox(
                height: 30.0,
              ),
              Row(
                children: [
                  const Text(
                    'Already have an account?',
                    style: TextStyle(fontSize: 16),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginPage(),
                          ));
                    },
                    child: const Text(
                      'login',
                      style: TextStyle(color: Colors.pinkAccent, fontSize: 16),
                    ),
                  ),
                ],
                mainAxisAlignment: MainAxisAlignment.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
