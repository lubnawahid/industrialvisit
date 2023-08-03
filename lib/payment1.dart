import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:industrialvisit/homescreen.dart';

class payment1 extends StatefulWidget {
  const payment1({Key? key}) : super(key: key);

  @override
  State<payment1> createState() => _paymentState();
}

class _paymentState extends State<payment1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("images/pay.png",
                height: 500,

                width: 300,
                alignment: Alignment.center,),
              Padding(
              padding: EdgeInsets.all(10),
                child: Text("Your payment was done successfully",
                  textAlign: TextAlign.center, selectionColor: Colors.blue,),
              ),


              ElevatedButton(onPressed: () {

                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => homescreen()));
              },
                style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50.0)),
                    primary: Colors.blue,
                    fixedSize: Size(200, 50)),
                child: Text("OK", style: TextStyle(color: Colors.white),),
              ),
            ],
          ),
        ),
      ),
    );
  }
}




