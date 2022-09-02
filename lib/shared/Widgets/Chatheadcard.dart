import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
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
      print(widget.snap);
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
                backgroundImage: NetworkImage(widget.snap['PProfile Pic']),
                backgroundColor: Colors.lightBlueAccent,
              ),
              const SizedBox(width: 10,),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      //TODO:Update Firebase Data Before making changes
                      "${widget.snap['Receiver']}",
                     // "",
                      style: TextStyle(),
                    ),
                    RichText(
                        text: TextSpan(
                            text: "${widget.snap['Last Message']}",
                          style: const TextStyle(
                            color: Colors.black
                          ),
                        )
                    )
                  ],
                ),
              ),
              Text(
                  dateString,
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
              SizedBox(width: 10,)
            ],
          ),
        ),
      ),
    );
    }catch(e){
      print(e.toString());
      return Center(
          child: CircularProgressIndicator()
      );
    }
  }
}






















