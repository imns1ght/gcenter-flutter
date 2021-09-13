import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gcenter/components/CircularRating.dart';
import 'package:gcenter/components/app_bar/BackAppBar.dart';
import 'package:gcenter/components/app_bar/BottomNavigationBar.dart';
import 'package:gcenter/models/Cover.dart';
import 'package:gcenter/models/Game.dart';
import 'package:gcenter/models/Genre.dart';
import 'package:gcenter/models/Screenshot.dart';
import 'package:gcenter/services/rest_api_service.dart';
import 'package:gcenter/utils/helpers/text_helper.dart';
import 'package:carousel_slider/carousel_slider.dart';

class GameScreen extends StatefulWidget {
  final Game game;

  const GameScreen(BuildContext context, {Key? key, required this.game})
      : super(key: key);

  @override
  _GameScreenState createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  late Future<Cover?> cover;
  late Future<List<Genre>?> genres;
  late Future<List<Screenshot>?> screenshots;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    cover = APIService().getCoverById(id: widget.game.cover);
    genres = APIService().getGenresByList(widget.game.genres!);
    screenshots = APIService().getScreenshotsByList(widget.game.screenshots!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: backAppBar(context),
      body: buildContainer(),
      bottomNavigationBar: bottomNavigationBar(context),
    );
  }

  buildContainer() {
    return ListView(
      padding: EdgeInsets.only(bottom: 30),
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 50),
          child: Container(
            alignment: Alignment.topCenter,
            color: Colors.grey[900],
            child: Stack(
              alignment: Alignment.topCenter,
              clipBehavior: Clip.none,
              fit: StackFit.passthrough,
              children: [
                Container(
                  height: 250,
                  child: FutureBuilder(
                    future: screenshots,
                    builder: (BuildContext context,
                        AsyncSnapshot<List<Screenshot>?> snapshot) {
                      if (snapshot.hasData) {
                        return CarouselSlider(
                          options: CarouselOptions(
                            aspectRatio: 16 / 9,
                            viewportFraction: 0.99,
                            initialPage: 0,
                            enableInfiniteScroll: true,
                            reverse: false,
                            autoPlay: true,
                            autoPlayInterval: Duration(seconds: 30),
                            autoPlayAnimationDuration:
                                Duration(milliseconds: 1),
                            autoPlayCurve: Curves.linear,
                            scrollDirection: Axis.horizontal,
                          ),
                          items: snapshot.data!.map((e) {
                            return BackdropFilter(
                              filter: new ImageFilter.blur(
                                  sigmaX: 2.0, sigmaY: 2.0),
                              child: CachedNetworkImage(
                                errorWidget: (context, url, error) =>
                                    Image.asset('assets/images/empty.jpg'),
                                imageUrl: APIService()
                                    .getImageURL(size: '720p', id: e.imageId),
                              ),
                            );
                          }).toList(),
                        );
                      } else if (snapshot.hasError) {
                        return Image.asset('assets/images/empty.jpg');
                      }

                      return Container(
                        color: Colors.grey[200],
                      );
                    },
                  ),
                ),
                Positioned(
                  top: 100,
                  left: 30,
                  height: 200,
                  child: Container(
                    child: FutureBuilder(
                      future: cover,
                      builder: (BuildContext context,
                          AsyncSnapshot<Cover?> snapshot) {
                        if (snapshot.hasData) {
                          return CachedNetworkImage(
                            errorWidget: (context, url, error) =>
                                Image.asset('assets/images/empty.jpg'),
                            imageUrl: APIService().getImageURL(
                                size: '720p', id: snapshot.data!.imageId),
                          );
                        } else if (snapshot.hasError) {
                          return Image.asset('assets/images/empty.jpg');
                        }

                        return Container(
                          color: Colors.grey[200],
                        );
                      },
                    ),
                  ),
                ),
                Positioned(
                  top: 220,
                  right: 40,
                  child:
                      CircularRating(totalRating: widget.game.totalRating ?? 0),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Flexible(
                    child: Container(
                      child: Text(widget.game.name,
                          style: Theme.of(context).textTheme.headline1),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Text(
                  "${convertTimestampToDate(widget.game.firstReleaseDate!)}",
                  style: TextStyle(
                      color: Colors.black.withOpacity(0.7), fontSize: 16),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 25),
                child: Container(
                  alignment: Alignment.centerLeft,
                  child: FutureBuilder(
                    future: genres,
                    builder: (BuildContext context,
                        AsyncSnapshot<List<Genre>?> snapshot) {
                      if (snapshot.hasData) {
                        return Text(
                          snapshot.data!.map((e) => e.name).join(', '),
                          style: TextStyle(
                              color: Colors.black.withOpacity(0.7),
                              fontSize: 16),
                        );
                      }

                      return Text('');
                    },
                  ),
                ),
              ),
              Container(
                child: Text(widget.game.summary,
                    style: Theme.of(context).textTheme.bodyText1),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 25),
                child: FutureBuilder(
                  future: screenshots,
                  builder: (BuildContext context,
                      AsyncSnapshot<List<Screenshot>?> snapshot) {
                    if (snapshot.hasData) {
                      return Container(
                        height: 250,
                        child: CarouselSlider(
                          options: CarouselOptions(
                            aspectRatio: 16 / 9,
                            viewportFraction: 1,
                            enableInfiniteScroll: true,
                            initialPage: 2,
                            reverse: false,
                            autoPlay: true,
                            autoPlayInterval: Duration(seconds: 5),
                            autoPlayAnimationDuration:
                                Duration(milliseconds: 700),
                            autoPlayCurve: Curves.linear,
                            scrollDirection: Axis.horizontal,
                          ),
                          items: snapshot.data!.map((e) {
                            return CachedNetworkImage(
                              errorWidget: (context, url, error) =>
                                  Image.asset('assets/images/empty.jpg'),
                              imageUrl: APIService()
                                  .getImageURL(size: '720p', id: e.imageId),
                            );
                          }).toList(),
                        ),
                      );
                    } else if (snapshot.hasError) {
                      return Image.asset('assets/images/empty.jpg');
                    }

                    return Container(
                      color: Colors.grey[200],
                    );
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    vertical: widget.game.storyline != null ? 20 : 0),
                child: Text(widget.game.storyline != null ? "Storyline" : '',
                    style: Theme.of(context).textTheme.headline3),
              ),
              Container(
                child: Text(widget.game.storyline ?? '',
                    style: Theme.of(context).textTheme.bodyText1),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
