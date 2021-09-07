import 'package:flutter/material.dart';
import 'package:gcenter/components/app_bar/BackAppBar.dart';
import 'package:gcenter/components/app_bar/BottomNavigationBar.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen(BuildContext context, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: backAppBar(context),
      body: const Center(
        child: Text(
          'This is the profile page',
          style: TextStyle(fontSize: 24),
        ),
      ),
      bottomNavigationBar: bottomNavigationBar(context),
    );
  }
}
