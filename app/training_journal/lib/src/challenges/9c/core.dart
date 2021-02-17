import 'package:flutter/material.dart';
import 'package:training_journal/src/challenges/9c/tile.dart';

class Core extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      child: ListView(
        children: [
          ...getTiles(
            [
              Tile(10, '30sec Front Lever'),
              Tile(9, '20sec Front Lever'),
              Tile(8, '10sec Front Lever'),
              Tile(7, '5sec Front Lever'),
              Tile(6, '20sec L-Sit'),
              Tile(5, '15sec L-Sit'),
              Tile(4, '10sec L-Sit'),
              Tile(3, '30sec L-Sit (Bent Knees)'),
              Tile(2, '20sec L-Sit (Bent Knees)'),
              Tile(1, '10sec L-Sit (Bent Knees)'),
            ],
          )
        ],
      ),
    );
  }
}
