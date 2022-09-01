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
          children: [
            RichText(
                text: TextSpan(
                  text: "${widget.snap['Message']}",
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
          alignment: Alignment.centerLeft,
         child: Card(
           color: Colors.black,
           elevation: 3.0,
           child: Column(
             children: [
               RichText(
                   text: TextSpan(
                     text: "${widget.snap['Message']}",
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
               ),
             ],
           ),
         ),
        ),
      );
    }
  }
}
