import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../api.dart';

class viewpayment extends StatefulWidget {
  const viewpayment({Key? key}) : super(key: key);

  @override
  State<viewpayment> createState() => _viewpaymentState();
}

class _viewpaymentState extends State<viewpayment> {
  List _loaddata=[];

  late int id;
  late SharedPreferences prefs;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _fetchData();
  }
  _fetchData() async {

    prefs = await SharedPreferences.getInstance();
    //  id = prefs.getInt('id')?? 0;
    // print('${id }');
    var res = await Api().getData('/api/payment_all_view');
    if (res.statusCode == 200) {
      var items = json.decode(res.body)['data'];
      print(items);
      setState(() {
        _loaddata = items;

      });
    } else {
      setState(() {
        _loaddata =[];
        Fluttertoast.showToast(
          msg:"Currently there is no data available",
          backgroundColor: Colors.grey,
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('PAYMENT DETAILS',style: TextStyle(fontSize: 14),),

      ),

      body: ListView.builder(
        shrinkWrap: true,
        itemCount: _loaddata.length,
        itemBuilder: (context,index){

          return Padding(
            padding: const EdgeInsets.only(top: 16,right: 12,left: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      child: Icon(Icons.payment,color: Colors.red,size: 28,),
                    ),

                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                         Text("Name: "+_loaddata[index]['name'],style: TextStyle(fontSize: 16),textAlign: TextAlign.justify,),
                         Text("credited : "+_loaddata[index]['price'],style: TextStyle(fontSize: 13),textAlign: TextAlign.justify,),


                        ],
                      ),
                    ),
                    SizedBox(width: 14,),

                    Text(_loaddata[index]['date'],style: TextStyle(fontSize: 10))
                  ],
                ),
                SizedBox(height: 12,),
                Divider(
                  color: Colors.grey[300],
                  thickness: 2,
                )
              ],
            ),
          );
        },


      ),




    );
  }
}