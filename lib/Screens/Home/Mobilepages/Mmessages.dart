import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Mmessages extends StatefulWidget {
  const Mmessages({Key? key}) : super(key: key);

  @override
  State<Mmessages> createState() => _MmessagesState();
}

class _MmessagesState extends State<Mmessages> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
body: SafeArea(
    child: Container(

    )
),
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
      child: FaIcon(FontAwesomeIcons.rocketchat),),
    );
  }
}
