import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:forum3/Screens/Forum/Forum_detail.dart';
import 'package:provider/provider.dart';

import '../../../Models/Users1.dart';
import '../../../Provider/user_provider.dart';
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
    late  User1 user1=  Provider.of<UserProvider>(context).getUser;
String uid=user1.UID!;
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('Notification')
            .doc(widget.uid)
            .collection('Notifs').orderBy('author uid')
            .where('author uid', isNotEqualTo: widget.uid)
            .orderBy('Event Time',descending: true)
            .snapshots(),
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
                  onTap: (){
                    Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context)=>Forumdetail(
                            snap: snapshot.data!.docs[index].data(),
                          ),
                        )
                    );
                  },
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
