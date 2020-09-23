import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nextline/Technician/Assignment/model_assignment.dart';
import 'package:nextline/Tickets/bloc/bloc_tickets.dart';
import 'package:nextline/Tickets/ui/widgets/input_container.dart';
import 'package:nextline/utils/app_colors.dart';
import 'package:nextline/utils/app_fonts.dart';
import 'package:nextline/widgets/jbutton.dart';
import 'package:nextline/widgets/upload_image_modal.dart';

class FailedRepairScreen extends StatefulWidget {
  final Assignment assignment;
  final BlocTickets blocTickets;
  FailedRepairScreen(
      {Key key, @required this.assignment, @required this.blocTickets})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _FailedRepairScreen();
  }
}

class _FailedRepairScreen extends State<FailedRepairScreen> {
  final picker = ImagePicker();
  List<String> _uploadedFiles = new List<String>();
  String _observacion;
  String _fotoUno;
  String _fotoDos;
  String _fotoTres;
  String _fotoCuatro;

  void getImage(ImageSource source) {
    picker.getImage(source: source).then((PickedFile pickedFile) async {
      print(pickedFile);
      setState(() {
        _uploadedFiles.add(pickedFile.path);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.blue_dark,
          centerTitle: true,
          title: Text(
            'ASIGNACIONES TÉCNICAS',
            textAlign: TextAlign.center,
            style: TextStyle(fontFamily: AppFonts.input, fontSize: 16),
          ),
        ),
        body: Stack(children: [
          Container(
              alignment: Alignment.center,
              color: Colors.white,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                        padding: EdgeInsets.all(20),
                        child: Text(
                          "¿Por qué no se logró\nsolventar la falla?",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: AppColors.blue_dark,
                            fontSize: 18,
                            fontFamily: AppFonts.poppins_bold,
                          ),
                        )),
                    Expanded(
                      child: ListView(
                        scrollDirection: Axis.vertical,
                        children: [
                          Column(children: [
                            InputContainer(
                              label: "Trabajo Realizado",
                              input: TextFormField(
                                maxLines: 8,
                                decoration: InputDecoration.collapsed(
                                    hintText: "Describa el trabajo realizado",
                                    hintStyle: TextStyle(
                                        color: AppColors.black_color
                                            .withOpacity(0.34),
                                        fontSize: 12,
                                        fontFamily: AppFonts.poppins_regular)),
                                onChanged: (val) => _observacion = val,
                              ),
                            ),
                            Container(
                              width: 250,
                              child: JButton(
                                padding: EdgeInsets.all(10),
                                icon: Icons.camera_alt,
                                isIconRight: true,
                                fontSize: 10,
                                labelColor: AppColors.white_color,
                                label: "Subir Foto",
                                background: AppColors.blue,
                                buttonHeight: 40.0,
                                onTab: () => {
                                  showMyDialog(
                                      context, "Seleccionar una foto", getImage)
                                },
                              ),
                            ),
                            if (_uploadedFiles.length > 0)
                              Container(
                                height: 150,
                                child: ListView(
                                  shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                  children: _uploadedFiles
                                      .map((file) => Container(
                                            width: 100,
                                            height: 50,
                                            margin: EdgeInsets.all(10),
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                                image: DecorationImage(
                                                    image: AssetImage(file),
                                                    fit: BoxFit.cover)),
                                          ))
                                      .toList(),
                                ),
                              ),
                          ]),
                        ],
                      ),
                    ),
                    JButton(
                      label: "FINALIZAR",
                      background: AppColors.green_color,
                      onTab: () {
                        widget.assignment.observacion = this._observacion;
                        if (_uploadedFiles.length > 0)
                          widget.assignment.fotoUno =
                              Assignment.imageToBase64(this._uploadedFiles[0]);
                        if (_uploadedFiles.length > 1)
                          widget.assignment.fotoDos =
                              Assignment.imageToBase64(this._uploadedFiles[1]);
                        if (_uploadedFiles.length > 2)
                          widget.assignment.fotoTres =
                              Assignment.imageToBase64(this._uploadedFiles[2]);
                        if (_uploadedFiles.length > 3)
                          widget.assignment.fotoCuatro =
                              Assignment.imageToBase64(this._uploadedFiles[3]);
                        widget.assignment.realizado = false;
                        widget.blocTickets.finishAssignment(widget.assignment);
                        Navigator.pushReplacementNamed(
                            context, '/technician-home');
                      },
                    ),
                  ]))
        ]));
  }
}
