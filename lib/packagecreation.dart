import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:industrialvisit/packagecreation1.dart';
import 'package:shared_preferences/shared_preferences.dart';

class packagecreation extends StatefulWidget {
  const packagecreation({Key? key}) : super(key: key);

  @override
  State<packagecreation> createState() => _packagecreationState();
}

class _packagecreationState extends State<packagecreation> {


  DateTime selectedDate = DateTime.now();
  late SharedPreferences prefs;
  late String startDate;
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime.now(),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        startDate =
        '${selectedDate.year}-${selectedDate.month}-${selectedDate.day}';
      });
    }
  }
  @override
  Widget build(BuildContext context) {



    return Scaffold(
      appBar: AppBar(
        title: Text("Package Creation"),


      ),
      body: SingleChildScrollView(
        child:   Column(

          mainAxisAlignment:MainAxisAlignment.center,

          children: [

            Text("Comment Your Favourite Spot Here!",style: TextStyle(color: Colors.black),),

            SizedBox(height: 20,),

            Padding(

              padding: const EdgeInsets.all(8),

              child: TextField(

                decoration: InputDecoration(

                  labelText: "company name",

                  hintText: "company name",

                  border: OutlineInputBorder(borderRadius:BorderRadius.circular(30)),





                ),

              ),

            ),

            Padding(

                padding: const EdgeInsets.all(8),

                child: TextField(

                  decoration: InputDecoration(





                    labelText: "place",

                    hintText: "place",

                    border: OutlineInputBorder(borderRadius:BorderRadius.circular(30)),

                  ),

                )  ),

            Padding(

                padding: const EdgeInsets.all(8),

                child: TextField(

                  decoration: InputDecoration(





                    labelText: "place",

                    hintText: "place",

                    border: OutlineInputBorder(borderRadius:BorderRadius.circular(30)),

                  ),

                )  ),

            Padding(

                padding: const EdgeInsets.all(8),
              child: Row(
                children: [
                  ElevatedButton(
                    onPressed: () => _selectDate(context),
                    child: const Text('Select date'),

                  ),SizedBox(width: 20,),
                  Container(
                    height: 45,
                    width: 150,
                    margin: const EdgeInsets.all(15.0),
                    padding: const EdgeInsets.all(3.0),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black26)),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Text(
                        '${selectedDate.year}-${selectedDate.month}-${selectedDate.day}',
                        style: TextStyle(fontSize: 16, color: Colors.black38),
                      ),
                    ),
                  ),

                ],
              ),
            ),
                // child: TextField(
                //
                //   decoration: InputDecoration(
                //
                //
                //
                //
                //
                //     labelText: "date",
                //
                //     hintText: "date",
                //
                //     border: OutlineInputBorder(borderRadius:BorderRadius.circular(30)),
                //
                //   ),
                //
                // )  ),





            Padding(

                padding: const EdgeInsets.all(8),

                child: TextField(



                  decoration: InputDecoration(





                    labelText: "days",

                    hintText: "days",

                    border: OutlineInputBorder(borderRadius:BorderRadius.circular(30)),

                  ),

                )  ),









            SizedBox(height: 20,),

            ElevatedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>const packagecretion1()));
            },style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.0)),primary: Colors.blue,fixedSize: Size(300,50)),





              child: Text('Create',style: TextStyle(color: Colors.white),),

            ),





          ],
        ),


      ),

    );




  }

}





