import 'package:flutter/material.dart';

import '../util/consts.dart';
import '../util/grid_builder.dart';
import '../util/search_area.dart';

class MyHomePage extends StatelessWidget with Constants {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.backgroundColor,
      body: SafeArea(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: const Column(
            children: [
              Padding(
                padding: EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Pokédex',
                      style: TextStyle(
                          fontWeight: FontWeight.w900,
                          fontSize: 42,
                          color: Constants.mainTextColor,
                      ),
                    ),
                    Text(
                      'Search for a Pokémon by name or using its National Pokédex number.',
                      style: TextStyle(
                          fontSize: 16,
                          color: Constants.subTextColor,
                      ),
                    ),
                    // search bar with filter button
                    SizedBox(height: 18,),
                    MySearchArea(),
                  ],
                ),
              ),
              // gridview 2 items across
              MyGrid()
            ],
          ),
        ),
      ),
    );
  }
}
