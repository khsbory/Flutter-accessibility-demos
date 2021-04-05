import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class CustomRadioWidget<T> extends StatelessWidget {
  final T value;
  final T groupValue;
  final ValueChanged<T> onChanged;
  final double width;
  final double height;

  CustomRadioWidget({this.value, this.groupValue, this.onChanged, this.width = 32, this.height = 32});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          onChanged(this.value);
        },
        child: Container(
          height: this.height,
          width: this.width,
          decoration: ShapeDecoration(
            shape: CircleBorder(),
            gradient: LinearGradient(
              colors: [
                Colors.grey,
                Colors.black12,
              ],
            ),
          ),

          child: Center(
            child: Container(
              height: this.height - 8,
              width: this.width - 8,
              decoration: ShapeDecoration(
                shape: CircleBorder(),
                gradient: LinearGradient(
                  colors: value == groupValue ? [
                    Colors.red,
                    Colors.blue,
                  ] : [
                    Colors.yellow,
                    Colors.blueGrey,
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}