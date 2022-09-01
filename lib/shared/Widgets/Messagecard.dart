import 'package:flutter/material.dart';


class chatcard extends StatefulWidget {
  final snap;
  const chatcard({Key? key,this.snap}) : super(key: key);

  @override
  State<chatcard> createState() => _chatcardState();
}

class _chatcardState extends State<chatcard> {
  bool recever=false;
  @override
  Widget build(BuildContext context) {
    if(recever){
    return Container(
      alignment: Alignment.centerRight,
      child: Card(
        child: Column(
          children: [],
        ),
      ),

    );
    }else{
      return Container(
        alignment: Alignment.centerLeft,
       child: Card(
         child: Column(
           children: [],
         ),
       ),
      );
    }
  }
}
