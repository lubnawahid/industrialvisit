import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'api.dart';
import 'chat.dart';

class viewtravelagency extends StatefulWidget {
  const viewtravelagency({Key? key}) : super(key: key);

  @override
  State<viewtravelagency> createState() => _viewtravelagencyState();
}

class _viewtravelagencyState extends State<viewtravelagency> {
  List _loaddata=[];
  // late int id;
  _fetchData() async {


    var res = await Api().getData('/api/travelagency_all_view');
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
        title: Text("Travelagencies"),
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
                        leading: Icon(Icons.message,color: Colors.red,),
                        title:  Text(
                          _loaddata[index]['agencyname'],
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
