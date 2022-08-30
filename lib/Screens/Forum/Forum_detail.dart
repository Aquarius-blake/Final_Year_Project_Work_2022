import 'package:flutter/material.dart';

class Forumdetail extends StatefulWidget {
  final snap;
  const Forumdetail({Key? key,this.snap}) : super(key: key);

  @override
  State<Forumdetail> createState() => _ForumdetailState();
}

class _ForumdetailState extends State<Forumdetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: <Widget>[

          ],
        ),
      ),
      body: Container(

      ),
    );
  }
}
