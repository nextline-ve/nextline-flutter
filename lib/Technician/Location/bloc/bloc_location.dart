import 'dart:async';

import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:web_socket_channel/io.dart';

class BlocLocation implements Bloc {
  final channel =
      IOWebSocketChannel.connect('wss://nextline.jaspesoft.com/ws/tecnico/32/');

  final StreamController<int> _streamController =
      StreamController<int>.broadcast();

  Stream<dynamic> getStream() {
    return this.channel.stream;
  }

  void sendLocation(location) {
    this.channel.sink.add(location);
  }

  void closeConnection() {
    this.channel.sink.close();
  }

  @override
  void dispose() {
    _streamController.close();
  }
}
