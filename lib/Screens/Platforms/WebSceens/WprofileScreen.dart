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
                child: Column(
                  children: [
                    SizedBox(width: MediaQuery.of(context).size.width,),
                    Text("sdsafdsf"),
                    Row(
                      children: [
CircleAvatar(
  radius: 65,
  backgroundImage: NetworkImage(widget.snap['profilepic']),

)
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
