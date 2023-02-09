class Pokemon {
  int? id;
  String? name;
  String? url;

  int hp = 0;
  int attack = 0;
  int defense = 0;
  int speed = 0;

  int hpCurrent = 0;
  int attackCurrent = 0;
  int defenseCurrent = 0;
  int speedCurrent = 0;

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
      required this.hp,
      required this.attack,
      required this.defense,
      required this.speed,
      required this.photos}) {
    hpCurrent = hp;
    attackCurrent = attack;
    defenseCurrent = defense;
    speedCurrent = speed;
  }

  Pokemon calculateAbilities(List<int> selected) {
    hpCurrent = hp;
    attackCurrent = attack;
    defenseCurrent = defense;
    speedCurrent = speed;

    if (selected.contains(0)) {
      _intimidation();
    }
    if (selected.contains(1)) {
      _immunity();
    }
    if (selected.contains(2)) {
      _power();
    }
    if (selected.contains(3)) {
      _regeneration();
    }
    if (selected.contains(4)) {
      _impassive();
    }
    if (selected.contains(5)) {
      _toxic();
    }
    return this;
  }

  void _intimidation() {
    attackCurrent += 10;
    speedCurrent += 15;
    hpCurrent -= 5;
    defenseCurrent -= 10;
  }

  void _immunity() {
    attackCurrent -= 20;
    speedCurrent -= 10;
    hpCurrent += 10;
    defenseCurrent += 20;
  }

  void _power() {
    attackCurrent += 15;
    speedCurrent += 15;
    hpCurrent -= 20;
    defenseCurrent -= 10;
  }

  void _regeneration() {
    attackCurrent -= 20;
    speedCurrent += 5;
    hpCurrent += 10;
    defenseCurrent += 5;
  }

  void _impassive() {
    attackCurrent -= 3;
    speedCurrent += 30;
    hpCurrent -= 10;
    defenseCurrent -= 10;
  }

  void _toxic() {
    speedCurrent -= 3;
    hpCurrent -= 15;
    defenseCurrent += 20;
  }

  factory Pokemon.fromJson(Map<String, dynamic> json) {
    Map<String, dynamic>? jsonPhotos = json['sprites'];

    List<String> newPhotos = [];

    if (jsonPhotos?["back_default"] != null) {
      newPhotos.add(jsonPhotos?["back_default"]);
    }

    if (jsonPhotos?["back_female"] != null) {
      newPhotos.add(jsonPhotos?["back_female"]);
    }

    if (jsonPhotos?["back_shiny"] != null) {
      newPhotos.add(jsonPhotos?["back_shiny"]);
    }

    if (jsonPhotos?["back_shiny_female"] != null) {
      newPhotos.add(jsonPhotos?["back_shiny_female"]);
    }

    if (jsonPhotos?["front_default"] != null) {
      newPhotos.add(jsonPhotos?["front_default"]);
    }

    if (jsonPhotos?["front_female"] != null) {
      newPhotos.add(jsonPhotos?["front_female"]);
    }

    if (jsonPhotos?["front_shiny"] != null) {
      newPhotos.add(jsonPhotos?["front_shiny"]);
    }

    if (jsonPhotos?["front_shiny_female"] != null) {
      newPhotos.add(jsonPhotos?["front_shiny_female"]);
    }

    return Pokemon(
        id: json["id"],
        name: json["name"],
        url: json["url"],
        hp: json['stats']?[0]?['base_stat'] ?? 0,
        attack: json['stats']?[1]?['base_stat'] ?? 0,
        defense: json['stats']?[3]?['base_stat'] ?? 0,
        speed: json['stats']?[5]?['base_stat'] ?? 0,
        photos: newPhotos);
  }

// Map<String, dynamic> toJson() => {"id": id, "name": name, "url": url};
}
