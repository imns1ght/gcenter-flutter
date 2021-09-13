import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gcenter/models/Cover.dart';
import 'package:gcenter/models/Game.dart';
import 'package:gcenter/models/Genre.dart';
import 'package:gcenter/screens/GameScreen.dart';
import 'package:gcenter/services/rest_api_service.dart';
import 'package:gcenter/utils/helpers/text_helper.dart';

class GameCard extends StatefulWidget {
  final Game game;
  const GameCard(BuildContext context, {Key? key, required this.game})
      : super(key: key);

  @override
  _GameCardState createState() => _GameCardState();
}

class _GameCardState extends State<GameCard> {
  late Future<Cover?> cover;
  late Future<List<Genre>?> genres;

  @override
  void initState() {
    super.initState();
    cover = APIService().getCoverById(id: widget.game.cover);
    genres = APIService().getGenresByList(widget.game.genres!);
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
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Image cover
            Expanded(
              flex: 1,
              child: Center(
                child: FutureBuilder(
                  future: cover,
                  builder:
                      (BuildContext context, AsyncSnapshot<Cover?> snapshot) {
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

                    return Center(
                      child: Container(
                        color: Colors.grey[200],
                      ),
                    );
                  },
                ),
              ),
            ),
            // Game details
            Expanded(
              flex: 2,
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.topCenter,
                    padding: EdgeInsets.only(top: 10),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: ListTile(
                        contentPadding: EdgeInsets.zero,
                        title: Text(widget.game.name,
                            style: Theme.of(context).textTheme.headline3),
                        subtitle: Text(
                          "${convertTimestampToDate(widget.game.firstReleaseDate!)}",
                          style:
                              TextStyle(color: Colors.black.withOpacity(0.7)),
                        ),
                        enableFeedback: true,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
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
                                  fontSize: 14),
                            );
                          }

                          return Text('');
                        },
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 10, right: 10, top: 20),
                    child: Text(
                      widget.game.summary,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(color: Colors.black.withOpacity(0.6)),
                      maxLines: 3,
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
    );
  }
}
