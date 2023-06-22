import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:industrialvisit/travelagency/usercredes.dart';

import '../api.dart';

class userpackagedetail extends StatefulWidget {
  const userpackagedetail({Key? key}) : super(key: key);

  @override
  State<userpackagedetail> createState() => _userpackagedetailState();
}

class _userpackagedetailState extends State<userpackagedetail> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//
//       appBar: AppBar(
//           leading:
//           IconButton( onPressed: (){
//             Navigator.pop(context);
//           },icon:Icon(Icons.arrow_back_ios,size: 20,color: Colors.black,)),
//           title: Text("User Package Details")),
//       body: ListView.builder(
//           itemCount: 7,
//           itemBuilder: (context, index)
//           {
//             index += 1;
//             return GestureDetector(
//               onTap: () => {
//
//               },
//               child: Container(
//                   margin: EdgeInsets.all(8),
//                   padding: EdgeInsets.all(4),
//                   decoration: BoxDecoration(),
//                   child: ListTile(
//                     title: Text(
//                       "Package $index",
//                       style: TextStyle(fontWeight: FontWeight.bold),
//                     ),
//                     subtitle: Text("User Package Details"),
//                     leading: Icon(Icons.payment,color: Colors.black,),
//                     trailing: GestureDetector(
//                         onTap: () => {
//                           //  Navigator.push(context, MaterialPageRoute(builder: (context) => packageedit())),
//                         },
//                         child: Text("Date")),
//                   )
//               ),
//             );
//
//           }),
//
//     );
//   }
// }

  List _loaddata=[];
  late int id;
  _fetchData() async {
    var res = await Api().getData('/api/user_created_all_packages');
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
          msg:"Currently there is no data available",
          backgroundColor: Colors.grey,
        );
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _fetchData();
  }

  // _deleteData(int id) async {
  //
  //   var res = await Api().deleteData('/api/user_created_delete_packages/'+ id.toString());
  //   if (res.statusCode == 200) {
  //     setState(() {
  //     //  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => homescreen()));
  //       Fluttertoast.showToast(
  //         msg: "Package Deleted Successfully",
  //         backgroundColor: Colors.grey,
  //       );
  //     });
  //   } else {
  //     setState(() {
  //       Fluttertoast.showToast(
  //         msg: "Currently there is no data available",
  //         backgroundColor: Colors.grey,
  //       );
  //     });
  //   }
  // }
  Widget build(BuildContext context) {


    return Scaffold(
        appBar: AppBar(
          centerTitle:true,
          title:const  Text("User Created Packages"),
          leading:
          IconButton( onPressed: (){
            Navigator.pop(context);
          },icon:Icon(Icons.arrow_back_ios,size: 20,color: Colors.white,)),
        ),
        body: SingleChildScrollView(
        child: Padding(
        padding: const EdgeInsets.all(10),
    child: Column(
    children: [
    TextField(
    keyboardType: TextInputType.text,
    // onChanged: (value) => _runFilter(value),
    decoration: InputDecoration(
    contentPadding:
    const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15),
    hintText: "Search",
    suffixIcon: const Icon(Icons.search),
    // prefix: Icon(Icons.search),
    border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(20.0),
    borderSide: const BorderSide(),
    ),
    ),
    ),
    const SizedBox(
    height: 15,
    ),
    Container(
    child:  Column(
    children: [

    ListView.builder(
    physics: NeverScrollableScrollPhysics(),
    itemCount:_loaddata.length,
    shrinkWrap: true,
    itemBuilder: (context, index)
  {
    id= _loaddata[index]['id'];
    return GestureDetector(
    onTap: () => {
    Navigator.push(context, MaterialPageRoute(builder: (context) =>viewusercreatedpackages(id:id)))
    },
    child: Container(
    margin: EdgeInsets.all(8),
    padding: EdgeInsets.all(4),
    decoration: BoxDecoration(),
    child: ListTile(

    title: Text(
    _loaddata[index]['companyname'],
    style: TextStyle(fontWeight: FontWeight.bold),
    ),

    subtitle: Text(_loaddata[index]['companydescription']),


        // subtitle: Text("24/06/23"),
        //  leading: Icon(Icons.event,color: Colors.red,),
        // title:  Text(
        // _loaddata[index]['packagename'],
        // style: TextStyle(fontWeight: FontWeight.bold),
        // ),
    //     trailing: ElevatedButton(
    //
    //       onPressed: (){
    //         _deleteData(id);
    //         // Navigator.push(context, MaterialPageRoute(builder: (context) => packageedit(id:id) ));
    //       },
    //       child:const Text('Delete'),
    //     )
    // ), // trailing:
      // ElevatedButton(
      //   onPressed: () {
      //     //
      //   },
      //   child: const Text('View'),
      // ),
    )
       ),
    );

  }),
    ],
    ),
    ),
    ],
    ),
        ),
        ),
    );
  }


}
