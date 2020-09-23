import 'dart:async';
import 'dart:io';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:nextline/Technician/Assignment/model_assignment.dart';
import 'package:nextline/Tickets/model/modal_message.dart';
import 'package:nextline/Tickets/model/model_issue_type.dart';
import 'package:nextline/Tickets/model/model_ticket.dart';
import 'package:uuid/uuid.dart';

import '../repository_tickets.dart';

class BlocTickets implements Bloc {
  final RepositoryTickets repository = RepositoryTickets();
  DatabaseReference _chatsRef;
  FirebaseDatabase database;
  FirebaseStorage storage;
  Map<int, ChatModel> chats;
  StorageUploadTask _uploadTask;

  final StreamController<dynamic> _streamController =
      StreamController<dynamic>.broadcast();

  Sink<dynamic> get ticketEvents => _streamController.sink;
  // Stream<List<Ticket>> get responseDataTickets =>
  //     _streamController.stream.asyncMap((dynamic event) => _mapEvent(event));

  Future<List<Ticket>> getDataTickets() async {
    return await repository.getDataTicketsAPI();
  }

  Future<List<IssueType>> getDataIssueType() async {
    return await repository.getIssueTypeAPI();
  }

  Future<Ticket> createTicket(Ticket createTicketData) async {
    Ticket ticket = await repository.addTicket(createTicketData);
    sendMessage(ticket.detalle, "", ticket.id);
    return ticket;
  }

  Future<ChatModel> getChat(int ticketId) async {
    DatabaseReference chatRef = _chatsRef.child(ticketId.toString());
    DataSnapshot chatData = await chatRef.once();
    chats[ticketId] = ChatModel(chatRef, chatData);
    return chats[ticketId];
  }

  void sendMessage(String text, String imageUrl, int ticketId) {
    final now = DateTime.now();
    ModelMessage message = ModelMessage(
        imageUrl: imageUrl ?? "",
        message: text ?? "",
        type: imageUrl == "" ? "text" : "image",
        customId: "customId",
        date: "${now.year}-${now.month}-${now.day}");
    _chatsRef.child(ticketId.toString()).push().update(message.toJson());
  }

  Future<StorageTaskSnapshot> uploadImage(File image) {
    _uploadTask =
        storage.ref().child('images').child(Uuid().v4()).putFile(image);
    return _uploadTask.onComplete;
  }

  void cancelUpdload() {
    _uploadTask.cancel();
    if (_uploadTask.isComplete) {
      _uploadTask.lastSnapshot.ref.delete();
    }
  }

  Future<List<Ticket>> getAssignedTickets() async {
    return await repository.getAssignedTicketsAPI();
  }

  Future<Ticket> getDetailsAssignedTickets(id) async {
    return await repository.getDetailsAssignedTicketsAPI(id);
  }

  Future finishAssignment(Assignment assignment) async {
    return await repository.finishAssignmentAPI(assignment);
  }

  BlocTickets() {
    database = FirebaseDatabase();
    storage = FirebaseStorage();
    print("${database.databaseURL} url");
    _chatsRef = database.reference().child('chatsCollections');
    database.setPersistenceEnabled(true);
    chats = new Map<int, ChatModel>();
    database.setPersistenceCacheSizeBytes(10000000);
    // createTicketData = Ticket.fromPartial(detalle: "Detalle", asunto: 1);
    // createTicket();
  }

  @override
  void dispose() {
    _streamController.close();
    chats.forEach((key, value) {
      value.dispose();
    });
  }
}

class ChatModel {
  StreamController<ModelMessage> controller;
  StreamController<ModelMessage> sink;
  StreamSubscription<Event> onChildAdded;
  Map<String, ModelMessage> messages;

  ChatModel(DatabaseReference chatRef, DataSnapshot chatData) {
    Map<String, ModelMessage> chatDataMap = Map.from(chatData.value)
        .map((key, value) => MapEntry(key, ModelMessage.fromSnapshot(value)));
    messages = chatDataMap;
    controller = StreamController<ModelMessage>.broadcast();
    onChildAdded = chatRef.onChildAdded.listen((Event event) {
      ModelMessage newMessage = ModelMessage.fromSnapshot(event.snapshot.value);
      controller.add(newMessage);
      messages.addEntries([new MapEntry(event.snapshot.key, newMessage)]);
    });
  }

  void dispose() {
    onChildAdded.cancel();
    sink.close();
  }
}
