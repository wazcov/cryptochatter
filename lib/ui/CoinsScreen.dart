import 'package:flutter/material.dart';
import 'package:cryptochatter/ui/index.dart';
import 'package:cryptochatter/entity/coins.dart';
import 'dart:convert';

class CoinsScreen extends StatefulWidget {
  const CoinsScreen({Key? key}) : super(key: key);

  @override
  State<CoinsScreen> createState() => _CoinsScreenState();
}

class _CoinsScreenState extends State<CoinsScreen> {
  List<Coins> todos = [Coins("Loading...", "Loading...")];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Coins'),
      ),
      body: FutureBuilder(
        future: DefaultAssetBundle.of(context)
            .loadString('data/coins.json'),
        builder: (context, snapshot) {
          Map<String, dynamic> newData = json.decode(snapshot.data.toString());
          List<dynamic> dataList = newData['coins'];
          todos = dataList.map((e) => Coins(e['code'], e['name'])).toList();
          return ListView.builder(
            // Build the ListView
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                  title: Text(todos[index].title),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const DetailScreen(),
                          settings: RouteSettings(
                            arguments: todos[index],
                          ),
                        ));
                  });
            },
            itemCount: todos == null ? 0 : todos.length,
          );
        },
      ),
    );
  }
}