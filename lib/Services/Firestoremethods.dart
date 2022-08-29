import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:forum3/Models/Comments.dart';
import 'package:forum3/Models/Notifs.dart';
import 'package:forum3/Models/Posts.dart';
import 'package:forum3/Services/Storagemethods.dart';

import 'package:uuid/uuid.dart';

class FirestoreMethods{
    final FirebaseFirestore _firestore=FirebaseFirestore.instance;

    //Upload post
    Future <String> Uploadpost(
        String Title,
        String Details,
        dynamic file,
        String uid,
        String author,
        String ppurl
        )async{
        String photourl;
        String err;
        try{
            if(file!=null){
                photourl=await StorageMethods().Storageip("Posts", file, true);
            }
            else{
                photourl="";
            }
            String postid= const Uuid().v1();
            Post post=Post(
                author_uid: uid,
                postuid: postid,
                title: Title,
                searchkey: Title.substring(0,1),
                detail: Details,
                author: author,
                Timeposted: DateTime.now(),
                imageUrl: photourl,
                ppurl: ppurl,
                likes: [],
            );

            _firestore.collection("Posts").doc(postid).set(
                post.toJson(),
                SetOptions(merge: true),
            );
            err="success";
            return err;
        }
        catch(e){err=e.toString();
        return err;
        }
    }

    Future<void>likepost(String postid,String author_uid,List likes,String owneruid,String author,String ppurl )async {
        try{
            if(likes.contains(author_uid)){
                await _firestore.collection("Posts").doc(postid).update(
                    {'likes':FieldValue.arrayRemove([author_uid])}
                );
            }else{
                await  _firestore.collection("Posts").doc(postid).update(
                    {'likes':FieldValue.arrayUnion([author_uid])}
                );
                String message=" Liked your post";
                String notifid=const Uuid().v1();
            Notifs nots=  Notifs(ppurl: ppurl,author_uid: author_uid, Eventuid: postid, message: message, author: author, Timeposted: DateTime.now(), owner_uid: owneruid, notifid: notifid);
            await _firestore.collection("Notification").doc(owneruid).collection("Notifs").doc(notifid).set(
                nots.toJson(),
                SetOptions(merge: true)
            );
            }

        }catch(e){
            print(e.toString());
        }
    }


    Future<String> postcomment(String postid, String text,String author_uid,String author,String ppurl) async{
        String ress;
        try{
            if(text.isNotEmpty){
                String commentid=const Uuid().v1();
                Comments comments=Comments(
                    author_uid: author_uid,
                    commentuid: commentid,
                    detail: text,
                    author: author,
                    Timeposted: DateTime.now(),
                    ppurl: ppurl
                );
                await _firestore.collection("Posts").doc(postid).collection("comments").doc(commentid).set(
                    comments.toJson(),
                    SetOptions(merge: true)
                );
                ress="Comment success";
                return ress;
            }
            return "Empty field";
        }catch(e){
            ress=e.toString();
            return ress;
        }
    }

    //Delete post
    Future<String>Deletepost(String postid)async {
        String ress="";
        try{
            await  _firestore.collection("Posts").doc(postid).delete();
            ress="Post Deleted";
            return ress;
        }
        catch(e){
            ress=e.toString();
            return ress;
        }
    }

    Future<String>Deletecomment(String postid,String commentid)async {
        String ress="";
        try{
            await  _firestore.collection("Posts").doc(postid).collection('comments').doc(commentid).delete();
            ress="Comment Deleted";
            return ress;
        }
        catch(e){
            ress=e.toString();
            return ress;
        }
    }

//Edit post
    Future<String>Editpost(String postid,String? title,String? details,dynamic image,bool upload)async{
        String ress;
        String photourl;
        try{
            if(image!=null && upload){
                photourl=await StorageMethods().Storageip("Posts", image, true);
                await  _firestore.collection("Posts").doc(postid).update({
                    'Post Time':DateTime.now(),
                    'Image Url':photourl,
                    'detail':details
                }
                );
                if(title!=""){
                    await   _firestore.collection("Posts").doc(postid).update({
                        'title':title,
                        'searchkey':title!.substring(0,1)
                    });
                }

            }else{
                photourl="";
                await  _firestore.collection("Posts").doc(postid).update({
                    'Post Time':DateTime.now(),
                    'Image Url':photourl,
                    'detail':details
                }
                );
                if(title!=""){
                    await    _firestore.collection("Posts").doc(postid).update({
                        'title':title,
                        'searchkey':title!.substring(0,1)

                    });
                }
            }
            ress="Edit Succesful";
            return ress;
        }catch(e){
            ress=e.toString();
            return ress;
        }
    }

//editcomment
    Future<String>Editcomment(String postid,String commentid,String details)async{
        String ress;
        try{
            await  _firestore.collection("Posts").doc(postid).collection('comments').doc(commentid).update({
                'detail':details,
                'Comment Time':DateTime.now()
            });
            ress="Comment Successfully Edited";
            return ress;
        }catch(e){
            ress=e.toString();
            return ress;
        }

    }

    //Edit Profile
    Future<String> EditProfile(String userid,String Fname,String Username,String DOB,String Bio,String Gender,dynamic image,String Profileurl)async{
        String ress;
        try{
            String ppurl;
            if(image!=null){
                ppurl =await StorageMethods().Storageip("Profilepic", image, false);
            }else{
                ppurl=Profileurl;
            }

            await _firestore.collection('users').doc(userid).update({
                "profilepic":ppurl,
                "Gender":Gender,
                "Full Name":Fname,
                "DateofBirth":DOB,
                "username":Username,
                "Bio":Bio,
            });


            ress="Success";
            return ress;
        }catch(e){
            ress=e.toString();
            return ress;
        }
    }


    Future<void> Updatepostpic(String postid,String ppurl)async{

        await _firestore.collection("Posts").doc(postid).update({
            "profile Pic":ppurl,
        });
    }

    Future<void> Updatecommentpic(String postid,String ppurl,String commentid)async{

        await _firestore.collection("Posts").doc(postid).collection("comments").doc(commentid).update({
            "profile Pic":ppurl,
        });
    }




}














