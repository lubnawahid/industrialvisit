import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:industrialvisit/travelagency/managepackages.dart';
import 'package:industrialvisit/travelagency/packageedit.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '/api.dart';

class packageadd extends StatefulWidget {
  const packageadd({Key? key}) : super(key: key);

  @override
  State<packageadd> createState() => _packageaddState();
}

class _packageaddState extends State<packageadd> {

  late SharedPreferences localStrorage;
  late int travelagency;
  get nameController => null;
  bool _isLoading = false;
  final _formKey = GlobalKey<FormState>();
  bool _obscureText = true;

  TextEditingController packagenamecontroller = TextEditingController();
  TextEditingController companynamecontroller = TextEditingController();
  TextEditingController companydescriptioncontroller = TextEditingController();
  TextEditingController packagedatecontroller = TextEditingController();
  TextEditingController packagetimecontroller = TextEditingController();
  TextEditingController accommodationcontroller = TextEditingController();
  TextEditingController fooddetailscontroller = TextEditingController();
  TextEditingController guidedetailscontroller = TextEditingController();
  TextEditingController packagecostcontroller = TextEditingController();
  TextEditingController travelagencycontroller = TextEditingController();

  void addPackages() async {
    localStrorage = await SharedPreferences.getInstance();
    travelagency = (localStrorage.getInt('user_id') ?? 0);
    print('agentId ${travelagency}');
    setState(() {
      _isLoading = true;
    });
    var data = {
      "packagename": packagenamecontroller.text.trim(),
      "companyname": companynamecontroller.text.trim(),
      "companydescription": companydescriptioncontroller.text.trim(),
      "packagedate": packagedatecontroller.text,
      "packagetime": packagetimecontroller.text,
      "accommodation": accommodationcontroller.text.trim(),
      "fooddetails": fooddetailscontroller.text.trim(),
      "guidedetails": guidedetailscontroller.text.trim(),
      "packagecost": packagecostcontroller.text,
      "travelagency":travelagency.toString()
    };

    print("package data${data}");
    var res = await Api().authData(data, '/api/packages');
    var body = json.decode(res.body);
    print('body${body}');
    if (body['success'] == true) {
      Fluttertoast.showToast(
        msg: body['message'].toString(),
        backgroundColor: Colors.grey,
      );

      Navigator.push(
          context, MaterialPageRoute(builder: (context) =>managepackages()));
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
        elevation: 0,
        brightness: Brightness.light,
        backgroundColor: Colors.pinkAccent,
        title: Text('Add Packages'),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios,
              size: 20,
              color: Colors.black,
            )),
      ),
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
                      Text('Package Details'),
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
                      controller: packagenamecontroller,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Package Name',
                          hintText: 'Package Name'),
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
                      controller: companynamecontroller,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Company name',
                        hintText: 'Company name',
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
                          return 'please enter date';
                        }
                        return null;
                      },
                      controller: packagedatecontroller,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Package Date',
                          hintText: 'Package Date'),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(10),
                    child: TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'please enter time';
                        }
                        return null;
                      },
                      controller: packagetimecontroller,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Package Time',
                        hintText: 'Package Time',
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
                      controller: accommodationcontroller,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Accommodation',
                        hintText: 'Accommodation',
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
                      controller: fooddetailscontroller,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Food Details',
                        hintText: 'Food Details',
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
                      controller: guidedetailscontroller,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Guide Details',
                        hintText: 'Guide Details',
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(10),
                    child: TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'please enter cost';
                        }
                        return null;
                      },
                      controller: packagecostcontroller,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Package Cost',
                        hintText: 'Package Cost',
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
                        child: const Text('Submit'),
                        onPressed: () {
                          addPackages();

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
