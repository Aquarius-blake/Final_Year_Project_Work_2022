
// Custom Post Class

import 'package:cloud_firestore/cloud_firestore.dart';

class Chats{

  late final  String? author_uid;
  late final String? author;
  late final String? detail;
  late final  Timeposted;
  late final String? ppurl;
  late final String message_uid;

  Chats(
      { required this.author_uid,
        required this.message_uid,
        required  this.detail,
        required this.author,
        required  this.Timeposted,
        this.ppurl,
      }
      );

  Map<String,dynamic> toJson()=>{
    "author uid":author_uid,
    "author":author,
    "Comment Time":Timeposted,
    "Profile Pic":ppurl,
    "Message Uid":message_uid,
    "detail":detail,
  };

  static Chats? FromSnap(DocumentSnapshot snap){
    var snapshot= snap.data() as Map<String,dynamic>;
    Chats? Comments12=Chats(
      detail: snapshot['detail'],
      author_uid: snapshot['author uid'],
      author: snapshot['author'],
      Timeposted: snapshot['Comment Time'],
      ppurl: snapshot['Profile Pic'],
      message_uid: snapshot['Message Uid'],
    );

    return Comments12;






  }
}