import 'package:flutter/material.dart';

class Core extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      child: ListView(
        children: [
          ListTile(
            title: const Text('10'),
            trailing: const Text('30sec Front Lever'),
          ),
          ListTile(
            title: const Text('9'),
            trailing: const Text('20sec Front Lever'),
          ),
          ListTile(
            title: const Text('8'),
            trailing: const Text('10sec Front Lever'),
          ),
          ListTile(
            title: const Text('7'),
            trailing: const Text('5sec Front Lever'),
          ),
          ListTile(
            title: const Text('6'),
            trailing: const Text('20sec L-sit'),
          ),
          ListTile(
            title: const Text('5'),
            trailing: const Text('15sec L-sit'),
          ),
          ListTile(
            title: const Text('4'),
            trailing: const Text('10sec L-sit'),
          ),
          ListTile(
            title: const Text('3'),
            trailing: const Text('30sec L-sit(bent knees)'),
          ),
          ListTile(
            title: const Text('2'),
            trailing: const Text('20sec L-sit(bent knees)'),
          ),
          ListTile(
            title: const Text('1'),
            trailing: const Text('10sec L-sit(bent knees)'),
          ),
        ],
      ),
    );
  }
}
