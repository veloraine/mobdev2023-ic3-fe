import 'package:flutter/material.dart';

import '../../../../core/constants/basecolors.dart';

class PokemonItems extends StatelessWidget {
  final String name, type;
  const PokemonItems({Key? key, required this.name, required this.type}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: BaseColors.darkGrey,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: BaseColors.white)),
          Container(
            padding: const EdgeInsets.all(7),
            decoration: BoxDecoration(
              color: BaseColors.pastelBlue,
              borderRadius: BorderRadius.circular(20),
            ),
              child: Text(type, style: const TextStyle(color: BaseColors.darkGrey, fontWeight: FontWeight.bold)),
          ),
        ],
      )
    );
  }
}
