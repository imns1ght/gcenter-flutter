import 'package:flutter/material.dart';

// convert to  CircularProgressIndicatorWidget statefull widget
class CircularProgressIndicatorWidget extends StatefulWidget {
  const CircularProgressIndicatorWidget({Key? key, double? progress})
      : super(key: key);

  @override
  _CircularProgressIndicatorWidgetState createState() =>
      _CircularProgressIndicatorWidgetState();
}

class _CircularProgressIndicatorWidgetState
    extends State<CircularProgressIndicatorWidget> {
  double? _progress;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        value: _progress,
        color: Theme.of(context).primaryColor,
      ),
    );
  }
}
