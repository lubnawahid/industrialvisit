import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../api.dart';
import '../chat.dart';
import '../packagedescription.dart';

class agencychat extends StatefulWidget {

  const agencychat({Key? key}) : super(key: key);

  @override
  State<agencychat> createState() => _agencychatState();
}

class _agencychatState extends State<agencychat> {
  // late int id;
  // List _loaddata=[];
  // _fetchData() async {
  //   var res = await Api().getData('/api/chat_view');
  //   if (res.statusCode == 200) {
  //     var items = json.decode(res.body)['data'];
  //     print(items);
  //     setState(() {
  //       _loaddata = items;
  //
  //     });
  //   } else {
  //     setState(() {
  //       _loaddata = [];
  //       Fluttertoast.showToast(
  //         msg:"Currently there is no data available",
  //         backgroundColor: Colors.grey,
  //       );
  //     });
  //   }
  // }
  //
  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   _fetchData();
  // }
  // Widget build(BuildContext context) {
  //
  //
  //   return Scaffold(
  //     appBar: AppBar(
  //       centerTitle:true,
  //       title:const  Text("Messaging"),
  //       leading:
  //       IconButton( onPressed: (){
  //         Navigator.pop(context);
  //       },icon:Icon(Icons.arrow_back_ios,size: 20,color: Colors.white,)),
  //     ),
  //     body: SingleChildScrollView(
  //       child: Padding(
  //         padding: const EdgeInsets.all(10),
  //         child: Column(
  //           children: [
  //             // TextField(
  //             //   keyboardType: TextInputType.text,
  //             //   // onChanged: (value) => _runFilter(value),
  //             //   decoration: InputDecoration(
  //             //     contentPadding:
  //             //     const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15),
  //             //     hintText: "Search",
  //             //     suffixIcon: const Icon(Icons.search),
  //             //     // prefix: Icon(Icons.search),
  //             //     border: OutlineInputBorder(
  //             //       borderRadius: BorderRadius.circular(20.0),
  //             //       borderSide: const BorderSide(),
  //             //     ),
  //             //   ),
  //             // ),
  //             const SizedBox(
  //               height: 15,
  //             ),
  //             Container(
  //               child:  Column(
  //                 children: [
  //
  //                   ListView.builder(
  //                       physics: NeverScrollableScrollPhysics(),
  //                       itemCount:_loaddata.length,
  //                       shrinkWrap: true,
  //                       itemBuilder: (context, index)
  //                       {
  //                         int id= _loaddata[index]['id'];
  //                         return GestureDetector(
  //                           onTap: () => {
  //                            // Navigator.push(context, MaterialPageRoute(builder: (context) =>packagedescription(id:id)))
  //                           },
  //                           child: Container(
  //                               margin: EdgeInsets.all(8),
  //                               padding: EdgeInsets.all(4),
  //                               decoration: BoxDecoration(),
  //                               child: ListTile(
  //
  //                                 title: Text(
  //                                   _loaddata[index]['message'],
  //                                   style: TextStyle(fontWeight: FontWeight.bold),
  //                                 ),
  //                                // subtitle: Text(_loaddata[index]['companydescription']),
  //
  //                                 // trailing:
  //                                 // ElevatedButton(
  //                                 //   onPressed: () {
  //                                 //     //
  //                                 //   },
  //                                 //   child: const Text('View'),
  //                                 // ),
  //                               )
  //                           ),
  //                         );
  //
  //                       }),
  //                 ],
  //               ),
  //             ),
  //           ],
  //         ),
  //       ),
  //     ),
  //   );
  // }
  late int id;
  List _loaddata=[];
  // late int id;
  _fetchData() async {

print("id${id}");
    var res = await Api().getData('/api/chat_view/' +id.toString());
    if (res.statusCode == 200) {
      var items = json.decode(res.body)['data'];
      print(items);
      setState(() {
        _loaddata = items;
      });
    } else {
      setState(() {
        _loaddata = [];
        Fluttertoast.showToast(
          msg: "Currently there is no data available",
          backgroundColor: Colors.grey,
        );
      }
      );
    }
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _fetchData();
  }

  @override
  Widget build(BuildContext context) {


    return Scaffold(

      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle:true,
        // leading:
        // IconButton( onPressed: (){
        //   Navigator.pop(context);
        // },icon:Icon(Icons.arrow_back_ios,size: 20,color: Colors.black,)),
        title: Text("Messaging"),
        // actions: [
        //   IconButton(icon: Icon(Icons.add), onPressed: () {
        //     //Navigator.push(context, MaterialPageRoute(builder: (context) => packageadd()));
        //     },
        //   )
        //],
      ),

      body: SingleChildScrollView(
        physics: ScrollPhysics(),
        child: Column(
          children: [
            ListView.builder(

                physics: NeverScrollableScrollPhysics(),
                itemCount:_loaddata.length,
                shrinkWrap: true,
                itemBuilder: (context, index)
                {
                  int id= _loaddata[index]['id'];
                  return GestureDetector(
                    onTap: () => {

                    },
                    // itemCount: 7,
                    // itemBuilder: (context, index)
                    //  {
                    //    index += 1;
                    //    return GestureDetector(
                    //      onTap: () => {
                    //
                    //      },
                    //      child: Container(
                    //          margin: EdgeInsets.all(8),
                    //          padding: EdgeInsets.all(4),
                    //          decoration: BoxDecoration(),
                    child: ListTile(

                      // subtitle: Text("24/06/23"),
                        leading: Icon(Icons.travel_explore_sharp,color: Colors.red,),
                        title:  Text(
                          _loaddata[index]['message'],
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        trailing: ElevatedButton(

                          onPressed: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => chat(id:id) ));
                          },
                          child:const Text('Message'),
                        )
                    ),
                  );

                }
            ),
            // floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
            // floatingActionButton: FloatingActionButton(
            //   child:  Icon(Icons.add),
            //   backgroundColor: Colors.blue,
            //   onPressed: () {
            //    Navigator.push(context, MaterialPageRoute(builder: (context) => packageadd()));
          ],
        ),
      ),
    );
  }
}


