import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:industrialvisit/travelagency/chat2.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../api.dart';
import '../chat.dart';

class agencychat extends StatefulWidget {
  const agencychat({Key? key}) : super(key: key);

  @override
  State<agencychat> createState() => _agencychatState();
}

class _agencychatState extends State<agencychat> {

  bool isObscurePassword=true;
  late int user_id;
  String u_name="";
  String message="";
  late SharedPreferences prefs;
  TextEditingController u_nameController=TextEditingController();
  TextEditingController messageController=TextEditingController();
    List _loaddata=[];


  @override

  void initState() {
    // TODO: implement initState
    super.initState();
    _viewPro();
    _fetchData();
  }
  int currentTab = 2;
  Future<void> _viewPro() async {
    prefs = await SharedPreferences.getInstance();
    user_id = (prefs.getInt('user_id') ?? 0 );
    print('${user_id }');
    var res = await Api().getData('/api/single_chat_view/'+user_id.toString());

    var body = json.decode(res.body);
    // var body = json.decode(res.body);
    print(body);


    setState(() {
      u_name = body['data']['u_name'];
      message = body['data']['message'];
      //agencyname = body['data']['agencyname'];
     // collegename = body['data']['collegename'];
      //phonenumber = body['data']['phonenumber'];



      u_nameController.text = u_name;
      // agencynameController.text = agencyname;
      messageController.text=message;
     // phonenumberController.text=phonenumber;

    });
  }
  _fetchData() async {
    prefs = await SharedPreferences.getInstance();
    int? userid = prefs.getInt('user_id');
    print(userid);
    var res = await Api()
        .getData('/api/single_chat_view/' +userid.toString());
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


  Widget build(BuildContext context) {


    return Scaffold(

      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle:true,
        // leading:
        // IconButton( onPressed: (){
        //   Navigator.pop(context);
        // },icon:Icon(Icons.arrow_back_ios,size: 20,color: Colors.black,)),
        title: Text("User's Messages"),
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
                          _loaddata[index]['u_name'],
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(_loaddata[index]['message']),
                        trailing: ElevatedButton(

                          onPressed: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => agencychat2() ));
                          },
                          child:const Text('Reply'),
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






