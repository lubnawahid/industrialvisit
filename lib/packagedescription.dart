import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:industrialvisit/booking.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'api.dart';

class packagedescription extends StatefulWidget {
  final int id;
   packagedescription({required this.id});


  @override
  State<packagedescription> createState() => _packagedescriptionState();
}

class _packagedescriptionState extends State<packagedescription> {
  bool   _isLoading = false;
  late SharedPreferences localStorage;
String price='';
  TextEditingController packagenameController=TextEditingController();

  TextEditingController companynameController=TextEditingController();
  TextEditingController companydescriptionController=TextEditingController();
  TextEditingController packagedateController=TextEditingController();
  TextEditingController packagetimeController=TextEditingController();
  TextEditingController accommodationController=TextEditingController();
  TextEditingController fooddetailsController=TextEditingController();
  TextEditingController guidedetailsController=TextEditingController();
  TextEditingController packagecostController = TextEditingController();

var packagename,companyname,companydescription,packagedate,packagetime,accommodation,fooddetails,guidedetails,packagecost;




  Future<void> _viewPro() async {
    int id = widget.id;
    var res = await Api().getData('/api/packages_single_view/' + id.toString());
    var body = json.decode(res.body);
    print(body);
    setState(() {

      packagename = body['data']['packagename'];
      companyname = body['data']['companyname'];
      companydescription = body['data']['companydescription'];
      packagedate = body['data']['packagedate'];
      packagetime = body['data']['packagetime'];
      accommodation = body['data']['accommodation'];
      fooddetails = body['data']['fooddetails'];
      guidedetails = body['data']['guidedetails'];
      packagecost = body['data']['packagecost'];
      packagenameController.text = packagename;
      companynameController.text=companyname;
      companydescriptionController.text=companydescription;
      packagedateController.text = packagedate;
      packagetimeController.text = packagetime;
      accommodationController.text = accommodation;
      fooddetailsController.text = fooddetails;
      guidedetailsController.text = guidedetails;
      packagecostController.text = packagecost;

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
        backgroundColor: Colors.grey[200],
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
                       "Package Name",
                       style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                     ),
                     SizedBox(
                     height: 20,
                     ),

                    Text(packagename,
                      style: TextStyle(
                        fontSize: 15,
                      ),
                     ),

                     SizedBox(
                      height: 40,
                     ),
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

                    Text(
                       companyname,
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
style: TextStyle(fontSize: 15),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Text(
                      "Package Time",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),

                    Text(
                      packagetime,
                        style: TextStyle(
                          fontSize: 15,
                    ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Text(
                      "Accommodation",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),

                    Text(
                      accommodation,
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Text(
                      "Food Details",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),

                    Text(
                      fooddetails,
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),

                    SizedBox(
                      height: 40,
                    ),
                    Text(
                      "Guide Details",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),

                    Text(
                      guidedetails,
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Text(
                      "Package Cost",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),

                    Text(
                      packagecost,
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                    SizedBox(height: 40,),
                    Center(
                      child: ElevatedButton(
                        style: style,
                        onPressed: () {
                          int id= widget.id;
                          Navigator.push(context, MaterialPageRoute(builder: (context) => booking(id : id)));
                        },
                        child: const Text('Book Now'),
                      ),
                    ),

                  ]
              ),
            ),
          ),
        )
    );
  }
}