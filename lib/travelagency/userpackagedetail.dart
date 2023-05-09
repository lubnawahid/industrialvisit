import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class userpackagedetail extends StatefulWidget {
  const userpackagedetail({Key? key}) : super(key: key);

  @override
  State<userpackagedetail> createState() => _userpackagedetailState();
}

class _userpackagedetailState extends State<userpackagedetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
          leading:
          IconButton( onPressed: (){
            Navigator.pop(context);
          },icon:Icon(Icons.arrow_back_ios,size: 20,color: Colors.black,)),
          title: Text("User Package Details")),
      body: ListView.builder(
          itemCount: 7,
          itemBuilder: (context, index)
          {
            index += 1;
            return GestureDetector(
              onTap: () => {

              },
              child: Container(
                  margin: EdgeInsets.all(8),
                  padding: EdgeInsets.all(4),
                  decoration: BoxDecoration(),
                  child: ListTile(
                    title: Text(
                      "Package $index",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text("User Package Details"),
                    leading: Icon(Icons.payment,color: Colors.black,),
                    trailing: GestureDetector(
                        onTap: () => {
                          //  Navigator.push(context, MaterialPageRoute(builder: (context) => packageedit())),
                        },
                        child: Text("Date")),
                  )
              ),
            );

          }),

    );
  }
}

