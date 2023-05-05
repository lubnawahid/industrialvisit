import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:industrialvisit/bookeddescription.dart';
import 'package:industrialvisit/packagedescription.dart';

class bookeditems extends StatefulWidget {
  const bookeditems({Key? key}) : super(key: key);

  @override
  State<bookeditems> createState() => _bookeditemsState();
}

class _bookeditemsState extends State<bookeditems> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Text('Booked items',),

        ),

        body: Padding(
          padding: EdgeInsets.all(5),
          child: ListView.separated(
            itemBuilder: (context,index){
              return ListTile(
                leading: CircleAvatar(
                    backgroundColor: Colors.blue,
                    child: Icon(Icons.event, size: 25,color: Colors.white,)
                ) ,
                title: Text("Packages 1",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                subtitle: Text("Booked",style: TextStyle(fontSize: 16),),

                trailing: Text('24/10/2023'),

                onTap: () {Navigator.push(context,
                  MaterialPageRoute(
                      builder: (context) => packagedescription(),
                    ),
                  );
                },
              );
            },
            separatorBuilder: (context, index) {
              return Divider(height: 30, thickness: 1,);
            },
            itemCount: 13,

          ),
        )


    );
  }
}