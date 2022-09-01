import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:forum3/shared/Widgets/Messagecard.dart';

class Chatbody extends StatefulWidget {
  final snap;
  const Chatbody({Key? key,this.snap}) : super(key: key);

  @override
  State<Chatbody> createState() => _ChatbodyState();
}

class _ChatbodyState extends State<Chatbody> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  StreamBuilder(
        stream: FirebaseFirestore.instance.collection('Chats').snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot<Map<String,dynamic>>>snapshot){
          if(snapshot.connectionState==ConnectionState.waiting){
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) => Container(
                child: chatcard(
                  snap: snapshot.data!.docs[index].data(),
                ),
              )
          );
        },
      ),
    );
  }
}
