import 'package:flutter/material.dart';

class Netcon extends StatefulWidget {
  const Netcon({Key? key}) : super(key: key);

  @override
  State<Netcon> createState() => _NetconState();
}

class _NetconState extends State<Netcon> {

late String message="Slow Internet Connection";

  Future delay()async{
   await Future.delayed(
        Duration(
          milliseconds: 100
        ),
    );
setState(() {
  message="Check Network Connection";

});
  }


  @override
  Widget build(BuildContext context) {
    delay();
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children:  [
                const Icon(
                  Icons.wifi_off,
                  size: 40,
                  color: Colors.black,
                ),
                Text(
                message,
                  style: TextStyle(),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
