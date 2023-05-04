import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class packagedescription extends StatefulWidget {
  const packagedescription({Key? key}) : super(key: key);

  @override
  State<packagedescription> createState() => _packagedescriptionState();
}

class _packagedescriptionState extends State<packagedescription> {
  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(title: Text("Package Details"),
        leading:
        IconButton( onPressed: (){
          Navigator.pop(context);
        },icon:Icon(Icons.arrow_back_ios,size: 20,color: Colors.black,)),
      ),
      body: Center(
        child: Column(
            children: [
              Image.asset("images/jvs.jpg", width: MediaQuery.of(context).size.width,height: 300,),
              SizedBox(height: 30,),
              Column(
                children: [
                  Text(
                    'J V ELECTRONICS PVT Ltd',
                    style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,),
                  ),
                  SizedBox(height: 30,),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text('Started in the year 1991 in a small way, when acceptability of Small scale manufacturers to make high end products like relays was a challenge across the globe, JVS established itself by proving its excellence and commitment to inventing and producing products of great quality. JVS has since come a long way and is one of the leading relay manufacturers, supplying products in India and abroad. it is located in Banglore Mysore-NH,Bidadi,Ramangara,Banglore.'
                    ),

                  ),

                ],
              ),
            ]
        ),
      ),
    );
  }
}
