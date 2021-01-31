library repositories;

import 'package:grpc/grpc.dart';
import 'package:repositories/grpc/generated/helloworld.pbgrpc.dart';

class Client {
  ClientChannel channel;
  GreeterClient stub;

  Client() {
    print('creating client');
    channel = ClientChannel(
      "10.0.2.2",
      port: 8080,
      options: const ChannelOptions(
        credentials: ChannelCredentials.insecure(),
      ),
    );

    stub = GreeterClient(channel);
  }

  Future<String> sendMessage(String message) async {
    try {
      var response = await stub.sayHello(
        HelloRequest(name: message),
        options: CallOptions(
          metadata: {
            "Authorization":
                "eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6Im5rTnlSWjEyUVRKeG5ZbVRKOWdUMSJ9.eyJpc3MiOiJodHRwczovL3RyYWluaW5nLWpvdXJuYWwuYXV0aDAuY29tLyIsInN1YiI6IkJlTmg4c0tqMlhzSktqa2MxS25iOGhsUlpDQUkwaExMQGNsaWVudHMiLCJhdWQiOiJ0cmFpbmluZy1qb3VybmFsIiwiaWF0IjoxNjEyMTM0NTY3LCJleHAiOjE2MTIyMjA5NjcsImF6cCI6IkJlTmg4c0tqMlhzSktqa2MxS25iOGhsUlpDQUkwaExMIiwiZ3R5IjoiY2xpZW50LWNyZWRlbnRpYWxzIn0.QJgeWVCWbLpxG9a-hKQNNxWWLWTZPQbBAZtPfa4_15ymhJx7dGAls26d_wPIqi8UcjFWdM8YVvFLOzU8Z3Wn53ySqYOSlrdD4xu-mODF5Xdak-xm7mPwc4StkfFSmhatSSPgrfXNQkOAzbosF-2iBG4ehB1tDPWJM-DXis2IjY0GNdy1faJEgtVhqpKLF6BllhWDcsoAiygRjFe9-2RGxOBxQI3Gld5D_Dm614UySZwHROc3VbU4JfmOr47O4A08VQb7ZitB5WBDBd63Ae2qq4Jjl5AAT7v1IPZHiC9X2HW1AQBqda5t-HlQyftMA0oLyIqke-DBaroFdq4pppYJ6w"
          },
        ),
      );

      return response.message;
    } catch (e) {
      print(e);
      return 'Failed';
    }
  }

  void dispose() async {
    await channel.shutdown();
  }
}
