import 'package:flutter/material.dart';

AppBar backAppBar(BuildContext context) {
  return AppBar(
    title: Text('text'),
    automaticallyImplyLeading: true,
    leading: IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () => Navigator.pop(context, false),
    ),
  );
}
