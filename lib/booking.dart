import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'api.dart';
import 'booking1.dart';

class booking extends StatefulWidget {
  final int id;
  const booking({required this.id});


  @override
  State<booking> createState() => _bookingState();
}

class _bookingState extends State<booking> {
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
  String name = "";
  String collegename = "";
  String bookingdate = "";
 // String place = "";
  String numberofstudents = "";
  late int user_id;
  late SharedPreferences localStorage;
  bool  _isLoading = false;
  TextEditingController namecontroller = TextEditingController();
  TextEditingController collegenamecontroller = TextEditingController();
  TextEditingController bookingdatecontroller = TextEditingController();
  TextEditingController numberofstudentscontroller = TextEditingController();



  @override
  initState() {
    super.initState();
    _viewPro();
  }
  Future<void> _viewPro() async {
    int id = widget.id;
    print("id${id}");
    var res = await Api().getData('/api/packages_single_view/' + id.toString());
    var body = json.decode(res.body);
    print(body);
    setState(() {
      name = body['data']['name'];
      collegename = body['data']['collegename'];
      bookingdate = body['data']['bookingdate'];
     // place = body['data']['place'];
      numberofstudents = body['data']['numberofstudents'];

    });
  }

  Future<void> bookpackage() async {
    setState(() {
      _isLoading = true;
    });
    int id = widget.id;
    localStorage = await SharedPreferences.getInstance();
    user_id = (localStorage.getInt('user_id') ?? 0);
    var data = {
      "user": user_id.toString(),
      "packages":id.toString(),
      "bookingdate":startDate,
"collegename":collegenamecontroller.text,
      "numberofstudents":numberofstudentscontroller.text,
      "name":namecontroller.text,

    };
    print(data);
    var res = await Api().authData(data,'/api/package_booking');
    var body = json.decode(res.body);
    print(body);
    if(body['success']==true)
    {
      print(body);


      Navigator.push(context, MaterialPageRoute(builder: (context)=>booking1()));
      Fluttertoast.showToast(
        msg: body['message'].toString(),
        backgroundColor: Colors.grey,
      );
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
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        brightness: Brightness.light,
        backgroundColor: Colors.blue,
        title: Text('Booking'),

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
                      Text('Book Here!'),
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
                      controller: namecontroller,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Name',
                          hintText: 'Name'),
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
                      controller: collegenamecontroller,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'College name',
                        hintText: 'College name',
                      ),
                    ),
                  ),
                  // Container(
                  //   padding: const EdgeInsets.all(10),
                  //   child: TextFormField(
                  //     validator: (value) {
                  //       if (value == null || value.isEmpty) {
                  //         return 'please enter some text';
                  //       }
                  //       return null;
                  //     },
                  //     controller: companydescriptioncontroller,
                  //     decoration: const InputDecoration(
                  //       border: OutlineInputBorder(),
                  //       labelText: 'Company Description',
                  //       hintText: 'Company Description',
                  //     ),
                  //   ),
                  // ),

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
                  // Container(
                  //   padding: const EdgeInsets.all(10),
                  //   child: TextFormField(
                  //     validator: (value) {
                  //       if (value == null || value.isEmpty) {
                  //         return 'please enter date';
                  //       }
                  //       return null;
                  //     },
                  //     controller: packagedatecontroller,
                  //     decoration: const InputDecoration(
                  //         border: OutlineInputBorder(),
                  //         labelText: 'Package Date',
                  //         hintText: 'Package Date'),
                  //   ),
                  // ),
                  Container(
                    padding: const EdgeInsets.all(10),
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'please enter time';
                        }
                        return null;
                      },
                      controller: numberofstudentscontroller,
                      decoration: const InputDecoration(

                        border: OutlineInputBorder(),
                        labelText: 'Number of Students',
                        hintText: 'Number of Students',
                      ),
                    ),
                  ),
                  // Container(
                  //   padding: const EdgeInsets.all(10),
                  //   child: TextFormField(
                  //     validator: (value) {
                  //       if (value == null || value.isEmpty) {
                  //         return 'please enter some text';
                  //       }
                  //       return null;
                  //     },
                  //     controller: accommodationcontroller,
                  //     decoration: const InputDecoration(
                  //       border: OutlineInputBorder(),
                  //       labelText: 'Accommodation',
                  //       hintText: 'Accommodation',
                  //     ),
                  //   ),
                  // ),
                  // Container(
                  //   padding: const EdgeInsets.all(10),
                  //   child: TextFormField(
                  //     validator: (value) {
                  //       if (value == null || value.isEmpty) {
                  //         return 'please enter some text';
                  //       }
                  //       return null;
                  //     },
                  //     controller: fooddetailscontroller,
                  //     decoration: const InputDecoration(
                  //       border: OutlineInputBorder(),
                  //       labelText: 'Food Details',
                  //       hintText: 'Food Details',
                  //     ),
                  //   ),
                  // ),
                  // Container(
                  //   padding: const EdgeInsets.all(10),
                  //   child: TextFormField(
                  //     validator: (value) {
                  //       if (value == null || value.isEmpty) {
                  //         return 'please enter some text';
                  //       }
                  //       return null;
                  //     },
                  //     controller: guidedetailscontroller,
                  //     decoration: const InputDecoration(
                  //       border: OutlineInputBorder(),
                  //       labelText: 'Guide Details',
                  //       hintText: 'Guide Details',
                  //     ),
                  //   ),
                  // ),
                  // Container(
                  //   padding: const EdgeInsets.all(10),
                  //   child: TextFormField(
                  //     validator: (value) {
                  //       if (value == null || value.isEmpty) {
                  //         return 'please enter cost';
                  //       }
                  //       return null;
                  //     },
                  //     controller: packagecostcontroller,
                  //     keyboardType: TextInputType.number,
                  //     decoration: const InputDecoration(
                  //       border: OutlineInputBorder(),
                  //       labelText: 'Package Cost',
                  //       hintText: 'Package Cost',
                  //     ),
                  //   ),
                  // ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                      height: 50,
                      padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                      child: ElevatedButton(
                        child: const Text('Continue'),
                        onPressed: () {
                          bookpackage();

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