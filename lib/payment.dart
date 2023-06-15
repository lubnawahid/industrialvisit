import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:industrialvisit/payment1.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'api.dart';
import 'homescreen.dart';



// class _paymentState extends State<payment> {
//   TextEditingController amountController=TextEditingController();
//   TextEditingController cardnumController=TextEditingController();
//   TextEditingController expiryController=TextEditingController();
//   TextEditingController cvvController=TextEditingController();
//
//
//   String value="";
//   String i="";
//   final List paymentLabels=[
//     'Credi card/ Debit card',
//     'cash on delivery',
//     'Google pay',
//   ];
//   final List paymentIcons=[
//     Icons.credit_card,
//     Icons.money_off,
//     Icons.account_balance_wallet,
//
//   ];
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         title: Text('payment'),
//       ),
//
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             Padding(padding: EdgeInsets.all(8),
//               child:Text(
//                   'choose your payment method',
//
//                   style:TextStyle(fontSize: 20.0)
//               ),
//             ),
//             SizedBox(height: 20,),
//             Card(
//
//               child: Column(
//                 children: [
//                   RadioListTile(
//                       title: Text(
//                         'Credit Card',
//                         style: TextStyle(color: Colors.black, fontSize: 20),
//                       ),
//                       value: 'credit',
//                       groupValue: payment,
//                       onChanged: (value) {
//                         setState(() {
//                           payment = value.toString();
//                         });
//                       }),
//                   RadioListTile(
//                       title: Text(
//                         'Cash on Delivery',
//                         style: TextStyle(color: Colors.black, fontSize: 20),
//                       ),
//                       value: 'debit',
//                       groupValue: payment,
//                       onChanged: (value) {
//                         setState(() {
//                           payment = value.toString();
//                         });
//                       }),
//                   RadioListTile(
//                       title: Text(
//                         'UPI',
//                         style: TextStyle(color: Colors.black, fontSize: 20),
//                       ),
//                       value: 'upi',
//                       groupValue: payment,
//                       onChanged: (value) {
//                         setState(() {
//                           payment = value.toString();
//                         });
//                       }),
//                   RadioListTile(
//                       title: Text(
//                         'Net Banking',
//                         style: TextStyle(color: Colors.black, fontSize: 20),
//                       ),
//                       value: 'netBanking',
//                       groupValue: payment,
//                       onChanged: (value) {
//                         setState(() {
//                           payment = value.toString();
//                         });
//                       }),
//                 ],
//               ),
//             ),
//
//
//             Column(
//
//               children: [
//                 Align(
//                   alignment: Alignment.centerLeft,
//                   child: Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Text('Amount',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
//                   ),
//                 ),
//
//                 Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: TextFormField(
//                     controller: amountController,
//                     keyboardType: TextInputType.number,
//                     decoration: InputDecoration(
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(22),
//                         )
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//
//
//
//
//
//             SizedBox(height: 20,),
//
//             Align(
//               alignment: Alignment.center,
//               child: ElevatedButton(
//                 onPressed: (){
//                   Navigator.push(context, MaterialPageRoute(builder: (context)=>const payment1()));
//                 },
//                 child: Text('pay',style: TextStyle(fontSize: 18),),
//                 style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(29.0)),fixedSize: Size(180, 53)),
//               ),
//             ),
//             SizedBox(height: 20,)
//           ],
//         ),
//       ),
//
//     );
//
//
//   }
//   String ? payment;





//
// }


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
  late int user_id, order_id,booking_id;
  late String packageprice;
  Future<void> _showDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            // title: const Text("payment successfull"),
            content: Image.asset("/images/pay.png"),
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
    packageprice=widget.price;
    print(packageprice);
  }
  Future PlaceOrders() async {
    packageprice=widget.price;

    print(packageprice);
    prefs = await SharedPreferences.getInstance();
    user_id = (prefs.getInt('user_id') ?? 0);
    booking_id =(prefs.getInt('booking_id') ?? 0);
    print('login_id_complaint ${user_id}');
    setState(() {
      isLoading = true;
    });

    var data = {
      "user_id": user_id.toString(),
      "booking_id":booking_id.toString(),
      "amount": packageprice,
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
                decoration: InputDecoration(
                  labelText:packageprice ,
                  hintText:packageprice ,
                  hintStyle: TextStyle(
                      color: Colors.green
                  ),
                  border:OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30)),
                ),
              ),

              SizedBox(height: 30),
              SizedBox(height: 30,
                width: 180,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      // padding: EdgeInsets.all(20)
                    ),
                    onPressed: (){
                      PlaceOrders();
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