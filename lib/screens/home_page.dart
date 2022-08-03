import 'package:flutter/material.dart';
import 'package:flutter_playground/commons/joke_card.dart';
import 'package:flutter_playground/notifiers/joke_notifier.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chuck Norris joke'),
      ),
      body: Center(
        child: Consumer<JokeNotifier>(
          builder: (context, value, child) {
            final jokes = value.jokes;

            return ListView(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                children:
                    jokes.map<JokeTile>((e) => JokeTile(joke: e)).toList());
          },
        ),
      ),
    );
  }
}
