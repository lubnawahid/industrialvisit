import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class bookeddescription extends StatefulWidget {
  const bookeddescription({Key? key}) : super(key: key);

  @override
  State<bookeddescription> createState() => _bookeddescriptionState();
}

class _bookeddescriptionState extends State<bookeddescription> {
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
                  ElevatedButton(onPressed: (){
                    //Navigator.push(context, MaterialPageRoute(builder: (context)=>homescreen()));
                  },
                    style:ElevatedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.0)),primary: Colors.blue,fixedSize: Size(300, 50)),
                    child: Text("Booked",style: TextStyle(color: Colors.white),),
                  ),

                ],
              ),
            ]
        ),
      ),
    );
  }
}
