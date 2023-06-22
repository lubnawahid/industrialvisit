 import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
 import 'package:http/http.dart' as http;
import '../api.dart';
import 'homescreen.dart';

class agencychat2 extends StatefulWidget {
  final int id;
   const agencychat2({required this.id});

   @override
   State<agencychat2> createState() => _agencychat2State();
 }

 class _agencychat2State extends State<agencychat2> {
   bool isObscurePassword=true;
   String reply='';
   late int id;
   // late int id;
   late SharedPreferences prefs;
   TextEditingController replyController=TextEditingController();

   // void initState() {
   //   // TODO: implement initState
   //   super.initState();
   //   _viewPro();
   // }
   // int currentTab = 2;
   // Future<void> _viewPro() async {
   //   prefs = await SharedPreferences.getInstance();
   //   id = (prefs.getInt('user_id') ?? 0 );
   //   print('login_idupdate ${id }');
   //   var res = await Api().getData('/api/single_chat_view/' +id.toString());
   //
   //   var body = json.decode(res.body);
   //  // var body = json.decode(res.body);
   //  print(body);
   //
   //
   //   setState(() {
   //     reply = body['data']['reply'];
   //
   //
   //
   //     replyController.text = reply;
   //     // agencynameController.text = agencyname;
   //     // collegenameController.text=collegename;
   //     // phonenumberController.text=phonenumber;
   //
   //   });
   // }


   Future<void> _updatereply(String reply) async {




   prefs = await SharedPreferences.getInstance();
   int id = widget.id;

    //id = (prefs.getInt('user_id') ?? 0 );
   // print(id);
   var uri = Uri.parse(Api().url+'/api/chat_update/'+id.toString()); // Replace with your API endpoint
   var request = http.MultipartRequest('PUT', uri);
   request.fields['reply'] = reply;

   print(request.fields);
   final response = await request.send();
   print(response);

   if (response.statusCode == 200) {

   print('chat Updated successfully');

   Navigator.push(this.context, MaterialPageRoute(builder: (context) => agencyhomescreen()));

   }

   else {
   print('Error Updating Chat. Status code: ${response.statusCode}');
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
                     _updatereply(replyController.text);
                   },
                   child: Text('Reply',style: TextStyle(fontSize: 19),),
                   style: ElevatedButton.styleFrom(fixedSize: Size(230, 55),shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(29.0)),primary: Colors.blue),
                 ),
               ),

             )],
         ),

       ),
     );
   }
 }