import 'package:flutter/material.dart';


class Medprofile extends StatefulWidget {
  const Medprofile({Key? key}) : super(key: key);

  @override
  State<Medprofile> createState() => _MedprofileState();
}

class _MedprofileState extends State<Medprofile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
appBar: AppBar(
backgroundColor: Colors.white,
  iconTheme: IconThemeData(
color: Colors.black
  ),
  title: Text(
      "Edit Profile",
  style: TextStyle(

  ),
  ),
),
    );
  }
}








