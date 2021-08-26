import 'package:flutter/material.dart';
import 'package:gcenter/components/BottomNavigationBar.dart';
import 'package:gcenter/components/GameCard.dart';
import 'package:gcenter/components/HeaderAppBar.dart';
import 'package:gcenter/models/Game.dart';
import 'package:gcenter/repository/GameRepository.dart';

class HomePageScreen extends StatelessWidget {
  const HomePageScreen(BuildContext context, {Key? key}) : super(key: key);

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
        child: FutureBuilder<List<Game>?>(
            future:
                GameRepository().getGamesSortedByRating(limit: 50, offset: 0),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView(
                    children: snapshot.data!
                        .map((game) => gameCard(context, game))
                        .toList());
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            }));
  }
}
