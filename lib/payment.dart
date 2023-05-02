import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:industrialvisit/homescreen.dart';

class payment extends StatefulWidget {
  const payment({Key? key}) : super(key: key);

  @override
  State<payment> createState() => _paymentState();
}

class _paymentState extends State<payment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("Images/tick.png",
                height: 50,
                width: 100,
                alignment: Alignment.topCenter,),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Text("Your payment was done successfully",
                  textAlign: TextAlign.center, selectionColor: Colors.green,),

              ),

              ElevatedButton(onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => homescreen()));
              },
                style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50.0)),
                    primary: Colors.green,
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




