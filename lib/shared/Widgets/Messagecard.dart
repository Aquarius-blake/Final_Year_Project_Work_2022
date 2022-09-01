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
        color: Colors.lightBlueAccent,
        elevation: 3.0,
        child: Column(
          children: [
            RichText(
                text: TextSpan()
            ),
            Align(
              alignment: Alignment.bottomRight,
                child: Text(
                    "Time",
                  style: TextStyle(
                    color: Colors.blueGrey,
                  ),
                )
            )
          ],
        ),
      ),

    );
    }else{
      return Container(
        alignment: Alignment.centerLeft,
       child: Card(
         color: Colors.black,
         elevation: 3.0,
         child: Column(
           children: [
             RichText(
                 text: TextSpan()
             ),
             Align(
               alignment: Alignment.bottomRight,
                 child: Text(
                     "Time",
                 style: TextStyle(
                   color: Colors.blueGrey
                 ),
                 )
             ),
           ],
         ),
       ),
      );
    }
  }
}
