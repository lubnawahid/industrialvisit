import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:industrialvisit/travelagency/packageadd.dart';
import 'package:industrialvisit/travelagency/packageedit.dart';

import '../api.dart';

class managepackages extends StatefulWidget {
  const managepackages({Key? key}) : super(key: key);

  @override
  State<managepackages> createState() => _managepackagesState();
}

class _managepackagesState extends State<managepackages> {


  List _loaddata=[];
  late int id;
  _fetchData() async {
    var res = await Api()
        .getData('/api/packages_all_view');
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
          leading:
          IconButton( onPressed: (){
            Navigator.pop(context);
          },icon:Icon(Icons.arrow_back_ios,size: 20,color: Colors.black,)),
          title: Text("Packages"),
           actions: [
            IconButton(icon: Icon(Icons.add), onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => packageadd())); },)
          ],
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
                    leading: Icon(Icons.event,color: Colors.red,),
                    title:  Text(
                      _loaddata[index]['packagename'],
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    trailing: ElevatedButton(

                        onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => packageedit(id:id) ));
                        },
                        child:const Text('Edit'),
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