import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UninitHomePage extends StatelessWidget {
  const UninitHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(),
    );
  }
}
