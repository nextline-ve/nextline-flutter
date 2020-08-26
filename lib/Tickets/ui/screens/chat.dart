import 'dart:io';

import 'package:basic_utils/basic_utils.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nextline/Bills/ui/wdigets/item_detail_header.dart';
import 'package:nextline/Tickets/bloc/bloc_tickets.dart';
import 'package:nextline/Tickets/model/modal_message.dart';
import 'package:nextline/Tickets/model/model_ticket.dart';
import 'package:nextline/utils/app_colors.dart';
import 'package:nextline/utils/app_fonts.dart';
import 'package:nextline/widgets/image_viewer.dart';
import 'package:nextline/widgets/jloading_screen.dart';
import 'package:nextline/widgets/jtext_field.dart';
import 'package:nextline/widgets/line.dart';
import 'package:nextline/widgets/upload_image_modal.dart';

class Chat extends StatefulWidget {
  final picker = ImagePicker();
  final BlocTickets blocTickets;
  final Ticket ticket;

  Chat({Key key, @required this.blocTickets, @required this.ticket})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _Chat();
  }
}

class _Chat extends State<Chat> {
  final List<ModelMessage> messages = new List<ModelMessage>();
  final _messageForm = GlobalKey<FormState>();
  ScrollController _scrollController = new ScrollController();
  String _messageInput;
  String imageUrl = "";
  bool loadingImage = false;

  void getImage(ImageSource source) {
    widget.picker.getImage(source: source).then((PickedFile pickedFile) {
      print(pickedFile);
      setState(() {
        imageUrl = pickedFile.path;
        loadingImage = true;
      });
      // widget.blocTickets.sendMessage("", pickedFile.path, widget.ticket.id)
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.blue_dark,
        centerTitle: true,
        title: Text(
          'ASISTENCIA TÉCNICA',
          style: TextStyle(fontFamily: AppFonts.input, fontSize: 16),
        ),
      ),
      body: Stack(
        children: [
          Container(
            child: Column(
              children: [
                Container(
                  color: Colors.white,
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                  child: ItemDetailHeader(
                      date: widget.ticket.fechaCreacion,
                      status: widget.ticket.getStatusDisplay,
                      id: "Ticket ${widget.ticket.id}",
                      label: widget.ticket.detalle,
                      reverseLeft: true),
                ),
                Container(
                  child: Expanded(
                    child: FutureBuilder<ChatModel>(
                        future: widget.blocTickets.getChat(widget.ticket.id),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.done) {
                            return StreamBuilder<Object>(
                                stream: widget.blocTickets
                                    .chats[widget.ticket.id].controller.stream,
                                builder: (context, snapshot) {
                                  Future.delayed(Duration(milliseconds: 300))
                                      .then((value) {
                                    _scrollController.animateTo(
                                      _scrollController
                                          .position.maxScrollExtent,
                                      curve: Curves.easeOut,
                                      duration:
                                          const Duration(milliseconds: 300),
                                    );
                                    return null;
                                  });
                                  return ListView(
                                    controller: _scrollController,
                                    scrollDirection: Axis.vertical,
                                    shrinkWrap: true,
                                    children: widget
                                        .blocTickets
                                        .chats[widget.ticket.id]
                                        .messages
                                        .entries
                                        .map<Widget>((e) => _message(
                                            context,
                                            e.value.message,
                                            e.value.customId,
                                            e.value.date,
                                            e.value.customId == "Admin"))
                                        .toList(),
                                  );
                                });
                          }
                          return JLoadingScreen();
                        }),
                  ),
                ),
                if (imageUrl != "") _imageBox(),
                _box()
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _imageBox() {
    return Container(
        alignment: Alignment.bottomCenter,
        decoration: BoxDecoration(),
        child: Row(
          children: [
            Expanded(
              child: Container(
                color: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                        padding: EdgeInsets.all(10),
                        child: Image.asset(
                          imageUrl,
                          width: 50,
                          height: 50,
                        )),
                    Expanded(
                      child: Text("Imagen"),
                    ),
                    if (loadingImage)
                      SizedBox(
                        child: CircularProgressIndicator(
                          strokeWidth: 2.0,
                        ),
                        height: 15.0,
                        width: 15.0,
                      ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          loadingImage = false;
                          imageUrl = "";
                        });
                      },
                      child: ClipOval(
                          child: Container(
                              padding: EdgeInsets.all(10),
                              child: Icon(
                                Icons.close,
                                color: AppColors.blue,
                              ))),
                    ),
                  ],
                ),
              ),
            )
          ],
        ));
  }

  Widget _box() {
    return Form(
      key: _messageForm,
      child: Container(
        alignment: Alignment.bottomCenter,
        decoration: BoxDecoration(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Line(
              width: 100,
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    color: Colors.white,
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 15),
                            child: JTextField(
                                backgoundColor: AppColors.white_color,
                                label: "Escribe tu Mensaje",
                                inputType: TextInputType.text,
                                isPass: false,
                                onValidator: null,
                                onKeyValue: (val) {
                                  _messageInput = val;
                                  return val;
                                }),
                          ),
                        ),
                        GestureDetector(
                          onTap: () => {
                            if (imageUrl == "")
                              showMyDialog(context, "Enviar una foto", getImage)
                          },
                          child: ClipOval(
                              child: Container(
                                  padding: EdgeInsets.all(10),
                                  child: Icon(
                                    Icons.file_upload,
                                    color: imageUrl == ""
                                        ? AppColors.blue
                                        : AppColors.gray_color,
                                  ))),
                        ),
                        GestureDetector(
                          onTap: () {
                            if (imageUrl == "") {
                              widget.blocTickets.sendMessage(
                                  _messageInput, "", widget.ticket.id);
                              _messageForm.currentState.reset();
                            }
                          },
                          child: ClipOval(
                              child: Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                color: imageUrl == ""
                                    ? AppColors.blue_dark
                                    : AppColors.gray_color),
                            child: Icon(
                              Icons.send,
                              color: AppColors.white_color,
                            ),
                          )),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

Widget _nameLabel(String text) {
  return Text(
    StringUtils.capitalize(text),
    textAlign: TextAlign.center,
    style: TextStyle(
        fontFamily: AppFonts.poppins_bold,
        fontSize: 10,
        color: AppColors.blue_dark),
  );
}

Widget _dateLabel(String text) {
  return Text(
    text,
    style: TextStyle(
        fontFamily: AppFonts.poppins_regular,
        fontSize: 10,
        color: AppColors.light_gray_color.withOpacity(1)),
    softWrap: true,
  );
}

Widget _messageContent(String text, bool isLeft) {
  return Text(
    text,
    textAlign: isLeft ? TextAlign.left : TextAlign.right,
    style: TextStyle(
        fontFamily: AppFonts.poppins_regular,
        fontSize: 12,
        color: AppColors.black_color),
    softWrap: true,
  );
}

Widget _message(context, String text, String username, String date, bool isLeft,
    [String image = ""]) {
  List<Widget> children = [
    Container(
      transform: Matrix4.translationValues(0, 10, 0),
      child: Icon(
        Icons.account_circle,
        size: 50,
      ),
    ),
    Container(
      transform: Matrix4.translationValues(isLeft ? -15 : 15, 10, 0),
      child: Icon(isLeft ? Icons.arrow_left : Icons.arrow_right,
          size: 50,
          color: isLeft
              ? AppColors.light_gray_color.withOpacity(0.10)
              : AppColors.ligth_blue_color.withOpacity(0.1)),
    ),
    Expanded(
        child: Container(
      transform: Matrix4.translationValues(isLeft ? -35.5 : 35.5, 0, 0),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: isLeft
              ? AppColors.light_gray_color.withOpacity(0.10)
              : AppColors.ligth_blue_color.withOpacity(0.1),
          borderRadius: BorderRadius.circular(20)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
              padding: EdgeInsets.symmetric(vertical: 5),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _nameLabel("Albert"),
                    _dateLabel(date),
                  ])),
          if (image != "")
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ImageViewer(image: image)));
              },
              child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 5),
                  child: Image.asset(image, width: 300)),
            ),
          Padding(
              padding: EdgeInsets.symmetric(vertical: 5),
              child: _messageContent(text ?? "", isLeft))
        ],
      ),
    ))
  ];
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: isLeft ? children : children.reversed.toList()),
  );
}
