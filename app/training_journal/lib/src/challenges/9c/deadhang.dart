import 'package:flutter/material.dart';

class Deadhang extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      child: ListView(
        children: [
          ListTile(
            title: const Text('10'),
            trailing: const Text('6min'),
          ),
          ListTile(
            title: const Text('9'),
            trailing: const Text('5min'),
          ),
          ListTile(
            title: const Text('8'),
            trailing: const Text('4min'),
          ),
          ListTile(
            title: const Text('7'),
            trailing: const Text('3.5min'),
          ),
          ListTile(
            title: const Text('6'),
            trailing: const Text('3min'),
          ),
          ListTile(
            title: const Text('5'),
            trailing: const Text('2.5min'),
          ),
          ListTile(
            title: const Text('4'),
            trailing: const Text('2min'),
          ),
          ListTile(
            title: const Text('3'),
            trailing: const Text('1.5min'),
          ),
          ListTile(
            title: const Text('2'),
            trailing: const Text('1min'),
          ),
          ListTile(
            title: const Text('1'),
            trailing: const Text('30sec'),
          ),
        ],
      ),
    );
  }
}
