import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:forum3/Screens/Platforms/WebSceens/editcomment.dart';
import 'package:forum3/Services/Firestoremethods.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../Models/Users1.dart';
import '../../Provider/user_provider.dart';
import '../../Screens/Home/Mobilepages/Meditcomment.dart';
import '../Pop_up.dart';

class Commentcard extends StatefulWidget {
  final snap;
  final postid;
  const Commentcard({Key? key,this.snap,this.postid}) : super(key: key);

  @override
  State<Commentcard> createState() => _CommentcardState();
}

class _CommentcardState extends State<Commentcard> {

  dynamic image;
  Widget Avatar(dynamic image,User1 user1){
    try{
      return image!=null?  CircleAvatar(
        radius: 20,
        backgroundImage: MemoryImage(image),
      ):widget.snap['Profile Pic']!=""? CircleAvatar(
        backgroundImage: NetworkImage(widget.snap['Profile Pic']),
        radius: 20,
      ):const CircleAvatar(
        backgroundImage: AssetImage('Assets/hac.jpg'),
        radius: 20,
      );
    }
    catch(e){
      Showsnackbar(e.toString(), context);
      return const CircleAvatar(
        backgroundImage: AssetImage('Assets/hac.jpg'),
        radius: 20,
      );
    }
  }
  @override
  Widget build(BuildContext context) {
    late  User1 user1=  Provider.of<UserProvider>(context).getUser;
    if(user1.UID==widget.snap['author uid']){
      FirestoreMethods().Updatecommentpic(widget.postid, user1.ppurl!,widget.snap['Comment Uid']);
      setState(() {

      });
    }
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 0,
        horizontal: 16,
      ),
      child: Card(
        child: Container(
          padding: const EdgeInsets.all(5.0),
          child: Column(
            children: [
              Row(
                children: [
                  Avatar(image, user1),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: 12,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: widget.snap['author'],
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                TextSpan(
                                  text: "   ${widget.snap['detail']}",
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontStyle: FontStyle.italic,
                                  ),
                                ),

                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 4.0,),
                            child: Text(
                              DateFormat.yMMMd().format(widget.snap['Comment Time'].toDate(),),
                              style: const TextStyle(
                                  color: Colors.grey,
                                  fontSize: 10,
                                  fontStyle: FontStyle.italic
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
           widget.snap['author uid']==user1.UID?   Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextButton(
                      onPressed: (){
                        if(kIsWeb){
                          Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context)=>webcomedit(
                                  snap: widget.snap,
                                  postid: widget.postid,
                                ),
                              )
                          );
                        }else{
                          Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context)=>Mobcomedit(
                                  snap: widget.snap,
                                  postid: widget.postid,
                                ),
                              )
                          );
                        }
                      },
                      child: const Text(
                        "Edit",
                        style: TextStyle(
                          color: Colors.lightBlueAccent,
                        ),
                      )
                  ),
                  TextButton(
                      onPressed: ()async{
                        String ress= await FirestoreMethods().Deletecomment(widget.postid, widget.snap['Comment Uid']);
                        Showsnackbar(ress, context);
                      },
                      child: const Text(
                        "Delete",
                        style: TextStyle(
                          color: Colors.lightBlueAccent,
                        ),
                      )
                  ),
                ],
              ):SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}
