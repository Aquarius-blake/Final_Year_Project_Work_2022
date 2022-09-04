import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'Comment_card.dart';

class Comdetail extends StatefulWidget {
  final postid;
  const Comdetail({Key? key,this.postid}) : super(key: key);

  @override
  State<Comdetail> createState() => _ComdetailState();
}

class _ComdetailState extends State<Comdetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection("Posts")
              .doc(widget.postid)
              .collection("comments")
              .orderBy("Comment Time",descending: true)
              .snapshots(),
          builder: (context,AsyncSnapshot<QuerySnapshot<Map<String,dynamic>>>snapshots){
            if(snapshots.connectionState==ConnectionState.waiting){
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return ListView.builder(
                itemCount: snapshots.data!.docs.length,
                itemBuilder: (context, index) => Container(
                  child: Commentcard(
                    snap: snapshots.data!.docs[index].data(),
                    postid: widget.postid,
                  ),
                )
            );
          }
      ),
    );
  }

}













