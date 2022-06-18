import 'package:cryptochatter/ui/BaseAppBar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cryptochatter/ui/index.dart' as screens;

class ProfilePage extends StatefulWidget {
  final User? user;

  const ProfilePage({super.key, this.user});

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: BaseAppBar(
        title: Text("Logo"),
        appBar: AppBar(),
        widgets: <Widget>[Icon(Icons.more_vert), IconButton(
          icon: const Icon(Icons.circle_rounded),
          highlightColor: Colors.pink,
          onPressed: (){
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                  builder: (context) => screens.ProfilePage(user: widget.user)),
            );
          },
        ),],
      ),
      body: Column(
        children: [
          Text("Hello ${widget.user?.displayName}")
        ],
      ),
    );
  }

}