import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:forum3/Screens/Home/Mobilepages/Mcomments_screen.dart';
import 'package:forum3/Screens/Home/Mobilepages/Meditpost.dart';
import 'package:forum3/Screens/Platforms/WebSceens/Webed.dart';
import 'package:forum3/Services/Firestoremethods.dart';
import 'package:forum3/shared/Pop_up.dart';
import 'package:forum3/shared/Widgets/like_animation.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../../Models/Users1.dart';
import '../../Provider/user_provider.dart';
import '../../Screens/Platforms/WebSceens/Wcomments_screen.dart';

class PostCard extends StatefulWidget {
  final snap;
  const PostCard({ Key? key,this.snap}) : super(key: key);

  @override
  State<PostCard> createState() => _PostCardState();
}


class _PostCardState extends State<PostCard> {
  bool islikeanimating=false;
  bool liked=false;
  int commentlen=0;

//more options
  _options(BuildContext context)async{
    return showDialog(
        context: context,
        builder: (context){
          return SimpleDialog(
            title: const Text(
                "More options",
              style: TextStyle(
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold,
              ),
            ),
            children: [
              SimpleDialogOption(
                padding: const EdgeInsets.all(15.0),
                child: const Text(
                    "Edit Post",
                  style: TextStyle(
                    fontStyle: FontStyle.italic,
                  ),
                ),
                onPressed: (){
                  Navigator.of(context).pop();
                  if(kIsWeb){
                    Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context)=>Webed(
                            snap: widget.snap,
                          ),
                        )
                    );
                  }else{
                    Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context)=>Mobeditpost(
                            snap: widget.snap,
                          ),
                        )
                    );
                  }
                },
              ),
              SimpleDialogOption(
                padding: EdgeInsets.all(15.0),
                child: const Text(
                    "Delete",
                  style: TextStyle(
                      fontStyle: FontStyle.italic,
                  ),
                ),
                onPressed: ()async{
                  String ress=  await FirestoreMethods().Deletepost(widget.snap['Post Uid']);
                  Showsnackbar(ress, context);
                  Navigator.of(context).pop();
                },
              ),
              SimpleDialogOption(
                padding: const EdgeInsets.all(15.0),
                child: const Text(
                  "Cancel",
                  style: TextStyle(
                      fontStyle: FontStyle.italic,
                  ),
                ),
                onPressed: (){
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        }
    );

  }



  //dynamic _image;
  Widget Postimage(dynamic image,BuildContext context,User1 user1){
    if(image==""){
      setState(() {
        image=null;
      });
    }
    return image!=null? GestureDetector(
      onDoubleTap: ()async{
        await FirestoreMethods().likepost(
            widget.snap['Post Uid'],
            user1.UID!,
            widget.snap['likes'],
            widget.snap['author uid'],
            user1.Username!,
            user1.ppurl!,
            widget.snap['title']

        );
        setState(() {
          islikeanimating=true;
        });
      },
      child: Stack(
        alignment: Alignment.center,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width*0.7,
            child: Image.network(image),
          ),
          AnimatedOpacity(
            duration: Duration(milliseconds: 200),
            opacity: islikeanimating?1:0,
            child: likeAnimation(
              child: const Icon(
                Icons.favorite,
                color: Colors.redAccent,
                size: 60,
              ),
              isAnimating: islikeanimating,
              duration: const Duration(
                  milliseconds: 400),
              onEnd: (){
                setState(() {
                  islikeanimating=false;
                });
              },
            ),
          )
        ],
      ),
    ):SizedBox();
  }


  getcommentlen()async{
    try{
      QuerySnapshot snapshot=await FirebaseFirestore.instance.collection("Posts").doc(widget.snap['Post Uid']).collection("comments").get();
      setState(() {
        commentlen=snapshot.docs.length;
      });    }
    catch(e){
      Showsnackbar(e.toString(), context);
    }
  }

  void likedf(String authoruid,List list){
    setState(() {
      if(list.contains(authoruid)){
        liked=true;
      }else{liked=false;}
    });
  }
  @override
  void initState() {
    super.initState();
    getcommentlen();
  }

  @override
  void dispose() {
    getcommentlen().dispose;
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    late  User1 user1=  Provider.of<UserProvider>(context).getUser;
    if(user1.UID==widget.snap['author uid']){
      FirestoreMethods().Updatepostpic(widget.snap['Post Uid'], user1.ppurl!);
      setState(() {

      });
    }

    String authoruid=user1.UID!;
    List list=widget.snap['likes'];
    likedf(authoruid, list);
    return Container(
      padding: const EdgeInsets.only(
        top: 5,
        left: 15,
        right: 15,
        bottom: 5,
      ),
      child: Card(
        child: Container(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Row(
                children: [

                  CircleAvatar(
                    radius: 16,
                    backgroundImage: NetworkImage(widget.snap['Profile Pic']),
                  ),
                  Expanded(
                      child: Padding(
                          child:Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.snap['author'],
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold
                                ),)
                            ],
                          ) ,
                          padding:const EdgeInsets.only(
                              left: 10.0
                          )
                      )
                  ),
                  widget.snap['author uid']==user1.UID? IconButton(
                    onPressed: ()=>_options(context),
                    icon: const Icon(
                      Icons.more_vert,
                      color: Colors.black,
                    ),
                  ):const SizedBox()
                ],
              ),
              Container(
                padding:const EdgeInsets.only(
                  top: 5,
                ),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width*0.8,
                  child: Text(
                    widget.snap['title'],
                    style: const TextStyle(
                      fontSize: 22,
                    ),
                  ),
                ),
              ),
              Container(
                padding:const EdgeInsets.only(
                  top: 5,
                ),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width*0.8,
                  child: Text(
                    widget.snap['detail'],
                    style: const TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10,),
              Postimage(widget.snap['Image Url'], context,user1),
              Container(
                padding: const EdgeInsets.only(
                  top: 3.0,
                ),
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child:   Text(
                    DateFormat.yMMMd().format(widget.snap['Post Time'].toDate(),),
                    style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 12,
                        fontStyle: FontStyle.italic
                    ),

                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 30,
                ),
                child: Row(
                  children: [
                    Text(
                      "${widget.snap['likes'].length}",
                    ),
                    likeAnimation(
                      isAnimating: widget.snap['likes'].contains(user1.UID),
                      smallLike: true,
                      child: IconButton(
                          onPressed: ()async{
                            await   FirestoreMethods().likepost(
                              widget.snap['Post Uid'],
                              user1.UID!,
                              widget.snap['likes'],
                              widget.snap['author uid'],
                              user1.Username!,
                              user1.ppurl!,
                              widget.snap['title'],
                            );
                          },
                          icon: liked? const Icon(
                            Icons.favorite,
                            color: Colors.red,
                          )
                              : const Icon(
                            Icons.favorite_border_outlined,
                            color: Colors.black,
                          )
                      ),
                    ),
                    const Expanded(
                        child: SizedBox()
                    ),
                    Text("$commentlen"),
                    IconButton(
                        onPressed: (){
                          if(kIsWeb){
                            Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context)=>Wcommentd(
                                    snap: widget.snap,
                                  ),
                                )
                            );
                          }else{
                            Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context)=>McommentsScreen(
                                    snap: widget.snap,
                                  ),
                                )
                            );
                          }
                        },
                        icon: const FaIcon(
                          FontAwesomeIcons.comments,
                          color: Colors.black,
                        )
                    ),
                    const Expanded(
                        child: SizedBox()
                    ),
                    IconButton(
                        onPressed: (){},
                        icon: const Icon(
                          Icons.share,
                          color: Colors.black,
                        )
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
