import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../../shared/Widgets/notification_card.dart';

class Notifications extends StatefulWidget {
  final uid;
  const Notifications({Key? key,this.uid}) : super(key: key);

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('Notification').doc(widget.uid).collection('Notifs').orderBy('Event Time').snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot<Map<String,dynamic>>>snapshot){
          if(snapshot.connectionState==ConnectionState.waiting){
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) => Container(
                child: GestureDetector(
                  child: NotifCard(
                    snap: snapshot.data!.docs[index].data(),
                  ),
                ),
              )
          );
        },
      ),
    );
  }
}
