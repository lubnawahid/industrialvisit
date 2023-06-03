import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:industrialvisit/travelagency/packageedit.dart';
//import 'package:industrialvisit/travelagency/packageedit.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../api.dart';

class packageedit extends StatefulWidget {
  final int id;
      packageedit({required this.id});

  @override
  State<packageedit> createState() => _packageeditState();
}

class _packageeditState extends State<packageedit> {

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
  late int id;
  String companyname='';
  String companydescription='';
  String packagedate='';
  String packagetime='';
  get nameController => null;
  late SharedPreferences prefs;
  TextEditingController companynameController=TextEditingController();

  TextEditingController companydescriptionController=TextEditingController();
  TextEditingController packagedateController=TextEditingController();
  TextEditingController packagetimeController=TextEditingController();

  @override

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
    var res = await Api().getData('/api/packages_single_view/'+id.toString());
    var body = json.decode(res.body);
    print(body);
    setState(() {
      companyname = body['data']['companyname'];
      companydescription = body['data']['description'];
      packagedate = body['data']['packagedate'];
      packagetime = body['data']['packagetime'];

      companynameController.text = companyname;
      companydescriptionController.text= companydescription;
      packagedateController.text=packagedate;
      packagetimeController.text = packagetime;


    });
  }

      Widget build(BuildContext context) {

    return Scaffold(

      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(

        elevation: 0,
        brightness: Brightness.light,
        backgroundColor: Colors.pinkAccent,
        title:Text ('Add Packages'),
        leading:
        IconButton( onPressed: (){
          Navigator.pop(context);
        },icon:Icon(Icons.arrow_back_ios,size: 20,color: Colors.black,)),
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
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
                        controller: nameController,
                        decoration: const InputDecoration(

                            border: OutlineInputBorder(),

                            hintText: 'J V ELECTRONICS PVT Ltd'
                        ),
                      ),
                    ),

                    Container(
                      padding: const EdgeInsets.all(10),
                      child: TextField(
                        maxLines: 5,
                        controller: nameController,
                        decoration: const InputDecoration(

                          border: OutlineInputBorder(),

                          hintText: 'Started in the year 1991 in a small way, when acceptability of Small scale manufacturers to make high end products like relays was a challenge across the globe, JVS established itself by proving its excellence and commitment to inventing and producing products of great quality. JVS has since come a long way and is one of the leading relay manufacturers, supplying products in India and abroad. it is located in Banglore Mysore-NH,Bidadi,Ramangara,Banglore.'
                          ,
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
                                '${selectedDate.day}-${selectedDate.month}-${selectedDate.year}',
                                style: TextStyle(fontSize: 16, color: Colors.black38),
                              ),
                            ),
                          ),

                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(10),
                      child: TextField(
                        controller: nameController,
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
                  padding: const EdgeInsets.only(bottom: 80.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton(
                        onPressed: (){},
                        child: Text("Update",style: TextStyle(fontSize: 15, letterSpacing: 2, color: Colors.white),),
                        style: ElevatedButton.styleFrom(
                            primary: Colors.blue,
                            padding: EdgeInsets.symmetric(horizontal: 50,vertical: 25,),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))
                        ),
                      ),

                      ElevatedButton(
                        onPressed: (){},
                        child: Text("Delete",style: TextStyle(fontSize: 15, letterSpacing: 2, color: Colors.white),),
                        style: ElevatedButton.styleFrom(
                            primary: Colors.blue,
                            padding: EdgeInsets.symmetric(horizontal: 50,vertical: 25,),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))
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
}

Widget makeInput({label,obsureText = false}){
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(label,style:TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w400,
          color: Colors.black87
      ),),
      SizedBox(height: 5,),
      TextField(
        obscureText: obsureText,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 0,horizontal: 10),
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