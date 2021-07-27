import 'package:flutter/material.dart';
import 'package:gcenter/components/BottomNavigationBar.dart';
import 'package:gcenter/components/HeaderAppBar.dart';

class HomePageScreen extends StatelessWidget {
  const HomePageScreen(BuildContext context, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: headerAppBar(context),
      body: const Center(
        child: Text(
          'This is the home page',
          style: TextStyle(fontSize: 24),
        ),
      ),
      bottomNavigationBar: bottomNavigationBar(context),
    );
  }
}
