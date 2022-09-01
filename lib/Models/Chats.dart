
// Custom Post Class

import 'package:cloud_firestore/cloud_firestore.dart';

class Chats{

  late final  String? author_uid;
  late final String? author;
  late final String? message;
  late final  Timeposted;
  late final String receiver;
  late final String receiver_uid;
  late final String? ppurl;
  late final String message_uid;

  Chats(
      { required this.author_uid,
        required this.message_uid,
        required  this.message,
        required this.author,
        required  this.Timeposted,
        this.ppurl,
      }
      );

  Map<String,dynamic> toJson()=>{
    "author uid":author_uid,
    "author":author,
    "Message Time":Timeposted,
    "Profile Pic":ppurl,
    "Message Uid":message_uid,
    "Message":message,
  };

  static Chats? FromSnap(DocumentSnapshot snap){
    var snapshot= snap.data() as Map<String,dynamic>;
    Chats? Chats12=Chats(
      message: snapshot['Message'],
      author_uid: snapshot['author uid'],
      author: snapshot['author'],
      Timeposted: snapshot['Message Time'],
      ppurl: snapshot['Profile Pic'],
      message_uid: snapshot['Message Uid'],
    );

    return Chats12;






  }
}