import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Models/Users1.dart';
import '../../Provider/user_provider.dart';


class chatcard extends StatefulWidget {
  final snap;
  const chatcard({Key? key,this.snap}) : super(key: key);

  @override
  State<chatcard> createState() => _chatcardState();
}

class _chatcardState extends State<chatcard> {
  late bool recever;
  @override
  Widget build(BuildContext context) {
    print(widget.snap['Message']);
    late  User1 user1=  Provider.of<UserProvider>(context).getUser;
    if(widget.snap['Receiver Uid']!=user1.UID){
      recever=false;
    }else{
      recever=true;
    }
    if(recever){
      return Container(
        alignment: Alignment.centerRight,
        child: Card(
          color: Colors.lightBlueAccent,
          elevation: 3.0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              RichText(
                  text: TextSpan(
                    text: widget.snap['Message'],
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  )
              ),
              Align(
                  alignment: Alignment.bottomRight,
                  child: Text(
                    "Time",
                    style: TextStyle(
                        color: Colors.blueGrey,
                        fontSize: 12
                    ),
                  )
              )
            ],
          ),
        ),
      );
    }else{
      return Align(
        alignment: Alignment.bottomRight,
        child: Container(
          alignment: Alignment.bottomRight,
          child: Card(
            color: Colors.black,
            elevation: 3.0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                RichText(
                    text: TextSpan(
                      text: widget.snap['Message'],
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    )
                ),

                Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      "Time",
                      style: TextStyle(
                          color: Colors.blueGrey,
                          fontSize: 12
                      ),
                    )
                ),
              ],
            ),
          ),
        ),
      );
    }
  }
}
