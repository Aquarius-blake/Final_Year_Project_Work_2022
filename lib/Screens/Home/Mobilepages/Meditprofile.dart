import 'package:flutter/material.dart';
import 'package:forum3/Services/Upload.dart';
import 'package:image_picker/image_picker.dart';


class Medprofile extends StatefulWidget {
  const Medprofile({Key? key}) : super(key: key);

  @override
  State<Medprofile> createState() => _MedprofileState();
}

class _MedprofileState extends State<Medprofile> {
dynamic image;
final Upload Selection=Upload();

  final _formKey =GlobalKey<FormState>();


_selectimage(BuildContext context)async{
  return showDialog(
      context: context,
      builder: (context){
        return SimpleDialog(
          title: Text("Update Profile Picture"),
          children: [
            SimpleDialogOption(
              padding: EdgeInsets.all(15.0),
              child: Text("Take a Photo"),
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
              child: Text("Choose from gallery"),
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
              child: Text("Cancel"),
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
        Stack(
          children: [
            image!=null? CircleAvatar(
              radius: 60.0,
              backgroundImage:MemoryImage(image) ,

            ):CircleAvatar(
              radius: 60.0,
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








