
// Custom Post Class

import 'package:cloud_firestore/cloud_firestore.dart';

class Notifs{

  late final  String? author_uid;
  late final String? author;
  late final String? message;
  late final  Timeposted;
  late final String? ppurl;
  late final String Eventuid;
  late final String owner;
  late final String owner_uid;


  Notifs(
      { required this.author_uid,
        required this.Eventuid,
        required  this.message,
        required this.author,
        required  this.Timeposted,
        this.ppurl,
        required this.owner,
        required this.owner_uid
      }
      );

  Map<String,dynamic> toJson()=>{
    "author uid":author_uid,
    "author":author,
    "Event Time":Timeposted,
    "Profile Pic":ppurl,
    "Event Uid":Eventuid,
    "message":message,
    "owner":owner,
    "owner uid":owner_uid
  };

  static Notifs? FromSnap(DocumentSnapshot snap){
    var snapshot= snap.data() as Map<String,dynamic>;
    Notifs? Notif12=Notifs(
      message: snapshot['message'],
      author_uid: snapshot['author uid'],
      author: snapshot['author'],
      Timeposted: snapshot['Event Time'],
      ppurl: snapshot['Profile Pic'],
      Eventuid: snapshot['Event Uid'],
      owner_uid: snapshot['owner uid'],
      owner: snapshot['owner'],


    );

    return Notif12;






  }
}