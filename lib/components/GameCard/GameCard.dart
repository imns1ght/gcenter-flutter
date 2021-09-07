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
        child: Column(
          children: [
            ListTile(
              title: Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Text(widget.game.name,
                    style: Theme.of(context).textTheme.headline3),
              ),
              subtitle: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Text(
                  widget.game.totalRating!.toStringAsFixed(0) +
                      "/100 - ${widget.game.totalRatingCount} Ratings",
                  style: TextStyle(color: Colors.black.withOpacity(0.7)),
                ),
              ),
              enableFeedback: true,
            ),
            // Image Cover
            Container(
              child: FutureBuilder(
                future: cover,
                builder:
                    (BuildContext context, AsyncSnapshot<Cover?> snapshot) {
                  if (snapshot.hasData) {
                    return CachedNetworkImage(
                      placeholder: (context, url) =>
                          CircularProgressIndicator(),
                      imageUrl: APIService().getImageURL(
                          size: '720p', id: snapshot.data!.imageId),
                    );
                  } else if (snapshot.hasError) {
                    return Image.asset('assets/images/empty.jpg');
                  }

                  return Container(
                    child: Center(
                        child: CircularProgressIndicator(
                      color: Theme.of(context).primaryColor,
                    )),
                    height: 370, // TODO: create a ENUM with the cover sizes
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                widget.game.summary,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(color: Colors.black.withOpacity(0.6)),
                maxLines: 3,
              ),
            ),
            ButtonBar(
              buttonPadding: EdgeInsets.symmetric(horizontal: 8.0),
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
    );
  }
}
