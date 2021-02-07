import 'package:grpc/grpc.dart';

import 'generated/helloworld.pbgrpc.dart';

class Client {
  ClientChannel channel;
  GreeterClient stub;

  Client() {
    channel = ClientChannel(
      "10.0.2.2",
      port: 8080,
      options: const ChannelOptions(
        credentials: ChannelCredentials.insecure(),
      ),
    );

    stub = GreeterClient(channel);
  }

  Future<String> sendMessage(String message, String token) async {
    try {
      var response = await stub.sayHello(
        HelloRequest(name: message),
        options: CallOptions(
          metadata: {"Authorization": token},
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
