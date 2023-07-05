import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../api.dart';

class viewbookings extends StatefulWidget {
  const viewbookings({Key? key}) : super(key: key);

  @override
  State<viewbookings> createState() => _viewbookingsState();
}

class _viewbookingsState extends State<viewbookings> {
  List _loaddata = [];
  late int id;

  _fetchData() async {
    var res = await Api()
        .getData('/api/booking_all_view');
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
        // leading:
        // IconButton( onPressed: (){
        //   Navigator.pop(context);
        // },icon:Icon(Icons.arrow_back_ios,size: 20,color: Colors.black,)),
        // title: Text("Bookings"),
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
                itemCount: _loaddata.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  int id = _loaddata[index]['id'];
                  return GestureDetector(
                    onTap: () =>
                    {
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
                        leading: Icon(Icons.book, color: Colors.red,),
                        title: Text(
                          _loaddata[index]['packagename'],

                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle:  Text(_loaddata[index]['name']),
                        trailing: const Text('Booked')
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