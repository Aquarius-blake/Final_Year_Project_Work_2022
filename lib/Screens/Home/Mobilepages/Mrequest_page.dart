import 'package:flutter/material.dart';

class Request_page extends StatefulWidget {
  const Request_page({Key? key}) : super(key: key);

  @override
  State<Request_page> createState() => _Request_pageState();
}

class _Request_pageState extends State<Request_page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
appBar: AppBar(
  backgroundColor: Colors.white,
  iconTheme: IconThemeData(
    color: Colors.black
  ),
  title: Text(
    "Requests",
    style: TextStyle(
      color: Colors.black
    ),
  ),
),
    );
  }
}
