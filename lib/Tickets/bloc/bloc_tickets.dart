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
    Map<String, dynamic> chatDataMap = Map.from(chatData.value);
    List<ModelMessage> messageList = chatDataMap.entries
        .map((e) => ModelMessage.fromSnapshot(e.value))
        .toList();
    Map<String, dynamic> chat = {
      "chatData": StreamController<ModelMessage>.broadcast(),
      "stream": chatRef.onChildAdded.listen((Event event) {
        chats[ticketId]["chatData"]
            .add(ModelMessage.fromSnapshot(event.snapshot.value));
      })
    };

    chats[ticketId] = chat;
    return chats[ticketId];
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
