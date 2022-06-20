import 'package:cryptochatter/form/line_chart.dart';
import 'package:cryptochatter/form/line_chart_simple.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cryptochatter/ui/index.dart';
import 'package:cryptochatter/entity/coins.dart';
import 'dart:convert';
import 'package:cryptochatter/ui/index.dart' as screens;
import 'BaseAppBar.dart';

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
                    builder: (context) =>
                        screens.ProfilePage(user: widget.user)),
              );
            },
          ),
        ],
      ),
      body: FutureBuilder(
        future:
            DefaultAssetBundle.of(context).loadString('assets/data/coins.json'),
        builder: (context, snapshot) {
          Map<String, dynamic> newData = json.decode(snapshot.data.toString());
          List<dynamic> dataList = newData['coins'];
          coins = dataList.map((e) => Coin(e['code'], e['name'])).toList();
          return Column(children: <Widget>[
            Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text('Trending',
                    style: Theme.of(context).textTheme.headline2)),
            Container(
                margin: const EdgeInsets.symmetric(vertical: 20.0),
                height: 200.0,
                child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: const <Widget>[
                      SimpleLineChart(),
                      SimpleLineChart(),
                      SimpleLineChart(),
                      SimpleLineChart(),
                      SimpleLineChart(),
                    ])),
            Expanded(
                child: ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                    title: Text(coins[index].symbol),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                DetailScreen(user: widget.user),
                            settings: RouteSettings(
                              arguments: coins[index],
                            ),
                          ));
                    });
              },
              itemCount: coins == null ? 0 : coins.length,
            )),
            Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text('Watchlist',
                    style: Theme.of(context).textTheme.headline2)),
            Expanded(
                child: ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                    title: Text(coins[index].symbol),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                DetailScreen(user: widget.user),
                            settings: RouteSettings(
                              arguments: coins[index],
                            ),
                          ));
                    });
              },
              itemCount: coins == null ? 0 : coins.length,
            )),
          ]);
        },
      ),
    );
  }
}
