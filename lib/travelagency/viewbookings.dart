import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class viewbookings extends StatefulWidget {
  const viewbookings({Key? key}) : super(key: key);

  @override
  State<viewbookings> createState() => _viewbookingsState();
}

class _viewbookingsState extends State<viewbookings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
          leading:
          IconButton( onPressed: (){
            Navigator.pop(context);
          },icon:Icon(Icons.arrow_back_ios,size: 20,color: Colors.black,)),
          title: Text("Booking Details")),
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
                      "Booking $index",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text("Booking Details"),
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
