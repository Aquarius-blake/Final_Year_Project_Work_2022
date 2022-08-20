import 'package:flutter/material.dart';
import 'package:forum3/Services/Upload.dart';
import 'package:forum3/shared/error_handling.dart';
import 'package:image_picker/image_picker.dart';


class Medprofile extends StatefulWidget {
  final snap;
  const Medprofile({Key? key,this.snap}) : super(key: key);

  @override
  State<Medprofile> createState() => _MedprofileState();
}

class _MedprofileState extends State<Medprofile> {
  dynamic image;
  final Upload Selection=Upload();
  TextEditingController Fname=TextEditingController();
  TextEditingController Bio=TextEditingController();
  TextEditingController username=TextEditingController();



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

    }catch(e){
      errormessage(e.toString(), context);
    }    super.didChangeDependencies();
  }

  @override
  void dispose() {
    Fname.dispose();
    Bio.dispose();
    username.dispose();
    super.dispose();
  }

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
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: ListView(
              children: [
                Form(
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
                              backgroundImage: NetworkImage(widget.snap['profilepic']),
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
                        SizedBox(height: 20,),
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

                          style: TextStyle(

                          ),
                        ),
                        SizedBox(height: 20,),
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

                          style: TextStyle(

                          ),
                        ),
                        SizedBox(height: 20,),
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
                            hintText: "Enter Bio",
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
                      ],
                    )
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}








