import 'package:flutter/material.dart';

class Tile {
  final int id;
  final String time;

  const Tile(this.id, this.time);
}

Iterable<ListTile> getTiles(Iterable<Tile> tiles) {
  return tiles.map(
    (x) => new ListTile(
      title: Text('${x.id}'),
      trailing: Text(x.time),
    ),
  );
}
