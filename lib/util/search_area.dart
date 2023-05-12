import 'package:flutter/material.dart';
import 'package:pokedex/util/consts.dart';

class MySearchArea extends StatefulWidget with Constants {
  const MySearchArea({Key? key}) : super(key: key);

  @override
  State<MySearchArea> createState() => _MySearchAreaState();
}

class _MySearchAreaState extends State<MySearchArea> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [

        // Search field
        Flexible(
          flex: 4,
          fit: FlexFit.tight,
          child: Container(
            decoration: BoxDecoration(
              color: Color(0xFFebf3f5),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: TextFormField(
                controller: _controller,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  prefixIcon: Icon(Icons.search, color: Colors.black54),
                  hintText: 'Name or number',
                  hintStyle: TextStyle(color: Colors.black38),
                  filled: true,
                  fillColor: Color(0xFFebf3f5),
                ),
                onFieldSubmitted: (String searchInput) {
                  print('Output from field: ' + searchInput);
                },
              ),
            ),
          ),
        ),

        // Filter Icon
        Flexible(
          child: Container(
            decoration: BoxDecoration(
                color: Constants.filterButton,
                borderRadius: BorderRadius.circular(10)),
            child: IconButton(
              color: Colors.white,
              padding: const EdgeInsets.all(12),
              onPressed: () {},
              icon: const Icon(
                Icons.tune,
                size: 32,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
