import 'dart:convert';

DetailsPokemonResponse detailPokemonResponse(String str) =>
    DetailsPokemonResponse.fromJson(json.decode(str));

String pekemonResponseToJson(DetailsPokemonResponse data) =>
    json.encode(data.toJson());

class DetailsPokemonResponse {
  final int id;
  final String name;
  final int height;
  final int weight;
  final Sprites sprites; //lista
  final List<Types> types; //lista
  final List<Abilities> abilities; //lista
  final List<Stats> stats; //stats

  DetailsPokemonResponse(
      {required this.id,
      required this.name,
      required this.height,
      required this.weight,
      required this.sprites,
      required this.types,
      required this.abilities,
      required this.stats});

  factory DetailsPokemonResponse.fromJson(Map<String, dynamic> json) {
    return DetailsPokemonResponse(
      id: json['id'],
      name: json['name'],
      height: json['height'],
      weight: json['weight'],
      sprites: Sprites.fromJson(json['sprites']),
      types: (json['types'] as List).map((e) => Types.fromJson(e)).toList(),
      abilities: (json['abilities'] as List)
          .map((e) => Abilities.fromJson(e))
          .toList(),
      stats: (json['stats'] as List).map((e) => Stats.fromJson(e)).toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "height": height,
        "weight": sprites.toJson(),
        "sprites": types,
        "abilities": abilities,
        "stats": stats
      };
}

class Sprites {
  final String frontDefault;
  final Other other;
  Sprites({
    required this.frontDefault,
    required this.other,
  });

  factory Sprites.fromJson(Map<String, dynamic> json) => Sprites(
        frontDefault: json["front_default"].toString(),
        other: Other.fromJson(json["other"]),
      );

  Map<String, dynamic> toJson() => {
        "front_default": frontDefault,
        "other": other.toJson(),
      };
}

class Other {
  final Home home;

  Other({
    required this.home,
  });

  factory Other.fromJson(Map<String, dynamic> json) => Other(
        home: Home.fromJson(json["home"]),
      );

  Map<String, dynamic> toJson() => {
        "home": home.toJson(),
      };
}

class Home {
  final String frontDefault;

  Home({
    required this.frontDefault,
  });

  factory Home.fromJson(Map<String, dynamic> json) => Home(
        frontDefault: json["front_default"].toString(),
      );

  Map<String, dynamic> toJson() => {
        "front_default": frontDefault,
      };
}

class Types {
  final Type type;

  Types({
    required this.type,
  });

  factory Types.fromJson(Map<String, dynamic> json) => Types(
        type: Type.fromJson(json['type']),
      );

  Map<String, dynamic> toJson() => {
        "type": type.toJson(),
      };
}

class Type {
  final String name;

  Type({
    required this.name,
  });

  factory Type.fromJson(Map<String, dynamic> json) => Type(
        name: json["name"].toString(),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
      };
}

class Abilities {
  final Ability ability;

  Abilities({
    required this.ability,
  });

  factory Abilities.fromJson(Map<String, dynamic> json) => Abilities(
        ability: Ability.fromJson(json['ability']),
      );

  Map<String, dynamic> toJson() => {
        "ability": ability.toJson(),
      };
}

class Ability {
  final String name;

  Ability({
    required this.name,
  });

  factory Ability.fromJson(Map<String, dynamic> json) => Ability(
        name: json["name"].toString(),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
      };
}

class Stats {
  final int baseStat;
  final Stat stat;

  Stats({
    required this.baseStat,
    required this.stat,
  });

  factory Stats.fromJson(Map<String, dynamic> json) => Stats(
        baseStat: json["base_stat"],
        stat: Stat.fromJson(json["stat"]),
      );

  Map<String, dynamic> toJson() => {
        "base_stat": baseStat,
        "stat": stat.toJson(),
      };
}

class Stat {
  final String name;

  Stat({
    required this.name,
  });

  factory Stat.fromJson(Map<String, dynamic> json) => Stat(
        name: json["name"].toString(),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
      };
}
