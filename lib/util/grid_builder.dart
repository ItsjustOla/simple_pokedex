import 'package:flutter/material.dart';
import 'package:pokeapi/model/pokemon/pokemon.dart';

import 'consts.dart';

class MyGrid extends StatelessWidget with Constants {
  const MyGrid({Key? key, required this.pokes}) : super(key: key);
  final List<Pokemon> pokes;

  final List<MaterialColor> colorList = Colors.primaries;

  // Temporary solution to get infinite color scrolling for grid
  // will remove when calling poke api and match the class type to a specific color.
  // int getColorIndex(index) {
  //   String i = index.toString();
  //   return int.parse(i.substring(i.length - 1));
  // }

  Widget pokeContainer(Pokemon poke) {
    return Container(
      margin: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Constants.typeToColorMap[poke.types?.first.type?.name]?[200],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(poke.sprites!.frontDefault!),
            Text(
              poke.name!,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Constants.typeToColorMap[poke.types?.first.type?.name]
                    ?[900],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3, childAspectRatio: 0.75),
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) => pokeContainer(pokes[index]),
        childCount: pokes.length,
      ),
    );
  }
}
