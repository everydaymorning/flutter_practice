// Scaffold 위젯을 사용하기 위해 머티리얼(material) 라이브러리를 사용합니다.
import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:flutter/rendering.dart';

// runApp 메소드를 사용하여 앱이 실행되면 화면에 보여질 위젯을 지정해줍니다.
void main() => runApp(MyApp());

// StatelessWidget 클래스를 상속받아 위젯으로 앱을 생성합니다.
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //final wordPair = WordPair.random();

    return MaterialApp(
      title: 'Startup Name Generator',
      home: RandomWords(),
    );
  }
}

class RandomWordsState extends State<RandomWords> {
  final List<WordPair> _suggestions = <WordPair>[];
  final TextStyle _biggerFont =
      const TextStyle(fontSize: 18, color: Colors.red);

  @override
  Widget build(BuildContext context) {
    //final WordPair wordPair = WordPair.random();
    //return Text(wordPair.asPascalCase);

    return Scaffold(
      appBar: AppBar(
        title: Text('AppBar Sample Code'),
      ),
      body: _buildSuggestions(),
      bottomNavigationBar: BottomAppBar(
          child: Container(
        height: 50.0,
      )),
      floatingActionButton: Builder(builder: (context) {
        return FloatingActionButton(
          onPressed: () {
            Scaffold.of(context).showSnackBar(
              SnackBar(
                backgroundColor: Colors.blue,
                content: Text('onPressed'),
              ),
            );
          },
          child: Icon(Icons.add),
        );
      }),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  Widget _buildSuggestions() {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemBuilder: (BuildContext _context, int i) {
        if (i.isOdd) {
          return Divider();
        }

        final int index = i ~/ 2;

        if (index >= _suggestions.length) {
          _suggestions.addAll(generateWordPairs().take(10));
        }

        return _buildRow(_suggestions[index], _context);
      },
    );
  }

  Widget _buildRow(WordPair pair, BuildContext context) {
    return ListTile(
        title: Text(
          pair.asPascalCase,
          style: _biggerFont,
        ),
        onTap: () {
          Scaffold.of(context).showSnackBar(
            SnackBar(
              content: Text(pair.asPascalCase),
              backgroundColor: Colors.red,
            ),
          );
        });
  }
}

class RandomWords extends StatefulWidget {
  @override
  RandomWordsState createState() => RandomWordsState();
}
