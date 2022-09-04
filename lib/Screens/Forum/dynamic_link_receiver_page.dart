import 'package:flutter/material.dart';


class dynamicHandler extends StatefulWidget {
  final postid;
  const dynamicHandler({Key? key,this.postid}) : super(key: key);

  @override
  State<dynamicHandler> createState() => _dynamicHandlerState();
}

class _dynamicHandlerState extends State<dynamicHandler> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
appBar: AppBar(
  elevation: 2.0,
  centerTitle: true,
  iconTheme: const IconThemeData(
    color: Colors.black
  ),
  title: const Text(
      "Forum Details",
  style: TextStyle(),
  ),
),
      body: SingleChildScrollView(
        child: Column(

        ),
      ),
    );
  }
}
