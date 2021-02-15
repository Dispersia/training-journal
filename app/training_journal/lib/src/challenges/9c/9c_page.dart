import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:training_journal/src/challenges/9c/core.dart';
import 'package:training_journal/src/challenges/9c/deadhang.dart';
import 'package:training_journal/src/challenges/9c/fingerboard.dart';
import 'package:training_journal/src/challenges/9c/pullup.dart';

class NineCPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _NineCPageState();
}

class _NineCPageState extends State<NineCPage> {
  List<Exercise> exercises = <Exercise>[
    Exercise(
      'Max Fingerboard Weight',
      Fingerboard(),
    ),
    Exercise(
      'Max Pullup',
      Pullup(),
    ),
    Exercise(
      'Core',
      Core(),
    ),
    Exercise(
      'Deadhang',
      Deadhang(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    int score = exercises.fold(0, (a, b) => a + b.score);
    return Scaffold(
      appBar: AppBar(
        title: const Text('9C Test'),
      ),
      body: ListView(
        children: [
          ExpansionPanelList(
            expansionCallback: (i, expanded) {
              setState(() {
                exercises[i].isExpanded = !exercises[i].isExpanded;
              });
            },
            children: exercises.map(
              (item) {
                return ExpansionPanel(
                  headerBuilder: (context, expanded) {
                    return ListTile(
                      title: Text(
                        item.header,
                        textAlign: TextAlign.left,
                      ),
                      trailing: Container(
                        width: 50,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Expanded(
                              flex: 3,
                              child: TextField(
                                textAlign: TextAlign.center,
                                decoration: InputDecoration.collapsed(
                                  hintText: 'Score',
                                ),
                                keyboardType: TextInputType.number,
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly
                                ],
                                onChanged: (value) {
                                  setState(() {
                                    item.score = int.parse(value);
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  isExpanded: item.isExpanded,
                  body: item.body,
                );
              },
            ).toList(),
          ),
          Container(
            padding: EdgeInsets.all(20),
            child: Text('Final Score: $score - ${finalScore(score)}'),
          )
        ],
      ),
    );
  }
}

class Exercise {
  bool isExpanded = false;
  final String header;
  final Widget body;
  int score = 0;

  Exercise(this.header, this.body);
}

String finalScore(int score) {
  switch (score) {
    case 40:
      return "9c (5.15d - v17+)";
    case 39:
      return "9b+ (5.15c - v17+)";
    case 38:
      return "9b (5.15b - v17+)";
    case 37:
      return "9b (5.15b - v17+)";
    case 36:
      return "9a+ (5.15a - v17+)";
    case 35:
      return "9a+ (5.15a - v17+)";
    case 34:
      return "9a (5.14d - v17+)";
    case 33:
      return "9a (5.14d - v17+)";
    case 32:
      return "8c+ (5.14c - v16)";
    case 31:
      return "8c+ (5.14c - v16)";
    case 30:
      return "8c (5.14b - v15)";
    case 29:
      return "8c (5.14b - v15)";
    case 28:
      return "8b+ (5.14a - v14)";
    case 27:
      return "8b+ (5.14a - v14)";
    case 26:
      return "8b (5.13d - v13)";
    case 25:
      return "8b (5.13d - v13)";
    case 24:
      return "8a+ (5.13c - v12)";
    case 23:
      return "8a+ (5.13c - v12)";
    case 22:
      return "8a (5.13b - v11)";
    case 21:
      return "8a (5.13b - v11)";
    case 20:
      return "7c+ (5.13a - v10)";
    case 19:
      return "7c+ (5.13a - v10)";
    case 18:
      return "7c (5.12d - v9)";
    case 17:
      return "7c (5.12d - v9)";
    case 16:
      return "7b+ (5.12c - v8)";
    case 15:
      return "7b+ (5.12c - v8)";
    case 14:
      return "7b (5.12b - v8)";
    case 13:
      return "7b (5.12b - v8)";
    case 12:
      return "7a+ (5.12a - v7)";
    case 11:
      return "7a+ (5.12a - v7)";
    case 10:
      return "7a (5.11d -v6)";
    case 9:
      return "7a (5.11d - v6)";
    case 8:
      return "6c+ (5.11c - v5)";
    case 7:
      return "6c+ (5.11c - v5)";
    case 6:
      return "6c (5.11b - v5)";
    case 5:
      return "6c (5.11b - v5)";
    case 4:
      return "6b (5.10d - v4)";
    default:
      return "unable to find a score";
  }
}
