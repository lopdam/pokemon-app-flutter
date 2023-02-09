import 'package:pokemon/models/stats.dart';
import 'package:pokemon/utils/util.dart';

class Pokemon {
  int? id;
  String? name;
  String? url;

  Stats stats;
  Stats currentStats;

  List<String> photos = [];

  static Map<String, String> info = {
    "Intimidación":
        "Aumenta ataque en 10 y velocidad en 15, reduce vida 5 y defensa en 10",
    "Inmunidad":
        "Aumenta vida en 10, defensa en 20, reduce ataque en 20 y velocidad en 10",
    "Potencia":
        "Aumenta ataque en 15, velocidad en 15, reduce vida en 20 y defensa en 10",
    "Regeneración":
        "Aumenta vida en 10, velocidad en 5 y defensa en 5 reduce ataque 20",
    "Impasible":
        "Aumenta velocidad en 30, reduce vida en 10, defensa en 10 y ataque en 3",
    "Tóxico":
        "Aumenta defensa en 20, reduce vida en 15, velocidad en 3 y ataque 0"
  };

  Pokemon(
      {required this.id,
      required this.name,
      this.url,
      required this.stats,
      required this.currentStats,
      required this.photos});

  Pokemon calculateAbilities(List<int> selected) {
    currentStats = stats.copy();
    currentStats.calculateAbilities(selected);
    return this;
  }

  factory Pokemon.fromJson(Map<String, dynamic> json) {
    Map<String, dynamic>? jsonPhotos = json['sprites'];

    List<String> newPhotos = [];

    List<String> keysPhotos = [
      "back_default",
      "back_female",
      "back_shiny",
      "back_shiny_female",
      "front_default",
      "front_female",
      "front_shiny",
      "front_shiny",
      "front_shiny_female"
    ];

    for (String key in keysPhotos) {
      if (!Util.isEmpty(jsonPhotos?[key])) {
        newPhotos.add(jsonPhotos?[key]);
      }
    }

    Stats newsStats = Stats.fromJson(json);

    return Pokemon(
        id: json["id"],
        name: json["name"],
        url: json["url"],
        stats: newsStats,
        currentStats: newsStats.copy(),
        photos: newPhotos);
  }

// Map<String, dynamic> toJson() => {"id": id, "name": name, "url": url};
}
