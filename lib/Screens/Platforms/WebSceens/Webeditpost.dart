import 'package:flutter/material.dart';


class Webeditpost extends StatefulWidget {
  final snap;
  const Webeditpost({Key? key,this.snap}) : super(key: key);

  @override
  State<Webeditpost> createState() => _WebeditpostState();
}

class _WebeditpostState extends State<Webeditpost> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
Row(),
            SizedBox(),
            Row()
          ],
        ),
      ),
    );
  }
}
