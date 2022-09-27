import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:forum3/shared/Widgets/post_card.dart';


class Mhome extends StatefulWidget {
  const Mhome({Key? key}) : super(key: key);

  @override
  State<Mhome> createState() => _MhomeState();
}

class _MhomeState extends State<Mhome> {
  @override

  late String sortby="Post Time";

  _options(BuildContext context)async{
    return showDialog(
        context: context,
        builder: (context){
          return SimpleDialog(
            title: const Text(
              "Sort by",
              style: TextStyle(
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold,
              ),
            ),
            children: [
              SimpleDialogOption(
                padding: const EdgeInsets.all(15.0),
                child: const Text(
                  "Recent Post",
                  style: TextStyle(
                    fontStyle: FontStyle.italic,
                  ),
                ),
                onPressed: (){
                  setState(() {
                    sortby='Post Time';
                  });
                  Navigator.pop(context);
                },
              ),
              SimpleDialogOption(
                padding: const EdgeInsets.all(15.0),
                child: const Text(
                  "Most Liked",
                  style: TextStyle(
                    fontStyle: FontStyle.italic,
                  ),
                ),
                onPressed: ()async{
                  setState(() {
                    sortby='nol';
                  });
                  Navigator.of(context).pop();
                },
              ),
              SimpleDialogOption(
                padding: const EdgeInsets.all(15.0),
                child: const Text(
                  "Cancel",
                  style: TextStyle(
                    fontStyle: FontStyle.italic,
                  ),
                ),
                onPressed: (){
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        }
    );

  }



  Widget build(BuildContext context) {
    return Scaffold(
  body: StreamBuilder(
    stream: FirebaseFirestore.instance.collection('Posts').orderBy("Post Time",descending: true).snapshots(),
      builder: (context, AsyncSnapshot<QuerySnapshot<Map<String,dynamic>>>snapshot){
      if(snapshot.connectionState==ConnectionState.waiting){
          return const Center(
            child: CircularProgressIndicator(),
          );
      }
      return ListView.builder(
        itemCount: snapshot.data!.docs.length,
          itemBuilder: (context, index) => Container(
        child: PostCard(
          snap: snapshot.data!.docs[index].data(),
        ),
      )
      );
      },
  ),
    );
  }
}
