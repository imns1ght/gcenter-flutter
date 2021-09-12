import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gcenter/models/Cover.dart';
import 'package:gcenter/models/Game.dart';
import 'package:gcenter/screens/GameScreen.dart';
import 'package:gcenter/services/rest_api_service.dart';

class GameCard extends StatefulWidget {
  final Game game;
  const GameCard(BuildContext context, {Key? key, required this.game})
      : super(key: key);

  @override
  _GameCardState createState() => _GameCardState();
}

class _GameCardState extends State<GameCard> {
  late Future<Cover?> cover;

  @override
  void initState() {
    super.initState();
    cover = APIService().getCoverById(id: widget.game.cover);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute<void>(
            builder: (BuildContext context) {
              return GameScreen(context, game: widget.game);
            },
          ),
        );
      },
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        clipBehavior: Clip.antiAlias,
        elevation: 1,
        child: Expanded(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Image cover
              Expanded(
                child: Center(
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

                        return Expanded(
                          child: Center(
                            child: Container(
                              color: Colors.grey[200],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
              // Game details
              Expanded(
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.topCenter,
                      padding: EdgeInsets.only(top: 10),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            flex: 1,
                            child: ListTile(
                              title: Text(widget.game.name,
                                  style: Theme.of(context).textTheme.headline3),
                              subtitle: Text(
                                "${widget.game.totalRatingCount} Ratings",
                                style: TextStyle(
                                    color: Colors.black.withOpacity(0.7)),
                              ),
                              enableFeedback: true,
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(top: 8.0, right: 15.0),
                            child: Center(
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  CircularProgressIndicator(
                                    value: double.parse(widget.game.totalRating!
                                            .toStringAsFixed(0)) /
                                        100,
                                    backgroundColor: Colors.grey[700],
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                        Colors.lightGreen),
                                    strokeWidth: 4,
                                  ),
                                  Text(
                                    widget.game.totalRating!.toStringAsFixed(0),
                                    style: TextStyle(
                                        color: Colors.grey[700],
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    ButtonBar(
                      buttonPadding: EdgeInsets.symmetric(horizontal: 12.0),
                      alignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          onPressed: () => {},
                          icon: Icon(Icons.share),
                          color: Colors.grey,
                        ),
                        IconButton(
                          onPressed: () => {},
                          icon: Icon(Icons.favorite),
                          color: Colors.red,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
