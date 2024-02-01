import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
void main(){
runApp(MaterialApp(debugShowCheckedModeBanner: false,home: display(),));
}
class display extends StatefulWidget {
  const display({super.key});
  @override
  State<display> createState() => _displayState();
}

class _displayState extends State<display> {
  final CollectionReference bd= FirebaseFirestore.instance.collection('blood donation');

  TextEditingController _lecontroller=TextEditingController();
  TextEditingController _ticontroller=TextEditingController();
  TextEditingController _subcontroller=TextEditingController();

  void delete(del){
    bd.doc(del).delete();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: bd.snapshots(),
        builder:(BuildContext context,AsyncSnapshot<QuerySnapshot<Object?>>snapshot){
          if(snapshot.hasData){
          return ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (BuildContext context, int index){
                final DocumentSnapshot snap= snapshot.data!.docs[index];
                return Card(
                  child: ListTile(
                    tileColor: Colors.cyanAccent,
                    leading: Text(snap['Group']),
                    title: Text(snap['Name']),
                    subtitle: Text(snap['Phone']),
                    trailing: Container(
                      child: Row(
                        children: [
                          IconButton(
                              onPressed: (){
                                Navigator.pushNamed(context, 'edit', arguments:
                                {
                                'Group': snap['Group'],
                                'Name': snap['Name'],
                                  'Phone': snap['Phone'],
                                  'id': snap.id
                                });
                              },
                              icon: Icon(Icons.edit,color: Colors.blue)
                          ),
                          IconButton(
                              onPressed: (){
                                delete(snap.id);
                              },
                              icon: Icon(Icons.delete,color: Colors.red)
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }
          );
          }
          return CircularProgressIndicator();
        }
    );
  }
}
