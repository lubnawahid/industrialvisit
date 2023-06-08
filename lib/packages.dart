import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:industrialvisit/packagedescription.dart';

import 'api.dart';

class packages extends StatefulWidget {
  const packages({Key? key}) : super(key: key);

  @override
  State<packages> createState() => _packagesState();
}

class _packagesState extends State<packages> {
  List _loaddata=[];
  _fetchData() async {
    var res = await Api().getData('/api/packages_all_view');
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
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
          centerTitle:true,
          title:const  Text("Packages"),
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
                          int id= _loaddata[index]['id'];
                          return GestureDetector(
                            onTap: () => {
                              Navigator.push(context, MaterialPageRoute(builder: (context) =>packagedescription(id:id)))
                            },
                            child: Container(
                                margin: EdgeInsets.all(8),
                                padding: EdgeInsets.all(4),
                                decoration: BoxDecoration(),
                                child: ListTile(

                                  title: Text(
                                    _loaddata[index]['packagename'],
                                    style: TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  subtitle: Text(_loaddata[index]['companydescription']),

                                  // trailing:
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