import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'api.dart';
import 'booking1.dart';

class usercreatedbooking extends StatefulWidget {

  final int id;
  const usercreatedbooking({required this.id}) ;

  @override
  State<usercreatedbooking> createState() => _usercreatedbookingState();
}

class _usercreatedbookingState extends State<usercreatedbooking> {

  String name = "";
  String collegename = "";
  String numberofstudents = "";
  late int user_id;
  late SharedPreferences localStorage;
  bool  _isLoading = false;
  TextEditingController namecontroller = TextEditingController();
  TextEditingController collegenamecontroller = TextEditingController();
  TextEditingController numberofstudentscontroller = TextEditingController();
  @override
  initState() {
    super.initState();
    _viewPro();
  }
  Future<void> _viewPro() async {
    int id = widget.id;
    print("id${id}");
    var res = await Api().getData('/api/user_packages_single_view/' + id.toString());
    var body = json.decode(res.body);
    print(body);
    setState(() {
      name = body['data']['name'];
      collegename = body['data']['collegename'];
      // place = body['data']['place'];
      numberofstudents = body['data']['numberofstudents'];

    });
  }
  Future<void> userbookpackage() async {
    setState(() {
      _isLoading = true;
    });
    int id = widget.id;
    localStorage = await SharedPreferences.getInstance();
    user_id = (localStorage.getInt('user_id') ?? 0);
    var data = {
      "user": user_id.toString(),
      "packages":id.toString(),

      "collegename":collegenamecontroller.text,
      "numberofstudents":numberofstudentscontroller.text,
      "name":namecontroller.text,

    };
    print(data);
    var res = await Api().authData(data,'/api/usercreatedpackage_booking');
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
      SizedBox(
        height: 20,
      ),
      Container(
          height: 50,
          padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
          child: ElevatedButton(
            child: const Text('Continue'),
            onPressed: () {
              userbookpackage();

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
