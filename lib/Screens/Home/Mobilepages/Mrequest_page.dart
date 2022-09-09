import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:forum3/shared/Widgets/Request_card.dart';

class Request_page extends StatefulWidget {
  const Request_page({Key? key}) : super(key: key);

  @override
  State<Request_page> createState() => _Request_pageState();
}

class _Request_pageState extends State<Request_page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
appBar: AppBar(
  backgroundColor: Colors.white,
  centerTitle: true,
  iconTheme: IconThemeData(
    color: Colors.black
  ),
  title: Text(
    "Requests",
    style: TextStyle(
      color: Colors.black
    ),
  ),
),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('Requests').snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot<Map<String,dynamic>>>snapshot){
          if(snapshot.connectionState==ConnectionState.waiting){
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) => Container(
                child: RequestCard(
                  snap: snapshot.data!.docs[index].data(),
                ),
              )
          );
        },
      ),
    );
  }
}
