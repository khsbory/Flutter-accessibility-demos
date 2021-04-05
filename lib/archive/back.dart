import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:accessibility_radio/archive/custom_radio_widget.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _value = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Accessibility Example In Flutter'),
      ),
      body: Center(
        child: 
        
        
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              'Accessibility',
              // textScaleFactor: 1.5,
            ),
            RaisedButton(onPressed: (){},child: Text('Simple Button'),),
            Column(
              children: <Widget>[
                
                ListTile(
                  title: Text(
                    '한국어',
                    style: Theme.of(context).textTheme.subtitle1.copyWith(color:Colors.black),
                    semanticsLabel: '안녕하세요. 만나서 반갑습니다.',
                  ),
                  leading: Radio(
                    value: 1,
                    groupValue: 1,
                    activeColor: Color(0xFF6200EE),
                    onChanged: (int value){
                      setState(() {
                        _value = value;
                      });
                    }
                  ),
                ),
                ListTile(
                  title: Text(
                    'English',
                    style: Theme.of(context).textTheme.subtitle1.copyWith(color:Colors.black),
                    semanticsLabel: 'Hello, nice to meet you',
                  ),
                  leading: Radio(
                    value: 2,
                    groupValue: 2,
                    activeColor: Color(0xFF6200EE),
                    onChanged: (int value){
                      setState(() {
                        _value = value;
                      });
                    }
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}