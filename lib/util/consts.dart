
import 'dart:collection';

import 'package:flutter/material.dart';


mixin Constants {

  static const backgroundColor = Color(0xfff5fbfb);

  static const mainTextColor = Color(0xff2d2f55);

  static const subTextColor = Color(0xaa2d2f55);

  static const filterButton = Color(0xff5d5e7d);

  static const mainTextStyling = TextStyle(fontWeight: FontWeight.bold);

  static final Map<String, MaterialColor> typeToColorMap = HashMap.of({
    'normal': Colors.blueGrey,
    'flying': Colors.purple,
    'poison': Colors.deepPurple,
    'ground': Colors.deepOrange,
    'rock': Colors.lime,
    'bug': Colors.lightGreen,
    'ghost': Colors.indigo,
    'steel': Colors.grey,
    'fire': Colors.orange,
    'water': Colors.blue,
    'grass': Colors.green,
    'electric': Colors.yellow,
    'psychic': Colors.teal,
    'ice': Colors.lightBlue,
    'dragon': Colors.cyan,
    'dark': Colors.brown,
    'fairy': Colors.pink,
  });
}