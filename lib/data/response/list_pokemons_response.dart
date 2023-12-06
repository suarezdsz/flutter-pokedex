import 'dart:convert';

ListPokemonsResponse listPokemonsResponseJson(String str) =>
    ListPokemonsResponse.fromJson(json.decode(str));

String productsResponseToJson(ListPokemonsResponse data) =>
    json.encode(data.toJson());

class ListPokemonsResponse {
  final int count;
  final String next;
  final List<Result> results;

  ListPokemonsResponse(
      {required this.count, required this.next, required this.results});

  factory ListPokemonsResponse.fromJson(Map<String, dynamic> json) {
    return ListPokemonsResponse(
      count: json['count'],
      next: json['next'],
      results:
          (json['results'] as List).map((e) => Result.fromJson(e)).toList(),
    );
  }

  Map<String, dynamic> toJson() =>
      {"count": count, "next": next, "results": results};
}

class Result {
  int id;
  final String name;
  final String url;

  Result({
    required this.id,
    required this.name,
    required this.url,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        id: 0,
        name: json["name"].toString(),
        url: json["url"].toString(),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "url": url,
      };
}
