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
          appBar: AppBar(),
          widgets: <Widget>[
            //Icon(Icons.more_vert),
            // IconButton(
            //   icon: const Icon(Icons.circle_rounded),
            //   onPressed: () {
            //     Navigator.push(
            //       context,
            //       MaterialPageRoute(
            //           builder: (context) =>
            //               screens.ProfilePage(user: widget.user)),
            //     );
            //   },
            // ),
          ],
        ),
        body: Column(children: <Widget>[
          Padding(
              padding: const EdgeInsets.all(16.0),
              child: Center(
                  child: Column(
                    children: [
                      Text(
                        "Profile",
                        style: Theme
                            .of(context)
                            .textTheme
                            .headline1,
                      ),
                      Text(
                        "${widget.user?.displayName}",
                        style: Theme
                            .of(context)
                            .textTheme
                            .headline2,
                      ),
                      SizedBox(height: 30),
                      Text(
                        "${widget.user?.email}",
                        style: Theme
                            .of(context)
                            .textTheme
                            .bodyText1,
                      ),
                      Text(
                        "${widget.user?.displayName}",
                        style: Theme
                            .of(context)
                            .textTheme
                            .bodyText1,
                      ),
                    ],
                  ))
          )
        ],
        )
    );
  }

}