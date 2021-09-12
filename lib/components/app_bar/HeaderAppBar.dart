import 'package:flutter/material.dart';

AppBar headerAppBar(BuildContext context) {
  return AppBar(
    backgroundColor: Theme.of(context).primaryColor,
    leading: IconButton(
      icon: Icon(Icons.menu),
      tooltip: 'Menu',
      onPressed: () {},
    ),
    title: const Text(
      'GCenter',
      style: TextStyle(fontSize: 20),
    ),
    titleSpacing: 0,
    actions: <Widget>[
      IconButton(
        icon: const Icon(Icons.search),
        tooltip: 'Open search input',
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('This is a snackbar')));
        },
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      ),
    ],
  );
}
