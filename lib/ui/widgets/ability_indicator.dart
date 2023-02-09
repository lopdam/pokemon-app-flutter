import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:pokemon/values/colors.dart';

class AbilityIndicator extends StatelessWidget {
  String ability;
  int value;

  AbilityIndicator({required this.ability, required this.value, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Row(
        children: [
          Text(
            ability,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          LinearPercentIndicator(
            width: MediaQuery.of(context).size.width / 2,
            animation: true,
            lineHeight: 20.0,
            animationDuration: 2500,
            percent: value / 100,
            center: Text("$value"),
            barRadius: Radius.circular(100),
            progressColor: getColor(value),
          ),
        ],
      ),
    );
  }

  Color getColor(int value) {
    if (value < 33) {
      return AppColors.red;
    } else if (value < 66) {
      return AppColors.yellow;
    } else {
      return AppColors.green;
    }
  }
}
