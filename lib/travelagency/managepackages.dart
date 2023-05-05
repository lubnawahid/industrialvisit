import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:industrialvisit/travelagency/packageadd.dart';
import 'package:industrialvisit/travelagency/packageedit.dart';

class managepackages extends StatefulWidget {
  const managepackages({Key? key}) : super(key: key);

  @override
  State<managepackages> createState() => _managepackagesState();
}

class _managepackagesState extends State<managepackages> {
  @override
  Widget build(BuildContext context) {


    return Scaffold(

      appBar: AppBar(
          leading:
          IconButton( onPressed: (){
            Navigator.pop(context);
          },icon:Icon(Icons.arrow_back_ios,size: 20,color: Colors.black,)),
          title: Text("Packages")),
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
                      "Packages $index",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                   // subtitle: Text("24/06/23"),
                    leading: Icon(Icons.event,color: Colors.red,),
                    trailing: GestureDetector(
                        onTap: () => {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => packageedit())),
                        },
                        child: Icon(Icons.edit,color: Colors.black,)),
                  )
              ),
            );

          }),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: FloatingActionButton(
        child:  Icon(Icons.add),
        backgroundColor: Colors.blue,
        onPressed: () {
         Navigator.push(context, MaterialPageRoute(builder: (context) => packageadd()));
          setState(() {
            var i;
            i++;
          });
        },
      ),
    );
  }
}