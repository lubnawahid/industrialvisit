import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class packageedit extends StatelessWidget {
  const packageedit({Key? key}) : super(key: key);

  get nameController => null;

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        title:Text ('Add Packages'),
        leading:
        IconButton( onPressed: (){
          Navigator.pop(context);
        },icon:Icon(Icons.arrow_back_ios,size: 20,color: Colors.black,)),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text('Package Details'),
                      ],
                    ),
                    SizedBox(height: 20,),
                    Container(
                      padding: const EdgeInsets.all(20),
                      child: TextField(
                        controller: nameController,
                        decoration: const InputDecoration(

                            border: OutlineInputBorder(),

                            hintText: 'J V ELECTRONICS PVT Ltd'
                        ),
                      ),
                    ),

                    Container(
                      padding: const EdgeInsets.all(10),
                      child: TextField(
                        maxLines: 5,
                        controller: nameController,
                        decoration: const InputDecoration(

                          border: OutlineInputBorder(),

                          hintText: 'Started in the year 1991 in a small way, when acceptability of Small scale manufacturers to make high end products like relays was a challenge across the globe, JVS established itself by proving its excellence and commitment to inventing and producing products of great quality. JVS has since come a long way and is one of the leading relay manufacturers, supplying products in India and abroad. it is located in Banglore Mysore-NH,Bidadi,Ramangara,Banglore.'
                          ,
                        ),
                      ),

                    ),
                    Container(
                      padding: const EdgeInsets.all(10),
                      child: TextField(
                        controller: nameController,
                        decoration: const InputDecoration(

                            border: OutlineInputBorder(),

                            hintText: 'Date : 10-08-2023'
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(10),
                      child: TextField(
                        controller: nameController,
                        decoration: const InputDecoration(

                          border: OutlineInputBorder(),

                          hintText: 'Time 10 AM',
                        ),
                      ),
                    ),
                    SizedBox(height: 20,),


                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 80.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton(
                        onPressed: (){},
                        child: Text("Update",style: TextStyle(fontSize: 15, letterSpacing: 2, color: Colors.white),),
                        style: ElevatedButton.styleFrom(
                            primary: Colors.blue,
                            padding: EdgeInsets.symmetric(horizontal: 50,vertical: 25,),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))
                        ),
                      ),

                      ElevatedButton(
                        onPressed: (){},
                        child: Text("Delete",style: TextStyle(fontSize: 15, letterSpacing: 2, color: Colors.white),),
                        style: ElevatedButton.styleFrom(
                            primary: Colors.blue,
                            padding: EdgeInsets.symmetric(horizontal: 50,vertical: 25,),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))
                        ),
                      ),


                    ],
                  ),
                ),
              ],

            ),

          ),

        ),

      ),);
  }
}

Widget makeInput({label,obsureText = false}){
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(label,style:TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w400,
          color: Colors.black87
      ),),
      SizedBox(height: 5,),
      TextField(
        obscureText: obsureText,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 0,horizontal: 10),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.grey,
            ),
          ),
          border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey)
          ),
        ),
      ),
      SizedBox(height: 30,)

    ],
  );
}