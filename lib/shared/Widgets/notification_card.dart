import 'package:flutter/material.dart';

class NotifCard extends StatefulWidget {
  final snap;
  const NotifCard({Key? key,this.snap}) : super(key: key);

  @override
  State<NotifCard> createState() => _NotifCardState();
}

class _NotifCardState extends State<NotifCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child:  Card(
        elevation: 2.0,
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            children: [
              Row(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.lightBlueAccent,
                     backgroundImage: NetworkImage(widget.snap['Profile Pic']),
                  ),
                  SizedBox(width: 5,),
                  Text(
                    widget.snap['author'],
                    style: TextStyle(
                        fontWeight: FontWeight.bold
                    ),
                  ),
                  SizedBox(),
Column(
  children: [
        RichText(
        text: TextSpan(

        )
    ),
  ],
)
                ],
              ),
             /* Row(
                children: [
                  Text(
                    widget.snap['message'],
                    style: const TextStyle(
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                //TODO: Fix null value bug
                /*  Text(
                    widget.snap['Event Title'],
                    style: TextStyle(
                      fontStyle: FontStyle.italic,
                    ),
                  ),*/
                ],
              ),*/
            ],
          ),
        ),
      ),
    );
  }
}










