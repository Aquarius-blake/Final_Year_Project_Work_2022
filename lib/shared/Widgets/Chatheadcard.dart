import 'package:flutter/material.dart';


class CHcard extends StatefulWidget {
  final snap;
  const CHcard({Key? key,this.snap}) : super(key: key);

  @override
  State<CHcard> createState() => _CHcardState();
}

class _CHcardState extends State<CHcard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child:   Row(
            children: [
              CircleAvatar(),
              SizedBox(width: 10,),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Username",
                      style: TextStyle(),
                    ),
                    RichText(
                        text: TextSpan(
                            text: "last Message",
                          style: TextStyle(
                            color: Colors.black
                          ),
                        )
                    )
                  ],
                ),
              ),
              Text("Chat Time"),
            ],

          ),
        ),
      ),
    );
  }
}






















