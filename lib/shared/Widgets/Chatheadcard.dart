import 'package:flutter/material.dart';


class CHcard extends StatefulWidget {
  final snap;
  const CHcard({Key? key,this.snap}) : super(key: key);

  @override
  State<CHcard> createState() => _CHcardState();
}

class _CHcardState extends State<CHcard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
child: Row(
  children: [
    CircleAvatar(),
    Column(),
  ],
),
      ),
    );
  }
}
