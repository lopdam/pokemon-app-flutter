import 'package:flutter/material.dart';
import 'package:pokemon/models/pokemon.dart';
import 'package:pokemon/ui/widgets/ability_indicator.dart';

class AbilitiesIndicator extends StatelessWidget {
  final Pokemon pokemon;

  const AbilitiesIndicator({required this.pokemon, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        AbilityIndicator(
          ability: "Vida",
          value: pokemon.currentStats.hp,
        ),
        AbilityIndicator(
          ability: "Ataque",
          value: pokemon.currentStats.attack,
        ),
        AbilityIndicator(
          ability: "Defensa",
          value: pokemon.currentStats.defense,
        ),
        AbilityIndicator(
          ability: "Velocidad",
          value: pokemon.currentStats.speed,
        )
      ],
    );
  }
}
