import 'package:repositories/repositories.dart';

void main() async {
  var client = Client();
  print(await client.sendMessage('Test'));
  await client.dispose();
}
