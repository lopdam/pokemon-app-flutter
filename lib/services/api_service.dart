import 'dart:io';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:pokemon/models/pokemon.dart';
import 'package:pokemon/utils/util.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart' as path;

class ApiService {
  static const Duration _timeout = Duration(seconds: 60);

  static Uri _url({required String url, Map<String, dynamic>? query}) {
    return (query == null)
        ? Uri.parse(path.join(Util.API_URL, url))
        : Uri.https(path.join(Util.API_URL), path.join(url), query);
  }

  static Map<String, String> _headers() {
    return {'Content-Type': 'application/json; charset=UTF-8'};
  }

  // Pokemos

  static Future<List<Pokemon>?> getPokemons({required int limit}) async {
    try {
      final http.Response response = await http
          .get(_url(url: "pokemon/?limit=$limit"), headers: _headers())
          .timeout(_timeout);

      debugPrint("${response.request} Status:${response.statusCode}");

      if (response.statusCode == HttpStatus.ok) {
        Map<String, dynamic> body = jsonDecode(utf8.decode(response.bodyBytes));

        List results = ((body['results'] ?? []) as List);

        List<Pokemon> pokemons =
            results.map((i) => Pokemon.fromJson(i)).toList();

        return pokemons;
      } else {
        debugPrint(response.body);
        return null;
      }
    } catch (e) {
      debugPrint('ApiService > getPokemons');
      debugPrint(e.toString());
      return null;
    }
  }

  static Future<Pokemon?> getPokemon(Pokemon pokemon) async {
    try {
      final http.Response response = await http
          .get(_url(url: "pokemon/${pokemon.name}/"), headers: _headers())
          .timeout(_timeout);

      print("${response.request} Status:${response.statusCode}");

      if (response.statusCode == HttpStatus.ok) {
        Map<String, dynamic> results =
            jsonDecode(utf8.decode(response.bodyBytes));
        return Pokemon.fromJson(results);
      } else {
        print(response.body);
        return null;
      }
    } catch (e) {
      print('ApiService > getPokemon');
      print(e);
      return null;
    }
  }
}
