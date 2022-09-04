import 'package:flutter/material.dart';


class dynamicHandler extends StatefulWidget {
  const dynamicHandler({Key? key}) : super(key: key);

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
  title: Text(
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
