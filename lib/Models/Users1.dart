
// Custom User Class


import 'package:cloud_firestore/cloud_firestore.dart';

class User1{

  late final  String? UID;
  late final String? Email;
  late final String? Password;
  late final bool? Guest;
  dynamic profilepic;
  late final String? Username;
  late  String? searchkey=Username!.substring(0,1);
  late final String? DOB;
  late final String? imageurl;
  late final String? ppurl;
  late final String? Name;
  late final String? Gender;
  late final String? Bio;


  User1({ this.UID,
    this.profilepic,
    this.Guest,
    this.Username,
    this.Email,
    this.Password,
    this.DOB,
    this.imageurl,
    this.ppurl,
    this.Name,
    this.Gender,
    this.searchkey,
    this.Bio
  });

  Map<String,dynamic> toJson()=>{
    "username":Username,
    "searchkey":searchkey,
    "uid":UID,
    "email":Email,
    "password":Password,
    "DateofBirth":DOB,
    "profilepic":ppurl,
    "Full Name":Name,
    "Gender":Gender,
    "Bio":Bio
  };

  static User1? FromSnap(DocumentSnapshot snap){
    var snapshot= snap.data() as Map<String,dynamic>;
    User1? User12=User1(
        Username: snapshot['username'],
        UID: snapshot['uid'],
        Email: snapshot['Email'],
        DOB: snapshot['DateofBirth'],
        ppurl: snapshot['profilepic'],
        Name: snapshot['Full Name'],
        Gender: snapshot['Gender'],
        searchkey: snapshot['searchkey'],
        Bio: snapshot['Bio']
    );
    return User12;






  }
}