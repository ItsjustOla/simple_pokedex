import 'package:flutter/material.dart';
import 'package:pokeapi/model/pokemon/pokemon.dart';
import 'package:pokeapi/pokeapi.dart';

import '../util/consts.dart';
import '../util/grid_builder.dart';
import '../util/search_area.dart';

class MyHomePage extends StatefulWidget with Constants {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late Future<List<Pokemon?>> pokeList;
  int pokeLimit = 36;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pokeList = PokeAPI.getObjectList<Pokemon>(1, pokeLimit);
    pokeList.then((value) {
      for (var p in value) {
        print(
            'Pokémon details: ${p!.id}, ${p.name}, ${p!.types!.first.type!.name}');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    const double expandedHeight = 4 * kToolbarHeight;
    var mqSize = MediaQuery.of(context).size;

    Widget outputWrapper(Widget child) {
      return Center(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(13),
          clipBehavior: Clip.antiAlias,
          child: Container(
            height: 150,
            width: 150,
            color: Colors.red,
            child: child,
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: Constants.backgroundColor,
      body: FutureBuilder(
        future: pokeList,
        builder:
            (BuildContext context, AsyncSnapshot<List<Pokemon?>> snapshot) {
          if (!snapshot.hasData) {
            return const Center(child:  Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Loading...',
                  style: TextStyle(
                    color: Colors.deepPurple,
                    fontWeight: FontWeight.bold,
                    fontSize: 28
                  ),
                ),
                SizedBox(height: 12,),
                CircularProgressIndicator(
                  color: Colors.deepPurple,
                ),
              ],
            ));
          }

          if (snapshot.hasError) {
            outputWrapper(const Text(
              'Error! Could not retrieve pokemon data.',
              style: TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ));
          }

          var sData = snapshot.data!.map((e) => e!).toList();
          return CustomScrollView(
            slivers: [
              SliverAppBar(
                elevation: 0,
                floating: true,
                flexibleSpace: FlexibleSpaceBar(
                  background: Container(
                    padding: const EdgeInsets.all(12),
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(
                            'assets/poke_header_3.jpg',
                          ),
                        )),
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Pokédex',
                          style: TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: 42,
                            color: Colors.black,
                            // color: Constants.mainTextColor,
                          ),
                        ),
                        Text(
                          'Search for a Pokémon by name or using its National Pokédex number.',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                            // color: Constants.subTextColor,
                          ),
                        ),
                        // search bar with filter button
                        MySearchArea(),
                      ],
                    ),
                  ),
                ),
                expandedHeight: expandedHeight,
              ),
              MyGrid(pokes: sData,),
            ],
          );
        },
      ),
    );
  }
}
