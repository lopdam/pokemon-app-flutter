import 'package:flutter/material.dart';
import 'package:pokemon/models/pokemon.dart';
import 'package:pokemon/ui/widgets/ability_info.dart';

class AbilitiesInfo extends StatelessWidget {
  final List<int> currentAvilities;
  final List<String> infoKeys;

  const AbilitiesInfo(
      {required this.currentAvilities, required this.infoKeys, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ...currentAvilities
            .map(
              (e) => AbilityInfo(
                  ability: infoKeys[e], info: Pokemon.info[infoKeys[e]] ?? ""),
            )
            .toList()
      ],
    );
  }
}
