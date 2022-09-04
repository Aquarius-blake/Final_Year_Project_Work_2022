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
  backgroundColor: Colors.white,
  elevation: 2.0,
  centerTitle: true,
  iconTheme: const IconThemeData(
    color: Colors.black
  ),
  title: const Text(
      "Forum Details",
  style: TextStyle(
    color: Colors.black
  ),
  ),
),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height*0.4,
              width: MediaQuery.of(context).size.width,
              child: Text(widget.postid),
            ),
            Divider(),
            SizedBox(
              height: MediaQuery.of(context).size.height*0.4,
              width: MediaQuery.of(context).size.width,),
          ],
        ),
      ),
    );
  }
}
