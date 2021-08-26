import 'dart:async';
import 'dart:convert';
import 'package:gcenter/models/Cover.dart';
import 'package:gcenter/models/Game.dart';
import 'package:http/http.dart' as http;

class GameRepository {
  static String mainUrl = "https://api.igdb.com/v4";
  String gamesUrl = mainUrl + '/games';
  String coversUrl = mainUrl + '/covers';
  final String clientId = "fvi1j4w6fso11lbzkgst6gpo9ersry";
  final String token = ""; // https://api-docs.igdb.com/#authentication

  Future<Game?> getGameById({id: int}) async {
    final headers = {
      'client-id': clientId,
      'authorization': 'Bearer $token',
    };
    final body = 'fields *; where id = $id;';

    final response =
        await http.post(Uri.parse(gamesUrl), headers: headers, body: body);
    final responseJson = jsonDecode(response.body);

    if (response.statusCode == 200) {
      print(responseJson[0].toString());
      return Game.fromJson(responseJson[0]);
    } else {
      print(
          'Failed to load the game with ID=$id. Error: ${response.statusCode}');
      return null;
    }
  }

  Future<List<Game>?> getGamesSortedByRating(
      {int limit: 10, int offset: 0}) async {
    final headers = {
      'client-id': clientId,
      'authorization': 'Bearer $token',
    };
    var body =
        'fields *; sort total_rating desc; sort total_rating_count desc; where total_rating != null; limit $limit; offset $offset;';

    final response =
        await http.post(Uri.parse(gamesUrl), headers: headers, body: body);
    final responseJson = jsonDecode(response.body);

    if (response.statusCode == 200) {
      // List<Game> games =
      //     responseJson.map<Game>((game) => Game.fromJson(game)).toList();
      // games.asMap().forEach((index, game) async => {
      //       if (index == 0)
      //         await getCoverById(id: game.cover)
      //             .then((cover) => game.realCover = cover?.imageId)
      //     });
      // print(games[0].name.toString());
      // print(games[0].cover.toString());
      // print(games[0].realCover.toString());
      // return games;
      return responseJson.map<Game>((game) => Game.fromJson(game)).toList();
    } else {
      print(
          'Failed to load the games sorted by rating. Error: ${response.statusCode}');
      return null;
    }
  }

  Future<Cover?> getCoverById({id: int}) async {
    final headers = {
      'client-id': clientId,
      'authorization': 'Bearer $token',
    };
    final body = 'fields *; where id = $id;';

    final response =
        await http.post(Uri.parse(coversUrl), headers: headers, body: body);
    final responseJson = jsonDecode(response.body);

    if (response.statusCode == 200) {
      print(Cover.fromJson(responseJson[0]).toJson().toString());
      return Cover.fromJson(responseJson[0]);
    } else {
      print(
          '\n\nFailed to load the cover image with ID=$id. Error: ${response.statusCode}');
      return null;
    }
  }

  String getImageURL({
    size: String,
    id: String,
  }) {
    return "https://images.igdb.com/igdb/image/upload/t_$size/$id.jpg";
  }
}
