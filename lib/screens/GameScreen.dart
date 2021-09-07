import 'package:flutter/material.dart';
import 'package:gcenter/components/app_bar/BottomNavigationBar.dart';
import 'package:gcenter/components/app_bar/HeaderAppBar.dart';
import 'package:gcenter/models/Game.dart';
import 'package:gcenter/services/rest_api_service.dart';

class GameScreen extends StatefulWidget {
  final Game game;

  const GameScreen(BuildContext context, {Key? key, required this.game})
      : super(key: key);

  @override
  _GameScreenState createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  @override
  void initState() {
    super.initState();
    // cover = APIService().getCoverById(id: widget.game.cover);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: headerAppBar(context),
      body: buildContainer(),
      bottomNavigationBar: bottomNavigationBar(context),
    );
  }

  buildContainer() {
    return Container(
      margin: EdgeInsets.all(10),
      child: Container(child: Text(widget.game.toJson().toString())),
    );
  }
}
