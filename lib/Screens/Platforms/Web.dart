
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:forum3/Provider/user_provider.dart';
import 'package:forum3/Screens/Home/Mobilepages/MDprofile.dart';
import 'package:forum3/Screens/Home/Mobilepages/Mmessages.dart';
import 'package:forum3/Screens/Home/Mobilepages/Mnotifications.dart';
import 'package:forum3/Screens/Platforms/WebSceens/Whome.dart';
import 'package:forum3/Screens/Platforms/WebSceens/Wsearch.dart';
import 'package:forum3/Screens/Platforms/WebSceens/wpost.dart';
import 'package:forum3/Services/Upload.dart';
import 'package:forum3/shared/Networkconnection.dart';
import 'package:provider/provider.dart';
import '../../Models/Users1.dart';
import '../../Services/auth.dart';


class Webview extends StatefulWidget {
  const Webview({Key? key}) : super(key: key);

  @override
  State<Webview> createState() => _WebviewState();
}
final  AuthService _auth=AuthService();
String username="";



class _WebviewState extends State<Webview> {

  int _page=0;
  int page=0;
  late PageController pageController;
  String title="home";
  Upload Selection=Upload();



  Widget Post(dynamic image){
    return image==null?SizedBox():SizedBox(
      width: MediaQuery.of(context).size.width*0.3,
      child: Image.memory(image),
    );
  }

  @override
  void initState() {
    // initial();
    pageController=PageController();
    super.initState();
  }

  void initial()async{
    /* DocumentSnapshot snap= await FirebaseFirestore.instance.collection("users").doc(FirebaseAuth.instance.currentUser!.uid).get();
    setState(() {
      username=(snap.data() as Map<String,dynamic>)['username'];
    });*/
    UserProvider _userprovider=Provider.of(context,listen: false);
    await _userprovider.Refreshuser();
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }




  void Navitap(int page){
    pageController.jumpToPage(page);
  }
  void pagechange(int page){
    setState(() {
      _page=page;
      if(_page==0){
        title="homepage";
      }
      else if(_page==1){
        title="Search";
      }
      else if(_page==2){
        title="Post";
      }
      else if(_page==3){
        title="Notifications";
      }
      else if(_page==4){
        title="Messages";
      }

    });
  }

  void nav(){
    Navitap(page);
  }


  @override
  Widget build(BuildContext context) {
    try{
      User1? user1=  Provider.of<UserProvider>(context).getUser;
      return Scaffold(
        backgroundColor: Colors.lightBlueAccent[100],
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "Welcome",
            style:TextStyle(),
          ),
        ),
        body: SafeArea(
            child: Container(
              padding:const EdgeInsets.all(10),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Card(
                          elevation: 15.0,
                          color: Colors.white,
                          shape:  RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0)
                          ),
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(50,50,50,50),
                            child: Column(

                              children: <Widget>[
                                Stack(
                                    children:<Widget>[
                                      user1.ppurl!=""? CircleAvatar(
                                        radius: 50.0,
                                        backgroundImage: NetworkImage(user1.ppurl!),
                                      ):CircleAvatar(
                                        backgroundImage: AssetImage('Assets/hac.jpg'),
                                        radius: 50,
                                      ),
                                      Positioned(
                                        bottom: -5,
                                        left: 65,
                                        child: IconButton(
                                            onPressed:() {

                                            },
                                            icon:Icon(
                                              Icons.add_a_photo,
                                              color: Colors.lightBlueAccent,
                                            )
                                        ),
                                      )
                                    ]
                                ),
                                SizedBox(height: 10,),
                                user1.Username!=null? Text(
                                  user1.Username!,
                                  style: TextStyle(

                                  ),
                                ):
                                Text("Loading"),
                                SizedBox(height: 10,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    IconButton(
                                      onPressed: (){
                                        setState(() {
                                          page=0;
                                        });
                                        Navitap(page);
                                      },
                                      icon: Icon(Icons.home),
                                      iconSize: 40.0,

                                    ),

                                    GestureDetector(
                                      onTap: (){
                                        setState(() {
                                          page=0;
                                        });
                                        Navitap(page);
                                      },
                                      child: const Text("Home",
                                        style: TextStyle(
                                          fontSize: 19.0,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width*0.055,
                                      height: MediaQuery.of(context).size.height*0.05,
                                    )
                                  ],
                                ),
                                SizedBox(),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    IconButton(
                                      onPressed: (){
                                        setState(() {
                                          page=1;
                                        });
                                        Navitap(page);
                                      },
                                      icon: FaIcon(FontAwesomeIcons.featherPointed),
                                      iconSize: 28.0,

                                    ),

                                    GestureDetector(
                                      onTap: (){
                                        setState(() {
                                          page=1;
                                        });
                                        Navitap(page);
                                      },
                                      child: Text("Post",
                                        style: TextStyle(
                                          fontSize: 19.0,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width*0.07,
                                      height: MediaQuery.of(context).size.height*0.05,
                                    )
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    IconButton(
                                      onPressed: (){
                                        setState(() {
                                          page=2;
                                        });
                                        Navitap(page);
                                      },
                                      icon: Icon(Icons.person),
                                      iconSize: 40.0,

                                    ),

                                    GestureDetector(
                                      onTap: (){
                                        setState(() {
                                          page=2;
                                        });
                                        Navitap(page);
                                      },
                                      child: Text("Profile",
                                        style: TextStyle(
                                          fontSize: 19.0,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width*0.055,
                                      height: MediaQuery.of(context).size.height*0.05,
                                    )
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    IconButton(
                                      onPressed: (){

                                        setState(() {
                                          page=3;
                                        });
                                        Navitap(page);
                                      },
                                      icon: Icon(Icons.mail_outline),
                                      iconSize: 40.0,

                                    ),

                                    GestureDetector(
                                      onTap: (){

                                        setState(() {
                                          page=3;
                                        });
                                        Navitap(page);
                                      },
                                      child: Text("Messages",
                                        style: TextStyle(
                                          fontSize: 19.0,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width*0.02,
                                      height: MediaQuery.of(context).size.height*0.05,
                                    )
                                  ],
                                ),Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    IconButton(
                                      onPressed: (){
                                        setState(() {
                                          page=4;
                                        });
                                        Navitap(page);
                                      },
                                      icon: Icon(Icons.search),
                                      iconSize: 40.0,
                                    ),
                                    GestureDetector(
                                      onTap: (){
                                        setState(() {
                                          page=4;
                                        });
                                        Navitap(page);
                                      },
                                      child: Text("Search",
                                        style: TextStyle(
                                          fontSize: 19.0,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width*0.04,
                                      height: MediaQuery.of(context).size.height*0.05,
                                    )
                                  ],
                                ),
                                SizedBox(height: 30,),
                                TextButton(
                                    onPressed: (){
                                      Navigator.pushNamed(context, '/register');
                                    },
                                    child: const Text("Create New Account",
                                      style: TextStyle(),
                                    )
                                ),TextButton(
                                    onPressed: ()async{
                                      await _auth.SignOut(user1.Guest!,user1.UID!);
                                    },
                                    child: const Text("Sign Out",
                                      style: TextStyle(),
                                    )
                                )

                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                    Flexible(
                      fit: FlexFit.tight,
                      child: Column(
                        children: <Widget>[
                          SizedBox(
                            height: MediaQuery.of(context).size.height*0.89,
                            child: Center(
                              child: Scrollbar(
                                isAlwaysShown: true,
                                controller: pageController,
                                child: PageView(
                                  children: const [
                                    Padding(
                                      padding: EdgeInsets.only(
                                          right:8.0,
                                        left:2.0
                                      ),
                                      child: WebHome(),
                                    ),
                                    wpost(),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          right: 8.0,
                                          left: 2.0),
                                      child: MDprofile(),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          right: 8.0,
                                          left :2.0),
                                      child: Mmessages(),
                                    ),
                                    Wsearch()
                                  ],

                                  controller: pageController,
                                  onPageChanged: pagechange,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(width: 10,),
                    Column(
                      children: <Widget>[
                        Center(
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width*0.3,
                            child: Card(
                                child: Center(
                                  child: Text(
                                      "Notifications"
                                  ),
                                )
                            ),
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height*0.8,
                          width: MediaQuery.of(context).size.width*0.3,
                          child: Notifications(
                            uid: user1.UID,
                          ),
                        )
                      ],
                    ),

                  ],
                ),
              ),
            )
        ),
      );
    }catch(e){
      return Netcon();
    }
  }
}
