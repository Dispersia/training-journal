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
    var response = await stub.sayHello(HelloRequest(name: message));

    return response.message;
  }

  void dispose() async {
    await channel.shutdown();
  }
}
