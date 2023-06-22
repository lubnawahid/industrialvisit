import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:industrialvisit/travelagency/chat2.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'api.dart';

class reply extends StatefulWidget {
  const reply({Key? key}) : super(key: key);

  @override
  State<reply> createState() => _replyState();
}

class _replyState extends State<reply> {
  bool isObscurePassword=true;
  late int user_id;
  String t_name="";
  String reply="";
  late SharedPreferences prefs;
  TextEditingController t_nameController=TextEditingController();
  TextEditingController replyController=TextEditingController();
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
    var res = await Api().getData('/api/single_reply_view/'+user_id.toString());

    var body = json.decode(res.body);
    // var body = json.decode(res.body);
    print(body);


    setState(() {
      t_name = body['data']['t_name'];
      reply = body['data']['reply'];
      //agencyname = body['data']['agencyname'];
      // collegename = body['data']['collegename'];
      //phonenumber = body['data']['phonenumber'];



      t_nameController.text = t_name;
      // agencynameController.text = agencyname;
      replyController.text=reply;
      // phonenumberController.text=phonenumber;

    });
  }
  _fetchData() async {
    prefs = await SharedPreferences.getInstance();
    int? userid = prefs.getInt('user_id');
    print(userid);
    var res = await Api()
        .getData('/api/single_reply_view/' +userid.toString());
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
        title: Text("Travelagency's Reply"),
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
                  //int id= _loaddata[index]['id'];
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
                          _loaddata[index]['t_name'],
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(_loaddata[index]['reply']),
                        // trailing: ElevatedButton(
                        //
                        //   onPressed: (){
                        //   //  Navigator.push(context, MaterialPageRoute(builder: (context) => agencychat2(id:id) ));
                        //   },
                        //   child:const Text('Reply'),
                        // )
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
