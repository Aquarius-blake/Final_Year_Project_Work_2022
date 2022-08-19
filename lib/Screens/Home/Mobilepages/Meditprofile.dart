import 'package:flutter/material.dart';


class Medprofile extends StatefulWidget {
  const Medprofile({Key? key}) : super(key: key);

  @override
  State<Medprofile> createState() => _MedprofileState();
}

class _MedprofileState extends State<Medprofile> {

  final _formKey =GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(
            color: Colors.black,
        ),
        title: const Text(
          "Edit Profile",
          style: TextStyle(
              color: Colors.black,
          ),
        ),
      ),
      body: Container(
        child: Card(
          child: ListView(
children: [
Form(
  key: _formKey,
    child: Column(
      children: [

      ],
    )
)
],
          ),
        ),
      ),
    );
  }
}








