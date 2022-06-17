import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:cryptochatter/entity/coins.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final todo = ModalRoute.of(context)!.settings.arguments as Coins;

    return Scaffold(
      appBar: AppBar(
        title: Text(todo.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text("${todo.description} ${RandomUsername()}"),
      ),
    );
  }
}

class RandomUsername extends StatefulWidget {
  const RandomUsername({Key? key}) : super(key: key);

  @override
  State<RandomUsername> createState() => _RandomUsernameState();
}

class _RandomUsernameState extends State<RandomUsername> {
  final _suggestions = <WordPair>[];
  final _biggerFont = const TextStyle(fontSize: 18);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      shrinkWrap: true,
      physics: ScrollPhysics(),
      itemBuilder: /*1*/ (context, i) {
        if (i.isOdd) return const Divider();
        /*2*/

        final index = i ~/ 2; /*3*/
        if (index >= _suggestions.length) {
          _suggestions.addAll(generateWordPairs().take(10)); /*4*/
        }
        return ListTile(
          title: Text(
            _suggestions[index].asPascalCase,
            style: _biggerFont,
          ),
        );
      },
    );
  }
}