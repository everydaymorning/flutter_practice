import 'package:flutter/material.dart';
import 'package:move_page/person.dart';

class SecondPage extends StatelessWidget {
  final Person person;

  SecondPage(this.person);
  @override
  Widget build(BuildContext context) {
    print('SecondPage build()');
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Page'),

      ),
      body: Column(
        children: [
          RaisedButton(
            child: Text('이전 페이지로 이동'),
            onPressed: () {
              Navigator.pop(context, 'ok');
            },
          ),
          Text('이름: ${person.name}')
        ],
      )
    );
  }
}