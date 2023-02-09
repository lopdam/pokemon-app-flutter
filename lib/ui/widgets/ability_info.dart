import 'package:flutter/material.dart';

class AbilityInfo extends StatelessWidget {
  String ability;
  String info;

  AbilityInfo({required this.ability, required this.info, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 4),
      child: Wrap(
        children: [
          Text(
            "$ability: ",
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            width: 4,
          ),
          Text(
            info,
            softWrap: true,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
