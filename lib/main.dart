import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:untitled94/adddata.dart';
import 'package:untitled94/display.dart';
import 'package:untitled94/editdata.dart';
void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options:FirebaseOptions(
        apiKey: "AIzaSyAa8MOGmq9uTQj7m24bp3r9Sx8o-JX5cSY",
        appId: "1:851653103950:android:143b3006ce8ebbd6f00e1f",
        messagingSenderId: "851653103950",
        projectId: "project12-ed816")
  );
  runApp(MaterialApp(debugShowCheckedModeBanner: false,home: donation(),));
}
class donation extends StatefulWidget {
  const donation({super.key});

  @override
  State<donation> createState() => _donationState();
}
class _donationState extends State<donation> {
  final CollectionReference bd=FirebaseFirestore.instance.collection('blood donation');
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:Scaffold(
      appBar: AppBar(
        title: Text('Blood Donation'),
        centerTitle: true,
      ),
      body: display(),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)
          => adddata()
          )
          );
        },
        child: Icon(Icons.add),
      ),
      ),
      routes:{
        'edit':(context)=>editdata(),
      },
    );
  }
}
