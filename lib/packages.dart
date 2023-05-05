import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:industrialvisit/packagedescription.dart';

class packages extends StatefulWidget {
  const packages({Key? key}) : super(key: key);

  @override
  State<packages> createState() => _packagesState();
}

class _packagesState extends State<packages> {
  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(title: Text("Packages")),
      body: ListView.builder(
          itemCount: 7,
          itemBuilder: (context, index)
          {
            index += 1;
            return GestureDetector(
              onTap: () => {
             Navigator.push(context, MaterialPageRoute(builder: (context) =>const packagedescription()))
              },
              child: Container(
                margin: EdgeInsets.all(8),
                padding: EdgeInsets.all(4),
                decoration: BoxDecoration(color: Colors.white),
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
