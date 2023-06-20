import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../api.dart';
import '../userpackagebooking.dart';

class viewusercreatedpackages extends StatefulWidget {
  final int id;
  const viewusercreatedpackages({required this.id});
 // const viewusercreatedpackages({Key? key}) : super(key: key);

  @override
  State<viewusercreatedpackages> createState() => _viewusercreatedpackagesState();
}

class _viewusercreatedpackagesState extends State<viewusercreatedpackages> {
  bool   _isLoading = false;
  late SharedPreferences localStorage;
  TextEditingController companynameController=TextEditingController();
  TextEditingController companydescriptionController=TextEditingController();
  TextEditingController placeController=TextEditingController();
  TextEditingController dateController=TextEditingController();
  TextEditingController daysController=TextEditingController();
  var companyname,companydescription,place,date,days;



  Future<void> _viewPro() async {
    int id = widget.id;
    var res = await Api()
        .getData('/api/user_packages_single_view/' + id.toString());
    var body = json.decode(res.body);
    print(body);
    setState(() {


      companyname = body['data']['companyname'];
      companydescription = body['data']['companydescription'];
      date = body['data']['date'];
      place = body['data']['place'];

      days= body['data']['days'];




      companynameController.text=companyname;
      companydescriptionController.text=companydescription;
      dateController.text = date;
      placeController.text = place;

      daysController.text = days;

    });
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _viewPro();
  }
  Widget build(BuildContext context) {
    var style;
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading:
          IconButton(onPressed: () {
            Navigator.pop(context);
          }, icon: Icon(Icons.arrow_back_ios, size: 20, color: Colors.black,)),

          elevation: 0,
          centerTitle: true,
          title: Text(
            'Package Details',
            style: TextStyle(
              color: Colors.black,
            ),
          ),

        ),
        body: SingleChildScrollView(
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50),
                  topRight: Radius.circular(50),
                )
            ),
            child: Padding(
              padding: EdgeInsets.all(40),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    SizedBox(height: 10,),
                    Text(
                      "Company Name",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),

                    Text(companyname,
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),

                    SizedBox(
                      height: 40,
                    ),
                    Text(
                      "Company Description",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),

                    Text(
                      companydescription,
                    ),

                    SizedBox(
                      height: 40,
                    ),
                    Text(
                      "Place",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),

                    Text(
                      place,
                      style: TextStyle(fontSize: 15),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Text(
                      "Date",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),

                    Text(
                      date,
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Text(
                      "Days",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),

                    Text(
                      days,
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                    // SizedBox(
                    //   height: 40,
                    // ),
                    // Text(
                    //   "Food Details",
                    //   style: TextStyle(
                    //     fontSize: 18,
                    //     fontWeight: FontWeight.bold,
                    //   ),
                    // ),
                    // SizedBox(
                    //   height: 15,
                    // ),
                    //
                    // Text(
                    //   fooddetails,
                    //   style: TextStyle(
                    //     fontSize: 15,
                    //   ),
                    // ),

                    // SizedBox(
                    //   height: 40,
                    // ),
                    // Text(
                    //   "Guide Details",
                    //   style: TextStyle(
                    //     fontSize: 18,
                    //     fontWeight: FontWeight.bold,
                    //   ),
                    // ),
                    // SizedBox(
                    //   height: 15,
                    // ),
                    //
                    // Text(
                    //   guidedetails,
                    //   style: TextStyle(
                    //     fontSize: 15,
                    //   ),
                    // ),
                    // SizedBox(
                    //   height: 40,
                    // ),
                    // Text(
                    //   "Package Cost",
                    //   style: TextStyle(
                    //     fontSize: 18,
                    //     fontWeight: FontWeight.bold,
                    //   ),
                    // ),
                    // SizedBox(
                    //   height: 15,
                    // ),
                    //
                    // Text(
                    //   packagecost,
                    //   style: TextStyle(
                    //     fontSize: 15,
                    //   ),
                    // ),
                    SizedBox(height:120,),
                    // Center(
                    //   child: ElevatedButton(
                    //     style: style,
                    //     onPressed: () {
                    //       int id= widget.id;
                    //       Navigator.push(context, MaterialPageRoute(builder: (context) => usercreatedbooking(id: id)));
                    //     },
                    //     child: const Text('Book Now'),
                    //   ),
                    // ),

                  ]
              ),
            ),
          ),
        )
    );
  }
}
