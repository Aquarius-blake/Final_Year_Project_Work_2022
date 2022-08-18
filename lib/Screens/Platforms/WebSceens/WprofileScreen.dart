import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../Models/Users1.dart';
import '../../../Provider/user_provider.dart';
import '../../../shared/Pop_up.dart';


class Wprofile extends StatefulWidget {
  final snap;
  const Wprofile({Key? key,this.snap}) : super(key: key);

  @override
  State<Wprofile> createState() => _WprofileState();
}

class _WprofileState extends State<Wprofile> with
    TickerProviderStateMixin {
  late TabController _tabController;
  int postlen=0;
  getPostlen()async{
    try{
      QuerySnapshot snapshot=await FirebaseFirestore.instance.collection("Posts").where('author uid' ,isEqualTo: widget.snap['uid']).get();
      setState(() {
        postlen=snapshot.docs.length;
      });    }
    catch(e){
      Showsnackbar(e.toString(), context);
    }
  }
  @override
  void initState() {
    super.initState();
    _tabController = TabController( vsync:this, length: 2);
    getPostlen();
  }
  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    late  User1 user1=  Provider.of<UserProvider>(context).getUser;
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      body: SafeArea(
        child: Center(
          child: Container(
            padding: const EdgeInsets.all(40),
            child: Card(
              color: Colors.white,
              child: Container(
                padding: const EdgeInsets.all(40),
                child: ListView(
                  children:[Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CircleAvatar(
                            radius: 65,
                            backgroundImage: NetworkImage(
                                widget.snap['profilepic']
                            ),
                          ),
                          Column(
                            children: [
                              Row(
                                children: [
                                  Text(
                                    "$postlen",
                                    style: const TextStyle(
                                      fontSize: 24,
                                      fontStyle: FontStyle.italic,
                                    ),
                                  ),
                                  const SizedBox(width: 10,),
                                  const Text(
                                    "Posts",
                                    style: TextStyle(
                                        fontSize: 24,
                                        fontStyle: FontStyle.italic,
                                        fontWeight: FontWeight.bold
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(height: 20,),
                              Row(
                                children: [
                                  widget.snap['uid']!=user1.UID? ElevatedButton(
                                    onPressed: (){},
                                    child: const Padding(
                                      padding: EdgeInsets.only(
                                          left: 16.0,
                                          right: 16.0),
                                      child: Text(
                                        "Message",
                                        style: TextStyle(
                                            color: Colors.lightBlueAccent
                                        ),
                                      ),
                                    ),
                                    style: ElevatedButton.styleFrom(
                                        elevation: 6.0,
                                        shadowColor: Colors.black,
                                        primary: Colors.white,
                                        side: const BorderSide(
                                          color: Colors.blue,
                                          width: 2.0,
                                        ),

                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(100.0)
                                        )
                                    ),
                                  ):ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        elevation: 6.0,
                                        shadowColor: Colors.black,
                                        primary: Colors.white,
                                        side: const BorderSide(
                                          color: Colors.blue,
                                          width: 2.0,
                                        ),

                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(100.0)
                                        )
                                    ),
                                    onPressed: (){},
                                    child: const Padding(
                                      padding: EdgeInsets.only(
                                        left:18.0,
                                        right: 18.0,
                                      ),
                                      child: Text(
                                        "Edit Profile",
                                        style: TextStyle(
                                            color: Colors.lightBlueAccent
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                      SizedBox(height: 30.0,),
                      Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          widget.snap['username'],
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18
                          ),
                        ),
                      ),
                      Row(
                          children:[
                            Container(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Name: ${widget.snap['Full Name']}",
                                style: TextStyle(
                                    color: Colors.grey
                                ),
                              ),
                            ),
                            const Expanded(
                                child: SizedBox()
                            ),
                            widget.snap['Gender']==null|| widget.snap['Gender']==""? const SizedBox(): Container(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Gender: ${widget.snap['Gender']}",
                                style: const TextStyle(
                                    color: Colors.grey
                                ),
                              ),
                            ),
                            SizedBox(width: 80,)
                          ]
                      ),
                    ],
                  ),

                  ]
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
