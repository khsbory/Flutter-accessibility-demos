import 'package:flutter/material.dart';

class TimeValue {
    final int _key;
    final String _value;
    TimeValue(this._key, this._value);
}

class Radio4Route extends StatefulWidget {
    @override
    TimePreferencesWidgetState createState() => TimePreferencesWidgetState();
}

class TimePreferencesWidgetState extends State<Radio4Route> {
    int _currentTimeValue = 1;

    final _buttonOptions = [
        TimeValue(30,  "30 minutes"),
        TimeValue(60,  "1 hour"),

    ];

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: Text("Time Preferences"),
            ),
            body: ListView(
                padding: EdgeInsets.all(8.0),
                children: _buttonOptions.map((timeValue) => RadioListTile(
                    groupValue: _currentTimeValue,
                    title: Text(timeValue._value),
                    value: timeValue._key,
                    onChanged: (val) {
                        setState(() {
                            debugPrint('VAL = $val');
                            _currentTimeValue = val;
                        });
                    },
                )).toList(),
            ),
        );
    }
}