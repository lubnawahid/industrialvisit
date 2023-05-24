import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class packageadd extends StatelessWidget {
  const packageadd({Key? key}) : super(key: key);

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
        title:Text ('Add Event'),
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

                    Container(
                      padding: const EdgeInsets.all(10),
                      child: TextField(
                        controller: nameController,
                        decoration: const InputDecoration(

                            border: OutlineInputBorder(),
                            labelText: 'Package Name',
                            hintText: 'Package Name'
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
                          labelText: 'Comapany Description',
                          hintText: 'Company Description',
                        ),
                      ),

                    ),
                    Container(
                      padding: const EdgeInsets.all(10),
                      child: TextField(
                        controller: nameController,
                        decoration: const InputDecoration(

                          border: OutlineInputBorder(),
                          labelText: 'Company name',
                          hintText: 'Company name',
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(10),
                      child: TextField(
                        controller: nameController,
                        decoration: const InputDecoration(

                            border: OutlineInputBorder(),
                            labelText: 'Package Date',
                            hintText: 'Package Date'
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(10),
                      child: TextField(
                        controller: nameController,
                        decoration: const InputDecoration(

                          border: OutlineInputBorder(),
                          labelText: 'Package Time',
                          hintText: 'Package Time',
                        ),
                      ),
                    ),

                    Container(
                      padding: const EdgeInsets.all(10),
                      child: TextField(
                        controller: nameController,
                        decoration: const InputDecoration(

                          border: OutlineInputBorder(),
                          labelText: 'Accommodation',
                          hintText: 'Accommodation',
                        ),
                      ),
                    ),

                    Container(
                      padding: const EdgeInsets.all(10),
                      child: TextField(
                        controller: nameController,
                        decoration: const InputDecoration(

                          border: OutlineInputBorder(),
                          labelText: 'Food Details',
                          hintText: 'Food Details',
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(10),
                      child: TextField(
                        controller: nameController,
                        decoration: const InputDecoration(

                          border: OutlineInputBorder(),
                          labelText: 'Guide Details',
                          hintText: 'Guide Details',
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(10),
                      child: TextField(
                        controller: nameController,
                        decoration: const InputDecoration(

                          border: OutlineInputBorder(),
                          labelText: 'Package Cost',
                          hintText: 'Package Cost',
                        ),
                      ),
                    ),
                    SizedBox(height: 20,),
                    Container(
                        height: 50,
                        padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                        child: ElevatedButton(
                          child: const Text('Submit'),
                          onPressed: () {


                            print(nameController.text);
                            var passwordController;
                            print(passwordController.text);
                          },
                        )
                    ),


                  ],
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