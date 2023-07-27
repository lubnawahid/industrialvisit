import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:industrialvisit/payment1.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'api.dart';
import 'homescreen.dart';
class Payment2 extends StatefulWidget {
  final String price;


  Payment2({required this.price});

  @override
  State<Payment2> createState() => _Payment2State();
}
enum Gender { credit_card,debit_card,net_banking, cashon_delivery }
Gender? _payment = Gender.credit_card;
String? payment;


String formattedDate = DateFormat('yyyy-MM-dd').format(DateTime.now());

class _Payment2State extends State<Payment2> {

  DateTime? _selectDate;
  late SharedPreferences prefs;
  bool isLoading = false;
  late int user_id,bookings,packages,id;
  late String price;
//  String name='';
// String tname='';
  Future<void> _showDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            // title: const Text("payment successfull"),
            content: Image.asset("images/paymnt.jpg"),
            actions: [
              ElevatedButton(onPressed: (){
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (context) => homescreen()));
              }, child: Text("OK"))
            ],
          );
        });
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    price=widget.price;

    print('amount:$price');
  }
  Future PackagePayment() async {
    price=widget.price;

    prefs = await SharedPreferences.getInstance();
    user_id = (prefs.getInt('user_id') ?? 0);
    print('login_id ${user_id}');
    setState(() {
      isLoading = true;
    });

    var data = {
      "user": user_id.toString(),

      "price": price,
      "date":formattedDate
    };
    print(data);
    var res = await Api().authData(data, '/api/package_payment');
    var body = json.decode(res.body);
    print(body);
    if (body['success'] == true) {

      _showDialog(context);

      print(body);
      Fluttertoast.showToast(
        msg: body['message'].toString(),
        backgroundColor: Colors.grey,
      );
    }
    else{
      Fluttertoast.showToast(
        msg: body['message'].toString(),
        backgroundColor: Colors.grey,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController datecontroller=TextEditingController();


    return  Scaffold( appBar: AppBar(
      title: Text("Payments"),
      leading:IconButton(
        icon:Icon(Icons.arrow_back), onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (context)=>homescreen()));
      },
      ),
    ),
      body: SingleChildScrollView(
        child: Container(
          // ignore: prefer_const_literals_to_create_immutables
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Text("Payment",
              //   style: TextStyle(
              //     fontSize: 20,
              //     color: Colors.green,
              //     fontWeight: FontWeight.bold,
              //   ),
              // ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0, top: 10),
                child: Align(
                    alignment: Alignment.centerLeft, child: Text("Suggested for you")),
              ),
              ListTile(
                title: const Text('Credit_card'),
                leading: Radio<Gender>(
                  value: Gender.credit_card,
                  groupValue: _payment,
                  onChanged: (Gender? value) {
                    setState(() {
                      _payment = value;
                    });
                  },
                ),
              ),
              ListTile(
                title: const Text('Debit_card'),
                leading: Radio<Gender>(
                  value: Gender.debit_card,
                  groupValue: _payment,
                  onChanged: (Gender? value) {
                    setState(() {
                      _payment = value;
                    });
                  },
                ),
              ),
              ListTile(
                title: const Text('Net banking'),
                leading: Radio<Gender>(
                  value: Gender.net_banking,
                  groupValue: _payment,
                  onChanged: (Gender? value) {
                    setState(() {
                      _payment = value;
                    });
                  },
                ),
              ),
              ListTile(
                title: const Text('Cash on delivery'),
                leading: Radio<Gender>(
                  value: Gender.cashon_delivery,
                  groupValue: _payment,
                  onChanged: (Gender? value) {
                    setState(() {
                      _payment = value;
                    });
                  },
                ),
              ),
              SizedBox(height: 10),
              TextField(
                readOnly: true,
               // controller: packagecostController,
                decoration: InputDecoration(
                  labelText:price,
                  hintText:price,
                  hintStyle: TextStyle(
                      color: Colors.green
                  ),
                  border:OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30)
                  ),
                ),
              //  controller: TextEditingController(text: packagecost),
              ),

              SizedBox(height: 30),
              SizedBox(height: 30,
                width: 100,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      // padding: EdgeInsets.all(20)
                    ),
                    onPressed: (){

                      PackagePayment();
                    } ,
                    child: Text("CONTINUE")),
              ),
              SizedBox(height: 30),
            ],
          ),),
      ),
    );
  }
}

