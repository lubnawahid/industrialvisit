import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:industrialvisit/homescreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'api.dart';
import 'chatdetailpage.dart';

class chat extends StatefulWidget {
  final int id;
  const chat({required this.id});
  @override
  State<chat> createState() => _chatState();
}

class _chatState extends State<chat> {
//   @override

String message="";
late int id;
  late int user_id;
  late int travelagency_id;
  late SharedPreferences localStorage;
  bool  _isLoading = false;
  TextEditingController messageController = TextEditingController();
@override
void initState() {
  // TODO: implement initState
  super.initState();
  _viewPro();
}

Future<void> _viewPro() async {
  int id = widget.id;
  print("id${id}");

  var res = await Api().getData('/api/travelagency_single_view/' + id.toString());
  var body = json.decode(res.body);
  print(body);
  setState(() {
    user_id = body['data']['user_id'];
    travelagency_id = body['data']['travelagency_id'];
    message = body['data']['message'];

    messageController.text=message;

  });
}
Future<void> chat() async {
  setState(() {
    _isLoading = true;
  });
  int id = widget.id;

  localStorage = await SharedPreferences.getInstance();
  user_id = (localStorage.getInt('user_id') ?? 0);
  var data = {
    "user_id": user_id.toString(),
    "travelagency_id":id.toString(),

    "message":messageController.text,

  };
  print(data);
  var res = await Api().authData(data,'/api/user_chat');
  var body = json.decode(res.body);
  print(body);
  if(body['success']==true)
  {
    print(body);


    Navigator.push(context, MaterialPageRoute(builder: (context)=>homescreen()));
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
    var size=MediaQuery.of(context).size;
    return Scaffold(

      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blue,
        title: Text('Messaging'),
      ),

      body:  SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: size.height*.35,
              child:
              Image.asset('images/message.jpg',
                fit: BoxFit.cover,
              ),
            ),
            Padding(
                padding: const EdgeInsets.only(left: 12,right: 12,top: 20),
                child: Container(
                    height: 300.0,
                    child: Stack(
                        children: [
                          TextField(
                            controller: messageController,
                            maxLines: 10,
                            decoration: InputDecoration(
                              hintText: 'Please Message Here......',
                              hintStyle: TextStyle(
                                  fontSize: 15,
                                  color: Colors.grey
                              ),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey),
                              ),

                            ),
                          ),
                        ]
                    )
                )
            ),
            // Container(
            //     padding: EdgeInsets.all(10),
            //     height: MediaQuery.of(context).size.width / 2,
            //     child: Center(
            //         child: TextField(
            //           cursorColor: Colors.green,
            //           controller: dateInput,
            //           //editing controller of this TextField
            //           decoration: InputDecoration(
            //               icon: Icon(Icons.calendar_today),
            //               //icon of text field
            //               labelText: "Enter Date" //label text of field
            //           ),
            //           readOnly: true,
            //           //set it true, so that user will not able to edit text
            //           onTap: () async {
            //             DateTime? pickedDate = await showDatePicker(
            //                 context: context,
            //                 initialDate: DateTime.now(),
            //                 firstDate: DateTime(1950),
            //                 //DateTime.now() - not to allow to choose before today.
            //                 lastDate: DateTime(2100));
            //
            //             if (pickedDate != null) {
            //               print(
            //                   pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
            //               String formattedDate =
            //               DateFormat('yyyy-MM-dd').format(pickedDate);
            //               print(
            //                   formattedDate); //formatted date output using intl package =>  2021-03-16
            //               setState(() {
            //                 dateInput.text =
            //                     formattedDate; //set output date to TextField value.
            //               });
            //             } else {}
            //           },
            //         ))),
            //
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                child: ElevatedButton(
                  onPressed: (){
                    chat();
                  },
                  child: Text('Send',style: TextStyle(fontSize: 19),),
                  style: ElevatedButton.styleFrom(fixedSize: Size(230, 55),shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(29.0)),primary: Colors.blue),
                ),
              ),

            )],
        ),

      ),
    );
  }
}