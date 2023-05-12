
import 'package:flutter/material.dart';

class MyGrid extends StatelessWidget {
  const MyGrid({Key? key}) : super(key: key);

  final List<MaterialColor> colorList = Colors.primaries;

  @override
  Widget build(BuildContext context) {
    
    print('Length of list ${colorList.length}');
    
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2),
          itemCount: colorList.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
                margin: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: colorList[index][900],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.all(12),
                    child: Text(
                      colorList[index].toString(),
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                        color: colorList[index][200]
                      ),
                    ),
                  ),
                ),
            );
          },
        ),
      ),
    );
  }
}
