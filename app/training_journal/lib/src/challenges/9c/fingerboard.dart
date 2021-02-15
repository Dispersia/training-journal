import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Fingerboard extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _FingerboardState();
}

class _FingerboardState extends State<Fingerboard> {
  int weight = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      child: ListView(
        children: [
          const Text('Hold on 20mm edge for 5 seconds'),
          TextField(
            textAlign: TextAlign.center,
            decoration: InputDecoration(labelText: 'Weight'),
            keyboardType: TextInputType.number,
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
            ],
            onChanged: (value) {
              setState(() {
                weight = int.parse(value);
              });
            },
          ),
          if (weight > 0) ...[
            ListTile(
              title: const Text('10'),
              trailing: Text('${weight * 1.20}'),
            ),
            ListTile(
              title: const Text('9'),
              trailing: Text('${weight * 1.0}'),
            ),
            ListTile(
              title: const Text('8'),
              trailing: Text('${weight * .8}'),
            ),
            ListTile(
              title: const Text('7'),
              trailing: Text('${weight * .6}'),
            ),
            ListTile(
              title: const Text('6'),
              trailing: Text('${weight * .5}'),
            ),
            ListTile(
              title: const Text('5'),
              trailing: Text('${weight * .4}'),
            ),
            ListTile(
              title: const Text('4'),
              trailing: Text('${weight * .3}'),
            ),
            ListTile(
              title: const Text('3'),
              trailing: Text('${weight * .2}'),
            ),
            ListTile(
              title: const Text('2'),
              trailing: Text('${weight * .1}'),
            ),
          ]
        ],
      ),
    );
  }
}
