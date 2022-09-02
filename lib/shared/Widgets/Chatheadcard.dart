import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:forum3/shared/error_handling.dart';
import 'package:intl/intl.dart';


class CHcard extends StatefulWidget {
  final snap;
  const CHcard({Key? key,this.snap}) : super(key: key);

  @override
  State<CHcard> createState() => _CHcardState();
}

class _CHcardState extends State<CHcard> {
  @override
  Widget build(BuildContext context) {
    try{
    final Timestamp timestamp = widget.snap['Chat Time'] as Timestamp;
    final DateTime dateTime = timestamp.toDate();
    final dateString = DateFormat('K:mm').format(dateTime);
    return Container(
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child:   Row(
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(widget.snap['Profile Pic']),
                backgroundColor: Colors.lightBlueAccent,
              ),
              const SizedBox(width: 10,),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${widget.snap['Receiver']}",
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    RichText(
                        text: TextSpan(
                            text: "${widget.snap['Last Message']}",
                          style: const TextStyle(
                            color: Colors.blueGrey,
                            fontStyle: FontStyle.italic,
                          ),
                        )
                    )
                  ],
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(height: 10,),
                  Text(
                      dateString,
                    style: const TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 10,)
            ],
          ),
        ),
      ),
    );
    }catch(e){
      print(e.toString());
      String error="An error occurred: ${e.toString()}";
      errormessage(error, context);
      return const Center(
          child: CircularProgressIndicator()
      );
    }
  }
}






















