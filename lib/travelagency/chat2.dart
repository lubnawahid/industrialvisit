import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../api.dart';
import '../chat.dart';
import 'homescreen.dart';
import 'package:http/http.dart' as http;

class agencychat2 extends StatefulWidget {
  const agencychat2({Key? key}) : super(key: key);

  @override
  State<agencychat2> createState() => _agencychat2State();
}

class _agencychat2State extends State<agencychat2> {
  late SharedPreferences prefs;
  late int travelagency_id ;
  TextEditingController replyController = TextEditingController();



  Future<void> _update(String reply,) async {
    prefs = await SharedPreferences.getInstance();
    int?  travelagency_id = prefs.getInt('user_id');
    print( travelagency_id);
    //
    // prefs = await SharedPreferences.getInstance();
    // travelagency_id = (prefs.getInt('travelagency_id') ?? 0 );
    print(travelagency_id);
    print('gggggg');
    var res = await Api()
        .putData('/api/chat_update/'+travelagency_id.toString());
   // var uri = Uri.parse(Api().url+'/api/chat_update/'+travelagency_id.toString()); // Replace with your API endpoint
    if (res.statusCode == 200) {


      var items = json.decode(res.body)['data'];
      print(items);
      setState(() {
     print('success');
      });
    } else {
      setState(() {

        Fluttertoast.showToast(
          msg: "Currently there is no data available",
          backgroundColor: Colors.grey,
        );
      }


    print(request.fields);
    final response = await request.send();
    print(response);

    if (response.statusCode == 200) {
      print('Chat Updated successfully');
      Navigator.push(
          this.context, MaterialPageRoute(builder: (context) => agencyhomescreen()));
    } else {
      print('Error Updating chat. Status code: ${response.statusCode}');
    }
  }

  //Widget currentScreen = profile();

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
                           controller: replyController,
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
                    _update(replyController.text);
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