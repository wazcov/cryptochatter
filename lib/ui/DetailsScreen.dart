import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cryptochatter/entity/coins.dart';
import 'package:cryptochatter/ui/index.dart' as screens;
import 'BaseAppBar.dart';

class DetailScreen extends StatelessWidget {
  final User? user;

  const DetailScreen({super.key, this.user});

  @override
  Widget build(BuildContext context) {
    final coin = ModalRoute.of(context)!.settings.arguments as Coin;

    return Scaffold(
      appBar: BaseAppBar(
        title: Text("Logo"),
        appBar: AppBar(),
        widgets: <Widget>[
          Icon(Icons.more_vert),
          IconButton(
            icon: const Icon(Icons.circle_rounded),
            highlightColor: Colors.pink,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => screens.ProfilePage(user: user)),
              );
            },
          ),
        ],
      ),
      body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(child: Text("Coin: ${coin.name}"))),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add your onPressed code here!
        },
        backgroundColor: Colors.green,
        child: const Icon(Icons.add),
      ),
    );
  }
}
