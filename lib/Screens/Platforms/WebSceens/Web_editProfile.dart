import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import '../../../Services/Firestoremethods.dart';
import '../../../Services/Upload.dart';
import '../../../shared/Pop_up.dart';


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
     Fname.text = widget.snap['Full Name'];
     Bio.text=widget.snap['Bio'];
    username.text=widget.snap['username'];
     gender.text=widget.snap['Gender'];
widget.snap['DateofBirth']==null?DOB.text="": DOB.text=widget.snap['DateofBirth'];

     super.initState();
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
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Edit Profile"),
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Card(
            elevation: 3,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(60.0)
            ),
            child: ListView(
              children: [
                Container(
                  padding: const EdgeInsets.all(50.0),
                  child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          Stack(
                            children: [
                              image!=null? CircleAvatar(
                                radius: 60.0,
                                backgroundImage:MemoryImage(image) ,
                              ):CircleAvatar(
                                radius: 60.0,
                                backgroundImage: NetworkImage(
                                     widget.snap['profilepic']),
                              ),
                              Positioned(
                                  bottom: -5,
                                  left: 65,
                                  child: IconButton(
                                      onPressed: ()=>_selectimage(context),
                                      icon: const Icon(
                                        Icons.add_a_photo,
                                        color: Colors.white,
                                      )
                                  )
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            controller: Fname,
                            validator: (val)=>val!.isEmpty ? "Enter Your Full Name" : null,
                            onChanged: (val){
                              setState(() {
                                Fname.text=val;
                              });
                            },
                            decoration: InputDecoration(
                              label: const Text("Full Name"),
                              hintText: "Enter Full Name",
                              filled: true,
                              fillColor: Colors.white70,
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Colors.redAccent
                                ),
                                borderRadius: BorderRadius.circular(100.0),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(100.0),

                              ),
                            ),

                            style: const TextStyle(),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            controller: username,
                            validator: (val)=>val!.isEmpty ? "Enter Your Username" : null,
                            onChanged: (val){
                              setState(() {
                                username.text=val;
                              });
                            },
                            decoration: InputDecoration(
                              label: const Text("Username"),
                              hintText: "Enter Nick Name",
                              filled: true,
                              fillColor: Colors.white70,
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Colors.redAccent
                                ),
                                borderRadius: BorderRadius.circular(100.0),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(100.0),

                              ),
                            ),

                            style: const TextStyle(
                            ),
                          ),
                          const SizedBox(height: 20,),
                          TextFormField(
                            controller: gender,
                            validator: (val)=>val!.isEmpty ? "Enter Your Username" : null,
                            onChanged: (val){
                              setState(() {
                                gender.text=val;
                              });
                            },
                            decoration: InputDecoration(
                              label: const Text("Gender"),
                              hintText: "Enter Gender",
                              filled: true,
                              fillColor: Colors.white70,
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Colors.redAccent
                                ),
                                borderRadius: BorderRadius.circular(100.0),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(100.0),

                              ),
                            ),

                            style: const TextStyle(),
                          ),
                          const SizedBox(height: 10,),
                          ListTile(
                            leading: GestureDetector(
                              onTap: (){
                                showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime(1900),
                                    lastDate: DateTime.now()
                                ).then((value){
                                  setState(() {
                                    _dateTime=value;
                                    if(_dateTime!=null) {
                                      DOB.text = " ${_dateTime!.year}  /  ${_dateTime!.month}  /  ${_dateTime!.day}";
                                    }
                                  });
                                });
                              },
                              child: const FaIcon(
                                  FontAwesomeIcons.calendar
                              ),
                            ),
                            horizontalTitleGap: 0.0,
                            title: TextFormField(
                              textAlign: TextAlign.center,
                              controller: DOB,
                              validator: (val)=>val!.isEmpty ? "Enter Your Date of Birth" : null,
                              onChanged: (val){
                                setState(() {
                                  DOB.text=val;
                                });
                              },
                              decoration: InputDecoration(
                                label: const Text("Date of Birth"),
                                hintText: "Enter Date of Birth",
                                filled: true,
                                fillColor: Colors.white70,
                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Colors.redAccent
                                  ),
                                  borderRadius: BorderRadius.circular(100.0),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(100.0),

                                ),
                              ),

                              style: const TextStyle(),
                            ),
                          ),
                          const SizedBox( height: 10,),
                          TextFormField(
                            maxLines: 8,
                            controller: Bio,
                            onChanged: (val){
                              setState(() {
                                Bio.text=val;
                              });
                            },
                            decoration: InputDecoration(
                              label: const Text(
                                "Bio",
                                textAlign: TextAlign.start,
                              ),
                              floatingLabelAlignment: FloatingLabelAlignment.start,
                              floatingLabelBehavior: FloatingLabelBehavior.always,
                              hintText: "Write Something about yourself",
                              filled: true,
                              fillColor: Colors.white70,
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Colors.redAccent
                                ),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),

                              ),
                            ),

                            style: const TextStyle(),
                          ),
                          const SizedBox(height: 20,),
                          Center(
                            child: ElevatedButton(
                              onPressed: ()async{
                                  String ress= await FirestoreMethods().EditProfile(widget.snap['uid'], Fname.text, username.text, DOB.text, Bio.text, gender.text, image, widget.snap['profilepic']);
                                  Showsnackbar(ress, context);

                              },
                              child: const Padding(
                                padding: EdgeInsets.only(
                                    left:32.0,
                                    right: 32.0
                                ),
                                child: Text(
                                  "Save",
                                  style: TextStyle(
                                    color: Colors.lightBlueAccent,
                                  ),
                                ),
                              ),
                              style: ElevatedButton.styleFrom(
                                  elevation: 6.0,
                                  shadowColor: Colors.black,
                                  primary: Colors.white,
                                  side: const BorderSide(
                                    color: Colors.blue,
                                    width: 2.0,
                                  ),

                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(100.0)
                                  )
                              ),
                            ),
                          ),
                          const SizedBox(height: 20,),
                        ],
                      )
                  ),
                )
              ],
            ),
          ),
        ),
      )
    );
  }
}










