import 'package:flutter/material.dart';
import 'package:gcenter/components/app_bar/BottomNavigationBar.dart';
import 'package:gcenter/components/GameCard.dart';
import 'package:gcenter/components/app_bar/HeaderAppBar.dart';
import 'package:gcenter/models/Game.dart';
import 'package:gcenter/services/rest_api_service.dart';

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
            future: APIService().getGamesSortedByRating(limit: 1, offset: 0),
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
