import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cryptochatter/ui/index.dart';
import 'package:cryptochatter/entity/coins.dart';
import 'dart:convert';

class CoinsScreen extends StatefulWidget {
  final User? user;
  const CoinsScreen({super.key, this.user});

  @override
  State<CoinsScreen> createState() => _CoinsScreenState();
}

class _CoinsScreenState extends State<CoinsScreen> {
  List<Coin> coins = [Coin("Loading...", "Loading...")];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Trending ${widget.user?.displayName}'),
      ),
      body: FutureBuilder(
        future: DefaultAssetBundle.of(context)
            .loadString('data/coins.json'),
        builder: (context, snapshot) {
          Map<String, dynamic> newData = json.decode(snapshot.data.toString());
          List<dynamic> dataList = newData['coins'];
          coins = dataList.map((e) => Coin(e['code'], e['name'])).toList();
          return ListView.builder(
            // Build the ListView
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                  title: Text(coins[index].symbol),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const DetailScreen(),
                          settings: RouteSettings(
                            arguments: coins[index],
                          ),
                        ));
                  });
            },
            itemCount: coins == null ? 0 : coins.length,
          );
        },
      ),
    );
  }
}