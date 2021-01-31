import 'package:flutter/material.dart';
import 'package:blocs/blocs.dart';
import 'package:repositories/repositories.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final Client _client = Client();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Work in progress',
          ),
        ),
        body: Center(
          child: FutureBuilder<String>(
            future: _client.sendMessage('World'),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return CircularProgressIndicator();
              }

              return Text('GRPC: ${snapshot.data}');
            },
          ),
        ),
      ),
    );
  }
}
