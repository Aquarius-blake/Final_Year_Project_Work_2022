import 'package:flutter/material.dart';

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
                )
                ],
              ),
              Row(
                children: [

                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
