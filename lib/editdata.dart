import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
// void main(){
// runApp(MaterialApp(debugShowCheckedModeBanner: false,home: editdata(),));
// }
class editdata extends StatefulWidget {
  const editdata({super.key});

  @override
  State<editdata> createState() => _editdataState();
}

class _editdataState extends State<editdata> {

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

  final CollectionReference bd=FirebaseFirestore.instance.collection('blood donation');

  // TextEditingController _lecontroller=TextEditingController();
  TextEditingController _ticontroller=TextEditingController();
  TextEditingController _subtcontroller=TextEditingController();

  void update(docid){
    final data={
      'Group':selectedgroup,
      'Name':_ticontroller.text,
      'Phone':_subtcontroller.text
    };
    bd.doc(docid).update(data);
  }

  @override
  Widget build(BuildContext context) {
    final args= ModalRoute.of(context)!.settings.arguments as Map;
    selectedgroup=args['Group'];
    _ticontroller.text=args['Name'];
    _subtcontroller.text=args['Phone'];

    var docid=args['id'];
    Widget padd=SizedBox(height: 10);
    return Scaffold(
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
              controller: _subtcontroller,
              decoration: InputDecoration(
                  hintText: 'Type Number',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)
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
                onPressed: (){
                  update(docid);
                  Navigator.pop(context);
                },
                child: Text('save'))
          ],
        ),
      ),
    );;
  }
}
