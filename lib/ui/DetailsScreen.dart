import 'package:flutter/material.dart';
import 'package:cryptochatter/entity/coins.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final coin = ModalRoute.of(context)!.settings.arguments as Coin;

    return Scaffold(
      appBar: AppBar(
        title: Text(coin.symbol),
      ),
      body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(child: Text("Coin: ${coin.name}"))
      ),
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
