import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:industrialvisit/homescreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'api.dart';
import 'chatdetailpage.dart';

class chat extends StatefulWidget {
  const chat({Key? key}) : super(key: key);

  @override
  State<chat> createState() => _chatState();
}

class _chatState extends State<chat> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle:true,
//         title: Text("Message Here"),
//
//
//       ),
//     body: Stack(
//       children: <Widget>[
//
//         /*ListView.builder(
//           itemCount: messages.length,
//           shrinkWrap: true,
//           padding: EdgeInsets.only(top: 10,bottom: 10),
//           physics: NeverScrollableScrollPhysics(),
//           itemBuilder: (context, index){
//             return Container(
//               padding: EdgeInsets.only(left: 16,right: 16,top: 10,bottom: 10),
//               child: Text(messages[index].messageContent),
//             );
//           },
//         ),*/
//     ListView.builder(
//     itemCount: messages.length,
//     shrinkWrap: true,
//     padding: EdgeInsets.only(top: 10,bottom: 10),
//     physics: NeverScrollableScrollPhysics(),
//     itemBuilder: (context, index){
//     return Container(
//     padding: EdgeInsets.only(left: 14,right: 14,top: 10,bottom: 10),
//     child:
//         Align(
//
//           alignment: (messages[index].messageType == "sender"?Alignment.topLeft:Alignment.topRight),
//           child: Container(
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(20),
//               color: (messages[index].messageType  == "receiver"?Colors.grey.shade200:Colors.blue[200]),
//             ),
//             padding: EdgeInsets.all(16),
//             child: Text(messages[index].messageContent, style: TextStyle(fontSize: 15),),
//           ),
//         ),
//     );
//     },
//     ),
//
//        Align( alignment: Alignment.bottomLeft,
//           child: Container(
//             padding: EdgeInsets.only(left: 10,bottom: 10,top: 10),
//             height: 70,
//             width: double.infinity,
//             color: Colors.white,
//             child: Row(
//               children: <Widget>[
//                 GestureDetector(
//                   onTap: (){
//                   },
//                   child: Container(
//                     height: 30,
//                     width: 30,
//                     decoration: BoxDecoration(
//                       color: Colors.lightBlue,
//                       borderRadius: BorderRadius.circular(30),
//                     ),
//                     child: Icon(Icons.add, color: Colors.white, size: 20, ),
//                   ),
//                 ),
//                 SizedBox(width: 15,),
//                 Expanded(
//                   child: TextField(
//                     decoration: InputDecoration(
//                         hintText: "Write message...",
//                         hintStyle: TextStyle(color: Colors.black54),
//                         border: InputBorder.none
//                     ),
//                   ),
//                 ),
//                 SizedBox(width: 15,),
//                 FloatingActionButton(
//                   onPressed: (){},
//                   child: Icon(Icons.send,color: Colors.white,size: 18,),
//                   backgroundColor: Colors.blue,
//                   elevation: 0,
//                 ),
//               ],
//
//             ),
//           ),
//         ),
//       ],
//     ),
//     );
//
//
//
//   }
// }
  TextEditingController messageController=TextEditingController();
 //DateTime datetime = DateTime.now();
  //String datetime1='';
  late SharedPreferences prefs;
  late int user_id;
  late int travelagency_id;
  bool _isLoading=false;
  void chat()

  async {
   // datetime1 = DateFormat("yyyy-MM-dd").format(datetime);
    prefs = await SharedPreferences.getInstance();
    user_id = (prefs.getInt('user')?? 0);
    travelagency_id = (prefs.getInt('travelagency')?? 0);
    setState(() {
      _isLoading = true;
    });

    var data = {
      "message": messageController.text.trim(),
      "user_id": user_id.toString(),
      "travelagency_id":travelagency_id.toString(),
    };

    print(" data${data}");
    var res = await Api().authData(data,'/api/chat');
    var body = json.decode(res.body);
    print(body);
    if(body['success']==true)
    {

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
 // TextEditingController dateInput = TextEditingController();

  @override
  // void initState() {
  //   dateInput.text = ""; //set the initial value of text field
  //   super.initState();
  // }
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