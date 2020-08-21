import 'dart:async';
import 'package:firebase_database/firebase_database.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:nextline/Tickets/model/modal_message.dart';
import 'package:nextline/Tickets/model/model_ticket.dart';

import '../repository_tickets.dart';

class BlocTickets implements Bloc {
  final RepositoryTickets repository = RepositoryTickets();
  DatabaseReference _chatsRef;
  FirebaseDatabase database;
  Map<String, dynamic> chats;

  final StreamController<dynamic> _streamController =
      StreamController<dynamic>.broadcast();

  Sink<dynamic> get ticketEvents => _streamController.sink;
  // Stream<List<Ticket>> get responseDataTickets =>
  //     _streamController.stream.asyncMap((dynamic event) => _mapEvent(event));

  Future<List<Ticket>> getDataTickets() async {
    return await repository.getDataTicketsAPI();
  }

  Future<Map<String, dynamic>> getChat(String ticketId) async {
    DatabaseReference chatRef = _chatsRef.child(ticketId);
    dynamic chatData = await chatRef.once();
    Map<String, ModelMessage> chatDataMap = Map.from(chatData.value)
        .map((key, value) => MapEntry(key, ModelMessage.fromSnapshot(value)));
    StreamController<ModelMessage> controller =
        StreamController<ModelMessage>.broadcast();
    Map<String, dynamic> chat = {
      "controller": controller,
      "onChildAdded": chatRef.onChildAdded.listen((Event event) {
        ModelMessage newMessage =
            ModelMessage.fromSnapshot(event.snapshot.value);
        controller.add(newMessage);
        chatDataMap.addEntries([new MapEntry(event.snapshot.key, newMessage)]);
      }),
      "messages": chatDataMap
    };
    chats[ticketId] = chat;
    return chats[ticketId];
  }

  void sendMessage(String text, String imgUrl, String ticketId) {
    ModelMessage message = ModelMessage(
        imageUrl: imgUrl ?? "",
        message: text ?? "",
        type: imgUrl == "" ? "text" : "image",
        user: "user");
    _chatsRef.child(ticketId).push().update(message.toJson());
  }

  BlocTickets() {
    database = FirebaseDatabase();
    print("${database.databaseURL} url");
    _chatsRef = database.reference().child('chatsCollections');
    database.setPersistenceEnabled(true);
    database.setPersistenceCacheSizeBytes(10000000);
    chats = new Map();
  }

  @override
  void dispose() {
    _streamController.close();
  }
}
