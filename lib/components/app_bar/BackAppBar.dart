import 'package:flutter/material.dart';

AppBar backAppBar(BuildContext context, [String? title]) {
  return AppBar(
    title: Text(
      title ?? 'GCenter',
      style: TextStyle(fontSize: 20),
    ),
    automaticallyImplyLeading: true,
    backgroundColor: Theme.of(context).primaryColor,
    leading: IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () => Navigator.pop(context, false),
    ),
  );
}
