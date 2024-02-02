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

  final bloodgroup =[
    '',
    'A+',
    'A-',
    'B+',
    'B-',
    'O+',
    'O-',
    'AB+',
    'AB-',
  ];
  late String selectedgroup;

  // TextEditingController _lecontroller=TextEditingController();
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
      appBar: AppBar(
        title: Text('Add Donor'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
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
              maxLength: 10,
              keyboardType: TextInputType.number,
              controller: _subtcontroller,
              decoration: InputDecoration(
                hintText: 'Type Number',
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                )
            ),
            ),
            padd,
            DropdownButtonFormField(
              decoration: InputDecoration(
                hintText: 'Group'
              ),
                items: bloodgroup.map((e) => DropdownMenuItem(
                    child: Text(e),
                  value: e,
                ))
                .toList(),
                onChanged:(val) {
                selectedgroup= val!;
                }
            ),
            padd,
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red
                ),
                onPressed: (){
                  add( selectedgroup, _ticontroller.text, _subtcontroller.text);
                  Navigator.pop(context);
                },
                child: Text('save'))
          ],
        ),
      ),
    );
  }
}
