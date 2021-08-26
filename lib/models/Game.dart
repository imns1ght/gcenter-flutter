import 'package:json_annotation/json_annotation.dart';

part 'Game.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class Game {
  /// The PEGI rating
  List<int>? ageRatings;

  /// Rating based on external critic scores
  double? aggregatedRating;

  /// Number of external critic scores
  int? aggregatedRatingCount;

  /// Alternative names for this game
  List<int>? alternativeNames;

  /// Artworks of this game
  List<int>? artworks;

  /// The bundles this game is a part of
  List<int>? bundles;

  /// The category of this game
  int? category;

  /// Hash of the object
  String checksum;

  /// The series the game belongs to
  int? collection;

  /// The cover of this game
  int? cover;

  String? realCover;

  /// Date this was initially added to the IGDB database (Unix Time Stamp)
  int? createdAt;

  /// DLCs for this game
  List<int>? dlcs;

  /// Expanded games of this game
  List<int>? expandedGames;

  /// Expansions of this game
  List<int>? expansions;

  /// External IDs this game has on other services
  List<int>? externalGames;

  /// The first release date of this game (Unix Time Stamp)
  int? firstRelease;

  /// Number of people following a game
  int? follows;

  /// Forks of this game
  List<int>? forks;

  ///  The main franchise
  int? franchise;

  /// Other franchises the game belongs to
  List<int>? franchises;

  /// The game engine used in this game
  List<int>? gameEngines;

  /// Modes of gameplay
  List<int>? gameModes;

  /// Genres of the game
  List<int>? genres;

  /// Number of follows a game gets before release
  int? hypes;

  /// The IGDB ID
  int id;

  /// Companies who developed this game
  List<int>? involvedCompanies;

  /// Associated keywords
  List<int>? keywords;

  /// Multiplayer modes for this game
  List<int>? multiplayerModes;

  /// The name of the game
  String name;

  /// Reference ID for Game. If a DLC, expansion or part of a bundle, this is the main game or bundle
  int? parentGame;

  /// Platforms this game was released on
  List<int>? platforms;

  /// Player Perspective IDs
  List<int>? playerPerspectives;

  /// Ports of this game
  List<int>? posts;

  /// Average IGDB user rating
  double? rating;

  /// Total number of IGDB user ratings
  int? ratingCount;

  /// Release dates of this game
  List<int>? releaseDates;

  /// Remakes of this game
  List<int>? remakes;

  /// Remasters of this game
  List<int>? remasters;

  /// Screenshots of this game
  List<int>? screenshots;

  /// Similar games
  List<int>? similarGames;

  /// A url-safe, unique, lower-case version of the name
  String? slug;

  ///Standalone expansions of this game
  List<int>? standaloneExpansions;

  /// The status of the games release
  int? status;

  /// A short description of a games story
  String? storyline;

  /// A description of the game
  String summary;

  /// Related entities in the IGDB API
  List<int>? tags;

  /// Themes of the game
  List<int>? themes;

  /// Average rating based on both IGDB user and external critic scores
  double? totalRating;

  /// Total number of user and external critic scores
  int? totalRatingCount;

  /// The last date this entry was updated in the IGDB database (Unix Time Stamp)
  int? updatedAt;

  /// The website address (URL) of the item
  String? url;

  /// If a version, this is the main game
  int? versionParent;

  /// Title of this version (i.e Gold edition)
  String? versionTitle;

  /// Videos of this game
  List<int>? videos;

  /// Websites associated with this game
  List<int>? websites;

  Game(
      this.ageRatings,
      this.aggregatedRating,
      this.aggregatedRatingCount,
      this.alternativeNames,
      this.artworks,
      this.bundles,
      this.category,
      this.checksum,
      this.collection,
      this.cover,
      this.realCover,
      this.createdAt,
      this.dlcs,
      this.expandedGames,
      this.expansions,
      this.externalGames,
      this.firstRelease,
      this.follows,
      this.forks,
      this.franchise,
      this.franchises,
      this.gameEngines,
      this.gameModes,
      this.genres,
      this.hypes,
      this.id,
      this.involvedCompanies,
      this.keywords,
      this.multiplayerModes,
      this.name,
      this.parentGame,
      this.platforms,
      this.playerPerspectives,
      this.posts,
      this.rating,
      this.ratingCount,
      this.releaseDates,
      this.remakes,
      this.remasters,
      this.screenshots,
      this.similarGames,
      this.slug,
      this.standaloneExpansions,
      this.status,
      this.storyline,
      this.summary,
      this.tags,
      this.themes,
      this.totalRating,
      this.totalRatingCount,
      this.updatedAt,
      this.url,
      this.versionParent,
      this.versionTitle,
      this.videos,
      this.websites);

  factory Game.fromJson(Map<String, dynamic> json) => _$GameFromJson(json);
  Map<String, dynamic> toJson() => _$GameToJson(this);
}
