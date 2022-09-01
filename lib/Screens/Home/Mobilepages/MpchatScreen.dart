import 'package:flutter/material.dart';


class MpchatScreen extends StatefulWidget {
  final snap;
  const MpchatScreen({Key? key,this.snap}) : super(key: key);

  @override
  State<MpchatScreen> createState() => _MpchatScreenState();
}

class _MpchatScreenState extends State<MpchatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        iconTheme:const IconThemeData(
          color: Colors.black,
        ),
        title: Row(
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(widget.snap['profilepic']),
            ),
            SizedBox(width: 20,),
            Text(
                "${widget.snap['username']}",
            style: const TextStyle(
color: Colors.black
            ),
            ),
          ],
        ),
      ),
      body: Container(),
    );
  }
}
