import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:industrialvisit/payment1.dart';

class payment extends StatefulWidget {
  const payment({Key? key}) : super(key: key);

  @override
  State<payment> createState() => _paymentState();
}

class _paymentState extends State<payment> {

String _payment = 'payment';
  @override
  Widget build(BuildContext context) {


String _selectedGender='Credit Card';



    return
      SafeArea(
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.blue,
            ),
            body: Padding(
                padding: const EdgeInsets.all(25),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Please let us know your Payment Method:'),
                      ListTile(
                        leading: Radio<String>(
                          value: 'Credit Card',
                          groupValue: _selectedGender,
                          onChanged: (value) {
                            setState(() {
                              _selectedGender = value!;
                            });
                          },
                        ),
                        title: const Text('Credit Card'),
                      ),
                      ListTile(
                        leading: Radio<String>(
                          value: 'Debit Card',
                          groupValue: _selectedGender,
                          onChanged: (value) {
                            setState(() {
                              _selectedGender = value!;
                            });
                          },
                        ),
                        title: const Text('Debit Card'),
                      ),
                      const SizedBox(height: 25),
                      Text(_selectedGender == 'Credit Card' ? 'You Selected Credit Card ' : 'You Selected Debit Card')
                      ,

                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                            decoration: InputDecoration(
                              // prefixIcon: Icon(Icons.),
                                label: Text("Card Number"),
                                hintText: "Enter your card Number",
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20)
                                ))

                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                            decoration: InputDecoration(
                                prefixIcon: Icon(Icons.numbers),
                                label: Text("CVV Number"),
                                // hintText: "Enter your CVV Number",
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20)
                                ))
                        ),
                      ),
                      SizedBox(height: 10,),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                            decoration: InputDecoration(
                                prefixIcon: Icon(Icons.date_range),
                                label: Text("Expiry Date"),
                                // hintText: "Enter Expiry Date of your Card",
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20)
                                ))
                        ),
                      ),
                      SizedBox(height: 10,),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                            obscureText: true,
                            decoration: InputDecoration(
                                prefixIcon: Icon(Icons.lock),
                                label: Text("password"),
                                hintText: "Enter your Password",
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20)
                                ))
                        ),
                      ),
                      SizedBox(height: 10,),
                      ElevatedButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>const payment1()));},
                        style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(29.0)),primary: Colors.blue,fixedSize: Size(350, 57)),
                        child: Text("Pay Now",style: TextStyle(
                            fontSize: 18,color: Colors.white
                        )),),
                    ])
            ),
          )
      );

  }
}