// We do call the rest API to get, store data on a remote database for that we
//need to write the rest API call at a single place and need to return the data
//if the rest call is a success or need to return custom error exception on the
//basis of 4xx, 5xx status code. We can make use of http package to make the
//rest API call in the flutter

import 'dart:async';
import 'dart:convert';
import 'package:gcenter/models/Cover.dart';
import 'package:gcenter/models/Game.dart';
import 'package:gcenter/models/Genre.dart';
import 'package:gcenter/models/Screenshot.dart';
import 'package:http/http.dart' as http;

class APIService {
  static String mainUrl =
      "https://hc4u83m674.execute-api.sa-east-1.amazonaws.com/production/v4";
  String gamesUrl = mainUrl + '/games';
  String coversUrl = mainUrl + '/covers';
  String genresUrl = mainUrl + '/genres';
  String screenshotsUrl = mainUrl + '/screenshots';

  Future<Game?> getGameById({id: int}) async {
    final body = 'fields *; where id = $id;';

    final response = await http.post(Uri.parse(gamesUrl), body: body);
    final responseJson = jsonDecode(response.body);

    if (response.statusCode == 200) {
      return Game.fromJson(responseJson[0]);
    } else {
      print(
          'Failed to load the game with ID=$id. Error: ${response.statusCode}');
      return null;
    }
  }

  Future<List<Game>?> getGamesSortedByRating(
      {int limit: 10, int offset: 0}) async {
    var body =
        'fields *; sort total_rating desc; sort total_rating_count desc; where total_rating != null; limit $limit; offset $offset;';

    final response = await http.post(Uri.parse(gamesUrl), body: body);
    final responseJson = jsonDecode(response.body);

    if (response.statusCode == 200) {
      return responseJson.map<Game>((game) => Game.fromJson(game)).toList();
    } else {
      print(
          'Failed to load the games sorted by rating. Error: ${response.statusCode}');
      return null;
    }
  }

  Future<Cover?> getCoverById({id: int}) async {
    final body = 'fields *; where id = $id;';

    final response = await http.post(Uri.parse(coversUrl), body: body);
    final responseJson = jsonDecode(response.body);

    if (response.statusCode == 200) {
      return Cover.fromJson(responseJson[0]);
    } else {
      print(
          '\n\nFailed to load the cover image with ID=$id. Error: ${response.statusCode}');
      return null;
    }
  }

  Future<List<Genre>?> getGenresByList(List<int> idList) async {
    final body = 'fields *; where id = (${idList.join(', ')});';

    final response = await http.post(Uri.parse(genresUrl), body: body);
    final responseJson = jsonDecode(response.body);

    if (response.statusCode == 200) {
      return responseJson.map<Genre>((genre) => Genre.fromJson(genre)).toList();
    } else {
      print(
          '\n\nFailed to load the genres with IDs=${idList.toString()}. Error: ${response.statusCode}');
      return null;
    }
  }

  Future<List<Screenshot>?> getScreenshotsByList(List<int> idList) async {
    final body = 'fields *; where id = (${idList.join(', ')});';

    final response = await http.post(Uri.parse(screenshotsUrl), body: body);
    final responseJson = jsonDecode(response.body);

    if (response.statusCode == 200) {
      return responseJson
          .map<Screenshot>((screenshot) => Screenshot.fromJson(screenshot))
          .toList();
    } else {
      print(
          '\n\nFailed to load the screenshots with IDs=${idList.toString()}. Error: ${response.statusCode}');
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
