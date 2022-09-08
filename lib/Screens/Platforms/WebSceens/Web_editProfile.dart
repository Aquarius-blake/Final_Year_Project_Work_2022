import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';

import '../../../Services/Firestoremethods.dart';
import '../../../Services/Upload.dart';
import '../../../shared/Pop_up.dart';
import '../../../shared/error_handling.dart';


class WedProfile extends StatefulWidget {
  final snap;
  const WedProfile({Key? key,this.snap}) : super(key: key);

  @override
  State<WedProfile> createState() => _WedProfileState();
}

class _WedProfileState extends State<WedProfile> {

  dynamic image;
  final Upload Selection=Upload();
  TextEditingController Fname=TextEditingController();
  TextEditingController Bio=TextEditingController();
  TextEditingController username=TextEditingController();
  TextEditingController DOB=TextEditingController();
  TextEditingController gender=TextEditingController();
  late DateTime? _dateTime;

  final _formKey =GlobalKey<FormState>();


  _selectimage(BuildContext context)async{
    return showDialog(
        context: context,
        builder: (context){
          return SimpleDialog(
            title: const Text("Update Profile Picture"),
            children: [
              SimpleDialogOption(
                padding: EdgeInsets.all(15.0),
                child: const Text("Take a Photo"),
                onPressed: ()async{
                  Navigator.of(context).pop();
                  dynamic file=await Selection.uploadpic(ImageSource.camera);
                  setState(() {
                    image=file;
                  });
                },
              ),
              SimpleDialogOption(
                padding: EdgeInsets.all(15.0),
                child: const Text("Choose from gallery"),
                onPressed: ()async{
                  Navigator.of(context).pop();
                  dynamic file=await Selection.uploadpic(ImageSource.gallery);
                  setState(() {
                    image=file;
                  });
                },
              ),
              SimpleDialogOption(
                padding: EdgeInsets.all(15.0),
                child: const Text("Cancel"),
                onPressed: (){
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        }
    );
  }


  @override
  void initState() {

    super.initState();
  }

  @override
  void didChangeDependencies() {
    try {
      Fname.text = widget.snap['Full Name'];
      Bio.text=widget.snap['Bio'];
       username.text=widget.snap['username'];
       gender.text=widget.snap['Gender'];
       DOB.text=widget.snap['DateofBirth'];

    }catch(e){
      errormessage(e.toString(), context);
    }    super.didChangeDependencies();
  }

  @override
  void dispose() {
    Fname.dispose();
    Bio.dispose();
    username.dispose();
    DOB.dispose();
    gender.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    //TODO:Fix Bug(Error) before running
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Edit Profile"),
      ),
      body: Container()
    );
  }
}










