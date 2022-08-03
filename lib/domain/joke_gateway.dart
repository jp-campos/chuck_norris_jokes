import 'package:flutter_playground/domain/joke.dart';

abstract class JokeGateway {
  Future<Joke> getRandomJoke();
}
