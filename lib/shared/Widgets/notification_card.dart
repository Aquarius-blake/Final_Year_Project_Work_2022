import 'package:flutter/material.dart';

class NotifCard extends StatefulWidget {
  final snap;
  const NotifCard({Key? key,this.snap}) : super(key: key);

  @override
  State<NotifCard> createState() => _NotifCardState();
}

class _NotifCardState extends State<NotifCard> {
 late bool loading;

 @override
  void initState() {
    super.initState();
  }
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }
  @override
  void dispose() {
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
Future.delayed(Duration(microseconds: 100));
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
                  const SizedBox(width: 5,),
                  Expanded(
                    child:   Padding(
                      padding: const EdgeInsets.only(
                          left:8.0
                      ),
                      child:   Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RichText(
                              text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: widget.snap['author'],
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                        fontSize: 18,
                                      ),
                                    ),
                                    TextSpan(
                                      text: widget.snap['message'],
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontStyle: FontStyle.italic,
                                      )
                                    ),
                                    TextSpan(
                                      text: widget.snap['Event Title'],
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                            color:Colors.black,
                                      )
                                    )
                                  ]
                              )
                          ),
                        ],
                      ),
                    ),
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










