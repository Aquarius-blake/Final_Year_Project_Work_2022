import 'package:flutter/material.dart';


class WedProfile extends StatefulWidget {
  final snap;
  const WedProfile({Key? key,this.snap}) : super(key: key);

  @override
  State<WedProfile> createState() => _WedProfileState();
}

class _WedProfileState extends State<WedProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      appBar: AppBar(
        centerTitle: true,
title: const Text("Edit Profile"),
      ),
      body: SafeArea(
          child: Container()
      ),
    );
  }
}










