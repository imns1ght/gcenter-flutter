import 'package:flutter/material.dart';

// convert to  CircularProgressIndicatorWidget statefull widget
class CircularRating extends StatefulWidget {
  final double totalRating;

  const CircularRating({Key? key, required this.totalRating}) : super(key: key);

  @override
  _CircularRatingState createState() => _CircularRatingState();
}

class _CircularRatingState extends State<CircularRating> {
  double? totalRating;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            height: 70,
            width: 70,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(50),
            ),
            child: CircularProgressIndicator(
              value: double.parse(widget.totalRating.toStringAsFixed(0)) / 100,
              backgroundColor: Colors.grey[700],
              valueColor: AlwaysStoppedAnimation<Color>(Colors.lightGreen),
              strokeWidth: 7,
            ),
          ),
          Text(
            widget.totalRating.toStringAsFixed(0),
            style: TextStyle(
                color: Colors.grey[700],
                fontSize: 38,
                fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
