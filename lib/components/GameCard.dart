import 'package:flutter/material.dart';
import 'package:gcenter/models/Game.dart';
// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:gcenter/repository/GameRepository.dart';

Card gameCard(BuildContext context, Game data) {
  return Card(
    clipBehavior: Clip.antiAlias,
    child: Column(
      children: [
        ListTile(
          title: Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Text(data.name,
                  style: Theme.of(context).textTheme.headline3)),
          subtitle: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Text(
              data.totalRating!.toStringAsFixed(0) +
                  "/100 - ${data.totalRatingCount} Ratings",
              style: TextStyle(color: Colors.black.withOpacity(0.6)),
            ),
          ),
          enableFeedback: true,
        ),
        // CachedNetworkImage(
        //   placeholder: (context, url) => CircularProgressIndicator(),
        //   imageUrl: GameRepository()
        //       .getImageURL(size: 'cover_big', id: data.realCover),
        // ),
        Image.asset('assets/images/empty.jpg'),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            data.summary,
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
                color: Colors.red),
          ],
        ),
      ],
    ),
  );
}
