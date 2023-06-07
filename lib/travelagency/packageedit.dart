import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:industrialvisit/packages.dart';
import 'package:industrialvisit/travelagency/managepackages.dart';
import 'package:industrialvisit/travelagency/packageedit.dart';
//import 'package:industrialvisit/travelagency/packageedit.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../api.dart';

class packageedit extends StatefulWidget {
  final int id;
      packageedit({required this.id});

  @override
  State<packageedit> createState() => _packageeditState();
}

class _packageeditState extends State<packageedit> {

  DateTime selectedDate = DateTime.now();

  //late SharedPreferences prefs;
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

  late int id;
  String companyname = '';
  String companydescription = '';
  String packagedate = '';
  String packagetime = '';

  TextEditingController companynameController = TextEditingController();

  TextEditingController companydescriptionController = TextEditingController();
  TextEditingController packagedateController = TextEditingController();

  get nameController => null;
  late SharedPreferences prefs;
  TextEditingController packagetimeController = TextEditingController();

  void initState() {
    // TODO: implement initState
    super.initState();
    _viewPro();
  }

  int currentTab = 2;

  Future<void> _viewPro() async {
    prefs = await SharedPreferences.getInstance();
    int id = widget.id;
    // print('login_idupdate ${id }');
    var res = await Api().getData('/api/packages_single_view/' + id.toString());
    var body = json.decode(res.body);
    print(body);
    setState(() {
      companyname = body['data']['companyname'];
      companydescription = body['data']['companydescription'];
      packagedate = body['data']['packagedate'];
      packagetime = body['data']['packagetime'];

      companynameController.text = companyname;
      companydescriptionController.text = companydescription;
      packagedateController.text = packagedate;
      packagetimeController.text = packagetime;
    });
  }

  Future<void> _update(String companyname, String companydescription, String packagedate, String packagetime) async {
    prefs = await SharedPreferences.getInstance();
    int id =widget.id;
    print(id);
    var uri = Uri.parse(Api().url + '/api/packages_update/' +id.toString()); // Replace with your API endpoint
    var request = http.MultipartRequest('PUT', uri);
    request.fields['companyname'] = companyname;
    request.fields['companydescription'] = companydescription;
    request.fields['packagedate'] = startDate;
    request.fields['packagetime'] = packagetime;
    print(request.fields);
    final response = await request.send();
    print(response);

    if (response.statusCode == 200) {
      print('Package Updated successfully');
      Navigator.push(
          this.context,
          MaterialPageRoute(builder: (context) => managepackages()));
    } else {
      print('Error Updating packages. Status code: ${response.statusCode}');
    }
  }
  _deleteData(int id) async {
    var res = await Api().deleteData('/api/delete_packages/'+ id.toString());
    if (res.statusCode == 200) {
      setState(() {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => managepackages()));
        Fluttertoast.showToast(
          msg: "Package Deleted Successfully",
          backgroundColor: Colors.grey,
        );
      });
    } else {
      setState(() {
        Fluttertoast.showToast(
          msg: "Currently there is no data available",
          backgroundColor: Colors.grey,
        );
      });
    }
  }


  Widget currentScreen = packages();

  @override
  Widget build(BuildContext context) {
    // var companynameController;
    return Scaffold(

      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(

        elevation: 0,
        brightness: Brightness.light,
        backgroundColor: Colors.pinkAccent,
        title: Text('Edit Packages'),
        leading:
        IconButton(onPressed: () {
          Navigator.pop(context);
        }, icon: Icon(Icons.arrow_back_ios, size: 20, color: Colors.black,)),
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            height: MediaQuery
                .of(context)
                .size
                .height,
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    // Column(
                    //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    //   children: [
                    //     Text('Package Details'),
                    //   ],
                    // ),
                    SizedBox(height: 20,),
                    Container(
                      padding: const EdgeInsets.all(10),
                      child: TextField(
                        controller: companynameController,
                        decoration: const InputDecoration(

                            border: OutlineInputBorder(),

                            hintText: 'companyname'
                        ),
                      ),
                    ),

                    Container(
                      padding: const EdgeInsets.all(10),
                      child: TextField(
                        controller: companydescriptionController,
                        maxLines: 5,
                        decoration: const InputDecoration(

                          border: OutlineInputBorder(),

                           hintText: 'companydescription'

                        ),
                      ),

                    ),
                    // Container(
                    //
                    //   padding: const EdgeInsets.all(20.0),
                    //   child: TextField(
                    //     controller: packagetimeController,
                    //     maxLines: 5,
                    //     decoration: const InputDecoration(
                    //       border: OutlineInputBorder(),
                    //     ),
                    //   ),
                    // ),
                    Container(

                      padding: const EdgeInsets.all(20.0),

                      child: Row(

                        children: [
                          ElevatedButton(
                            onPressed: () => _selectDate(context),
                            child: const Text('Select date'),
                          ), SizedBox(width: 20,),
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
                                '${selectedDate.year}-${selectedDate
                                    .month}-${selectedDate.day}',
                                style: TextStyle(
                                    fontSize: 16, color: Colors.black38),
                              ),
                            ),
                          ),

                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(10),
                      child: TextFormField(
                        controller: packagetimeController,
                        decoration: const InputDecoration(

                          border: OutlineInputBorder(),

                          hintText: 'Time 10 AM',
                        ),
                      ),
                    ),
                    SizedBox(height: 20,),


                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 130.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          _update(companynameController.text,companydescriptionController.text , packagedateController.text, packagetimeController.text);
                          //Navigator.push(context, MaterialPageRoute(builder: (context) => managepackages()));
                        },
                        child: Text("Update", style: TextStyle(fontSize: 15,
                            letterSpacing: 2,
                            color: Colors.white),),
                        style: ElevatedButton.styleFrom(
                            primary: Colors.blue,
                            padding: EdgeInsets.symmetric(
                              horizontal: 50, vertical: 25,),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20))
                        ),
                      ),

                      ElevatedButton(
                        onPressed: () {
                       _deleteData(widget.id);
                        },
                        child: Text("Delete", style: TextStyle(fontSize: 15,
                            letterSpacing: 2,
                            color: Colors.white),),
                        style: ElevatedButton.styleFrom(
                            primary: Colors.blue,
                            padding: EdgeInsets.symmetric(
                              horizontal: 50, vertical: 25,),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20))
                        ),
                      ),


                    ],
                  ),
                ),
              ],

            ),

          ),

        ),

      ),);
  }


  Widget makeInput({label, obsureText = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w400,
            color: Colors.black87
        ),),
        SizedBox(height: 5,),
        TextField(
          obscureText: obsureText,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.grey,
              ),
            ),
            border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey)
            ),
          ),
        ),
        SizedBox(height: 30,)

      ],
    );
  }
}