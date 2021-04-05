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
  int _radValue=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Accessibility Example In Flutter'),
      ),
      body: Center(
        child: 
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CustomRadioWidget(
                value: "0",
                groupValue: _radValue,
                onChanged: ( value) {
                  setState(() {
                    _radValue = value;
                  });
                },
              ),
              CustomRadioWidget(
                value: "1",
                groupValue: _radValue,
                onChanged: ( value) {
                  setState(() {
                    _radValue = value;
                  });
                },
              ),
          ],
        ),
        
        
      ),
    );
  }
}