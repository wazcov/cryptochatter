import 'package:cryptochatter/ui/BaseAppBar.dart';
import 'package:cryptochatter/ui/LoginScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cryptochatter/ui/index.dart' as screens;
import 'package:cryptochatter/form/form_button.dart';
import 'package:cryptochatter/helper/fire_auth.dart';

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
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
        appBar: BaseAppBar(
          appBar: AppBar(),
          widgets: const <Widget>[],
        ),
        body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: ListView(children: [
              Center(
                  child: Text(
                "Profile",
                style: Theme.of(context).textTheme.headline1,
              )),
              SizedBox(height: screenHeight * .075),
              InputField(
                onChanged: (value) {},
                labelText: "Email",
                initialValue: widget.user?.email,
                readOnly: true,
              ),
              InputField(
                onChanged: (value) {},
                labelText: "Display Name",
                initialValue: widget.user?.displayName,
                readOnly: true,
              ),
              SizedBox(height: screenHeight * .20),
              FormButton(
                text: "Log Out",
                onPressed: () {
                  FireAuth.signOut();
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => const LoginScreen(),
                    ),
                  );
                },
              )
            ])));
  }
}
