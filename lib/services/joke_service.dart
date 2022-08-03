import 'dart:convert';

import 'package:flutter_playground/domain/joke.dart';
import 'package:flutter_playground/domain/joke_gateway.dart';
import 'package:flutter_playground/services/joke_mapper.dart';
import 'package:http/http.dart' as http;

const _endpoint = 'api.chucknorris.io';

class JokeService implements JokeGateway {
  @override
  Future<Joke> getRandomJoke() async {
    const path = '/jokes/random';
    Uri uri = Uri.https(_endpoint, path);
    final response = await http.get(uri);

    Map<String, dynamic> map = jsonDecode(response.body);

    return jokeFromMap(map);  
    }
}
