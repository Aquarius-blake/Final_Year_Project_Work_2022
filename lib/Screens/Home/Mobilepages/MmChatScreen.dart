import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:forum3/Screens/Home/Mobilepages/MpChatbody.dart';
import 'package:forum3/Services/Firestoremethods.dart';
import 'package:forum3/shared/Pop_up.dart';
import 'package:provider/provider.dart';
import '../../../Models/Users1.dart';
import '../../../Provider/user_provider.dart';


class MpchatScreen extends StatefulWidget {
  final snap;
  const MpchatScreen({Key? key,this.snap}) : super(key: key);

  @override
  State<MpchatScreen> createState() => _MpchatScreenState();
}

class _MpchatScreenState extends State<MpchatScreen> {
  TextEditingController text=TextEditingController();


  @override
  void dispose() {
    text.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    late  User1 user1=  Provider.of<UserProvider>(context).getUser;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        iconTheme:const IconThemeData(
          color: Colors.black,
        ),
        title: Row(
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(widget.snap['Profile Pic']),
            ),
            SizedBox(width: 20,),
            Text(
              "${widget.snap['Receiver']}",
              style: const TextStyle(
                  color: Colors.black
              ),
            ),
          ],
        ),
      ),
      body: SizedBox(
          height: MediaQuery.of(context).size.height*0.8,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Chatbody(
              snap: widget.snap,
            ),
          )
      ),
      bottomNavigationBar: SafeArea(
          child: Container(
            height: kToolbarHeight,
            margin: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom
            ),
            padding: const EdgeInsets.only(
              left: 16,
              right: 8,
            ),
            child: Row(
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(user1.ppurl!),
                  radius: 18,
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 12.0,
                        right: 1.0
                    ),
                    child: TextField(
                      controller: text,
                      decoration: InputDecoration(
                        hintText: "Chat as ${user1.Username}",
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: ()async{
                    String? ress= await FirestoreMethods().Sendmessage(user1.Username!, user1.UID!, widget.snap['Receiver'], widget.snap['Receiver uid'], text.text,widget.snap['Profile Pic'],user1.ppurl!);
                    Showsnackbar(ress!, context);
                  },
                  child: const FaIcon(
                      FontAwesomeIcons.featherPointed
                  ),
                  style: ElevatedButton.styleFrom(
                      elevation: 0.0,
                      shadowColor: Colors.black,
                      primary: Colors.lightBlueAccent,
                      side: const BorderSide(
                        color: Colors.white70,
                        width: 2.0,
                      ),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100.0)
                      )
                  ),
                )
              ],
            ),
          )
      ),
    );

  }
}
































