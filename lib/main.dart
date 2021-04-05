import 'package:flutter/material.dart';
import 'package:accessibility_radio/screen/radio3.dart' as radio3;
import 'package:accessibility_radio/screen/radio4.dart' as radio4;
void main() => runApp(
  MaterialApp(
    title: "App",
    home: MainRoute(),
  )
);

class MainRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Main'),
      ),
      body: Center(
        child: Column(
          children: [
            
            RaisedButton(
              child: Text(' Custom radio widget'),
              onPressed: () {
                // 눌렀을 때 두 번째 route로 이동합니다.
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => radio3.Radio3Route())
                );
              },
            ),
            RaisedButton(
              child: Text('Native radio widget'),
              onPressed: () {
                // 눌렀을 때 두 번째 route로 이동합니다.
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => radio4.Radio4Route())
                );
              },
            ),
          ],
        )
      ),
    );
  }
}