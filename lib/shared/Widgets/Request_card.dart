import 'package:flutter/material.dart';
import 'package:forum3/Services/Firestoremethods.dart';
import 'package:forum3/shared/Pop_up.dart';

class RequestCard extends StatefulWidget {
  final snap;
  const RequestCard({Key? key,this.snap}) : super(key: key);

  @override
  State<RequestCard> createState() => _RequestCardState();
}

class _RequestCardState extends State<RequestCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        elevation: 2.0,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.lightBlueAccent,
                    radius: 20,
                  ),
                  RichText(
                      text: TextSpan(
                          children: [
                            TextSpan(),
                            TextSpan(
                              text: "Requested for Administrative permissions, ",
                            ),
                            TextSpan(
                                text: "Approve or Deny request?"
                            ),
                          ]
                      )
                  )
                ],
              ),
              Row(
                children: [
                  TextButton(
                      onPressed: ()async{
                        String ress= await FirestoreMethods().Approval(widget.snap['author uid']);
                        Showsnackbar(ress, context);
                      },
                      child: Text("Approve")
                  ),
                  TextButton(
                      onPressed: (){},
                      child: Text("Deny")
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}


























