import 'package:flutter/material.dart';
import 'package:pokedex/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Pokédex',
        home: const MyHomePage(),
        theme: ThemeData(useMaterial3: true),
        debugShowCheckedModeBanner: false);
  }
}
