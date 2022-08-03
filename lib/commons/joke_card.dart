import 'package:flutter/material.dart';
import 'package:flutter_playground/domain/joke.dart';
import 'package:url_launcher/url_launcher_string.dart';

class JokeTile extends StatelessWidget {
  final Joke joke;
  const JokeTile({required this.joke, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text(
              joke.value,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(
              height: 20,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: GestureDetector(
                  onTap: () => launchUrlString(joke.url),
                  child: Row(
                    children: const [
                      Icon(Icons.link, color: Colors.blue,),
                      SizedBox(width:5,),
                      Text(
                        'Link',
                        style: TextStyle(color: Colors.blue),
                      ),
                    ],
                  )),
            ),
            const SizedBox(
              height: 20,
            ),
            _getCategories(),
          ],
        ),
      ),
    );
  }

  Widget _getCategories() {
    return Row(
      children: joke.categories.map((e) => Text(e)).toList(),
    );
  }
}
