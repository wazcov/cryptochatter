import 'package:cryptochatter/form/line_chart_simple.dart';
import 'package:cryptochatter/ui/BottomNavBar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cryptochatter/entity/coins.dart';
import 'dart:convert';
import 'package:cryptochatter/ui/screens/index.dart' as screens;
import 'package:cryptochatter/ui/BaseAppBar.dart';

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
      bottomNavigationBar: const BottomNavBar(),
      body: FutureBuilder(
        future:
            DefaultAssetBundle.of(context).loadString('assets/data/coins.json'),
        builder: (context, snapshot) {
          Map<String, dynamic> newData = json.decode(snapshot.data.toString());
          List<dynamic> dataList = newData['coins'];
          coins = dataList.map((e) => Coin(e['code'], e['name'])).toList();
          return SingleChildScrollView(
              child: SizedBox(
                  height: MediaQuery.of(context).size.height,
                  child: Column(children: <Widget>[
                    Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text('Trending',
                            style: Theme.of(context).textTheme.headline2)),
                    Container(
                        margin: const EdgeInsets.symmetric(vertical: 1.0),
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
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (BuildContext context, int index) {
                        return ListTile(
                            title: Text(coins[index].symbol),
                            subtitle: Text(coins[index].name),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        screens.DetailScreen(user: widget.user),
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
                        child: Text('Top Gainers',
                            style: Theme.of(context).textTheme.headline2)),
                    Expanded(
                        child: ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (BuildContext context, int index) {
                        return ListTile(
                            title: Text(coins[index].symbol),
                            subtitle: Text(coins[index].name),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        screens.DetailScreen(user: widget.user),
                                    settings: RouteSettings(
                                      arguments: coins[index],
                                    ),
                                  ));
                            });
                      },
                      itemCount: coins == null ? 0 : coins.length,
                    )),
                  ])));
        },
      ),
    );
  }
}
