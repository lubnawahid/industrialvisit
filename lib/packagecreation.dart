import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:industrialvisit/packagecreation1.dart';
import 'package:industrialvisit/packages.dart';
import 'package:industrialvisit/usercreatedpackages.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '/api.dart';

class packagecreation extends StatefulWidget {
  const packagecreation({Key? key}) : super(key: key);

  @override
  State<packagecreation> createState() => _packagecreationState();
}

class _packagecreationState extends State<packagecreation> {

  DateTime selectedDate = DateTime.now();
  late SharedPreferences prefs;
  late String startDate;
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime.now(),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        startDate =
        '${selectedDate.year}-${selectedDate.month}-${selectedDate.day}';
      });
    }
  }
  late SharedPreferences localStrorage;
  late int user;
  bool _isLoading = false;
  final _formKey = GlobalKey<FormState>();
  bool _obscureText = true;

  TextEditingController companynamecontroller = TextEditingController();
  TextEditingController companydescriptioncontroller = TextEditingController();
  TextEditingController placecontroller = TextEditingController();
  TextEditingController datecontroller = TextEditingController();
  TextEditingController dayscontroller = TextEditingController();
  TextEditingController pricecontroller = TextEditingController();
  void createPackages() async {
    localStrorage = await SharedPreferences.getInstance();
    user = (localStrorage.getInt('user_id') ?? 0);
    print('userId ${user}');
    setState(() {
      _isLoading = true;
    });
    var data = {

      "companyname": companynamecontroller.text.trim(),
      "companydescription":companydescriptioncontroller.text.trim(),
      "place": placecontroller.text.trim(),
      "days" : dayscontroller.text,
      "price":pricecontroller.text,
      "date": startDate,
      "user": user.toString(),

    };
    print("package data${data}");
    var res = await Api().authData(data, '/api/user_create_packages');
    var body = json.decode(res.body);
    print('body${body}');
    if (body['success'] == true) {
      Fluttertoast.showToast(
        msg: body['message'].toString(),
        backgroundColor: Colors.grey,
      );

      Navigator.push(
          context, MaterialPageRoute(builder: (context) =>usercreatedpackages()));
    } else {
      Fluttertoast.showToast(
        msg: body['message'].toString(),
        backgroundColor: Colors.grey,
      );
    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle:true,
        // elevation: 0,
        // brightness: Brightness.light,
        // backgroundColor: Colors.blue,
         title: Text('Create Packages'),
        // leading: IconButton(
        //     onPressed: () {
        //       Navigator.pop(context);
        //     },
        //     icon: Icon(
        //       Icons.arrow_back_ios,
        //       size: 20,
        //       color: Colors.black,
        //     )),
      ),
      //SizedBox(height: 20,),
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text('Comment Your Favourite Spot Here!'),
                    ],
                  ),
                  Container(
                    padding: const EdgeInsets.all(10),
                    child: TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'please enter some text';
                        }
                        return null;
                      },
                      controller: companynamecontroller,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Company Name',
                          hintText: 'Company Name'),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(10),
                    child: TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'please enter some text';
                        }
                        return null;
                      },
                      controller: companydescriptioncontroller,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Company Description',
                        hintText: 'Company Description',
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(10),
                    child: TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'please enter some text';
                        }
                        return null;
                      },
                      controller: placecontroller,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Place',
                        hintText: 'Place',
                      ),
                    ),
                  ),

                  Container(
                    padding:  const EdgeInsets.all(20.0),

                    child: Row(
                      children: [
                        ElevatedButton(
                          onPressed: () => _selectDate(context),
                          child: const Text('Select date'),

                        ),SizedBox(width: 20,),
                        Container(
                          height: 45,
                          width: 150,
                          margin: const EdgeInsets.all(15.0),
                          padding: const EdgeInsets.all(3.0),
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.black26)),
                          child: Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Text(
                              '${selectedDate.year}-${selectedDate.month}-${selectedDate.day}',
                              style: TextStyle(fontSize: 16, color: Colors.black38),
                            ),
                          ),
                        ),

                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(10),
                    child: TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'please enter days';
                        }
                        return null;
                      },
                      controller: dayscontroller,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Days',
                          hintText: 'Days'),
                    ),
                  ),
                   Container(
                    padding: const EdgeInsets.all(10),
                    child: TextFormField(
                       validator: (value) {
                         if (value == null || value.isEmpty) {
                          return 'please enter price';
                         }
                       return null;
                      },
                      controller: pricecontroller,
                       keyboardType: TextInputType.number,
                     decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                       labelText: 'Package Price',
                        hintText: 'Package Price',
                     ),
                    ),
                   ),




                  SizedBox(
                    height: 20,
                  ),
                  Container(
                      height: 50,

                      padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                      child: ElevatedButton(
                        child: const Text('Create'),
                        onPressed: () {
                          createPackages();

                          // print(nameController.text);
                          // var passwordController;
                          // print(passwordController.text);
                        },
                      )),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
