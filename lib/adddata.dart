import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
// void main(){
// runApp(MaterialApp(debugShowCheckedModeBanner: false,home: adddata(),));
// }
class adddata extends StatefulWidget {
  const adddata({super.key});

  @override
  State<adddata> createState() => _adddataState();
}

class _adddataState extends State<adddata> {
  
  TextEditingController _lecontroller=TextEditingController();
  TextEditingController _ticontroller=TextEditingController();
  TextEditingController _subtcontroller=TextEditingController();
  
  void add(String leading,String title, String subtitle) async{
    await FirebaseFirestore.instance.collection('blood donation').add({
      'Group': leading,
      'Name': title,
      'Phone': subtitle
    });
  }
  
  final Widget padd=SizedBox(height: 10,);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              controller: _lecontroller,
              decoration: InputDecoration(
                hintText: 'Type',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10)
              )
            ),
            ),
            padd,
            TextField(
              controller: _ticontroller,
              decoration: InputDecoration(
                hintText: 'Type Name',
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10)
                )
            ),
            ),
            padd,
            TextField(
              controller: _subtcontroller,
              decoration: InputDecoration(
                hintText: 'Type Number',
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10)
                )
            ),
            ),
            padd,
            ElevatedButton(
                onPressed: (){
                  add(_lecontroller.text, _ticontroller.text, _subtcontroller.text);
                  Navigator.pop(context);
                },
                child: Text('save'))
          ],
        ),
      ),
    );
  }
}
