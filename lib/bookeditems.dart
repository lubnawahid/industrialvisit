import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:industrialvisit/bookeddescription.dart';

class bookeditems extends StatefulWidget {
  const bookeditems({Key? key}) : super(key: key);

  @override
  State<bookeditems> createState() => _bookeditemsState();
}

class _bookeditemsState extends State<bookeditems> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Text("Booked items")),
      body: ListView.builder(
          itemCount: 7,
          itemBuilder: (context, index)
          {
            index += 1;
            return GestureDetector(
              onTap: () => {
              Navigator.push(context, MaterialPageRoute(builder: (context) =>const bookeddescription()))
              },
              child: Container(
                margin: EdgeInsets.all(8),
                padding: EdgeInsets.all(4),
                decoration: BoxDecoration(color: Colors.blueGrey),
                child: ListTile(
                  title: Text(
                    "Package $index",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text("Package Description"),
                  leading: Icon(Icons.event,color: Colors.red,),
                  trailing: Icon(Icons.forward,color: Colors.red,
                  ),

                ),
              ),
            );
          }),
    );
  }
}

