import 'package:flutter_playground/domain/joke.dart';

Joke jokeFromMap(Map<String, dynamic> json) {
  return Joke(
    categories: json['categories'].map<String>((e) => e.toString()).toList(),
    creationDate: json['created_at'],
    iconUrl: json['icon_url'],
    id: json['id'],
    updatedAt: json['updated_at'],
    url: json['url'],
    value: json['value'],
  );
}
