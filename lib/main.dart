import 'package:flutter/material.dart';
import 'package:gcenter/screens/HomePage.dart';
import 'package:gcenter/theme/style.dart';

void main() => runApp(const GCenter());

class GCenter extends StatelessWidget {
  const GCenter({Key? key}) : super(key: key);

  static const String _title = 'GCenter';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: HomePageScreen(context),
      theme: appTheme(),
      debugShowCheckedModeBanner: false,
    );
  }
}
