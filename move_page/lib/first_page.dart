import 'package:flutter/material.dart';


class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('FirstPage build()');
    return Scaffold(
      appBar: AppBar(
        title: Text('First Page'),
      ),
      body: RaisedButton(
        child: Text('다음 페이지로 이동'),
        onPressed: () async{
          
          final result = await Navigator.pushNamed(context, '/second');
          print(result);
        },
      )
    );
  }
}