class Stats {
  int hp = 0;
  int attack = 0;
  int defense = 0;
  int speed = 0;

  Stats(
      {required this.hp,
      required this.attack,
      required this.defense,
      required this.speed});

  Stats copy() {
    return Stats(hp: hp, attack: attack, defense: defense, speed: speed);
  }

  void calculateAbilities(List<int> selected) {
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
  }

  void _intimidation() {
    attack += 10;
    speed += 15;
    hp -= 5;
    defense -= 10;
  }

  void _immunity() {
    attack -= 20;
    speed -= 10;
    hp += 10;
    defense += 20;
  }

  void _power() {
    attack += 15;
    speed += 15;
    hp -= 20;
    defense -= 10;
  }

  void _regeneration() {
    attack -= 20;
    speed += 5;
    hp += 10;
    defense += 5;
  }

  void _impassive() {
    attack -= 3;
    speed += 30;
    hp -= 10;
    defense -= 10;
  }

  void _toxic() {
    speed -= 3;
    hp -= 15;
    defense += 20;
  }

  factory Stats.fromJson(Map<String, dynamic> json) {
    return Stats(
        hp: json['stats']?[0]?['base_stat'] ?? 0,
        attack: json['stats']?[1]?['base_stat'] ?? 0,
        defense: json['stats']?[3]?['base_stat'] ?? 0,
        speed: json['stats']?[5]?['base_stat'] ?? 0);
  }
}
