import 'package:flutter/material.dart';

class PreloadWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Image.asset('assets/main_icon.png',height: 103, width: 103),
      ),
    );
  }
}