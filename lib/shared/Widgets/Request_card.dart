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
      child: Card(),
    );
  }
}
