import 'package:cryptochatter/entity/messages.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cryptochatter/entity/coins.dart';
import 'package:cryptochatter/ui/index.dart' as screens;
import 'BaseAppBar.dart';
import 'dart:convert';

final messageJson =
    '{"messages": [{"user": "User123", "message": "This coin is cool"}, {"user": "User1343", "message": "This coin is not cool"}]}';

class DetailScreen extends StatelessWidget {
  final User? user;

  const DetailScreen({super.key, this.user});

  @override
  Widget build(BuildContext context) {
    final coin = ModalRoute.of(context)!.settings.arguments as Coin;

    Map<String, dynamic> newData = json.decode(messageJson);
    List<dynamic> dataList = newData['messages'];
    List<Message> messages =
        dataList.map((e) => Message(e['user'], e['message'])).toList();

    return Scaffold(
      appBar: BaseAppBar(
        appBar: AppBar(),
        widgets: <Widget>[
          //Icon(Icons.more_vert),
          IconButton(
            icon: const Icon(Icons.circle_rounded),
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
      body: Column(children: <Widget>[
        Padding(
            padding: const EdgeInsets.all(16.0),
            child: Center(
                child: Column(
              children: [
                Text(
                  coin.symbol,
                  style: Theme.of(context).textTheme.headline1,
                ),
                Text(
                  coin.name,
                  style: Theme.of(context).textTheme.headline2,
                ),
              ],
            ))),
        Expanded(
            child: ListView.builder(
          itemBuilder: (BuildContext context, int index) {
            return ListTile(title: Text(messages[index].user), onTap: () {});
          },
          itemCount: messages == null ? 0 : messages.length,
        ))
      ]),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add your onPressed code here!
        },
        backgroundColor: Colors.green,
        child: const Icon(Icons.edit),
      ),
    );
  }
}
