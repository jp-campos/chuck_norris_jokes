import 'package:flutter/cupertino.dart';
import 'package:flutter_playground/domain/joke.dart';
import 'package:flutter_playground/domain/joke_gateway.dart';

class JokeNotifier extends ChangeNotifier {
  final JokeGateway _jokeGateway;

  final List<Joke> jokes = [];

  JokeNotifier(this._jokeGateway) {
    _get20DifferentJokes();
  }

  void _get20DifferentJokes() async {
    Map<String, Joke> jokeMap = {};
    int i = 0;
    while (i < 20) {
      Joke j = await _getRandomJoke();
      if (!jokeMap.containsKey(j.id)) {
        jokeMap[j.id] = j;
        i++;
      }
    }

    jokeMap.forEach(
      (key, value) => jokes.add(value),
    );

    notifyListeners();
  }

  Future<Joke> _getRandomJoke() async {
    return _jokeGateway.getRandomJoke();
  }
}
