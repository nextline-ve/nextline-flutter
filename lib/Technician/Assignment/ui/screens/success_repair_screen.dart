import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nextline/Technician/Assignment/ui/screens/client_confirmation_screen.dart';
import 'package:nextline/Tickets/ui/widgets/dropdown.dart';
import 'package:nextline/Tickets/ui/widgets/input_container.dart';
import 'package:nextline/utils/app_colors.dart';
import 'package:nextline/utils/app_fonts.dart';
import 'package:nextline/widgets/jbutton.dart';
import 'package:nextline/widgets/upload_image_modal.dart';

class SuccessRepairScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SuccessRepairScreen();
  }
}

class _SuccessRepairScreen extends State<SuccessRepairScreen> {
  final picker = ImagePicker();
  List<String> _uploadedFiles = new List<String>();
  List<Map> _materialUsado = new List<Map>();

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
              margin: EdgeInsets.symmetric(horizontal: 20),
              alignment: Alignment.center,
              color: Colors.white,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                        padding: EdgeInsets.all(20),
                        child: Text(
                          "Reparación de Avería",
                          style: TextStyle(
                              color: AppColors.blue_dark,
                              fontSize: 18,
                              fontFamily: AppFonts.poppins_bold),
                        )),
                    Expanded(
                      child: ListView(
                        scrollDirection: Axis.vertical,
                        children: [
                          Column(children: [
                            InputContainer(
                              label: "Trabajo Realizado",
                              padding: EdgeInsets.only(
                                  left: 0, right: 0, bottom: 24),
                              input: TextFormField(
                                maxLines: 8,
                                decoration: InputDecoration.collapsed(
                                    hintText: "Describa el trabajo realizado",
                                    hintStyle: TextStyle(
                                        color: AppColors.black_color
                                            .withOpacity(0.34),
                                        fontSize: 12,
                                        fontFamily: AppFonts.poppins_regular)),
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
                            if (_materialUsado.length > 0)
                              Container(
                                height: 300,
                                child: ListView(
                                  children: _materialUsado
                                      .map(
                                        (mat) => Row(children: [
                                          Expanded(
                                            flex: 2,
                                            child: InputContainer(
                                                padding: EdgeInsets.only(
                                                    left: 24,
                                                    right: 10,
                                                    bottom: 24),
                                                label: "Material Utilizado",
                                                input: DropdownWidget(
                                                  hintText:
                                                      "Seleccione un material",
                                                  options: [],
                                                )),
                                          ),
                                          Expanded(
                                            flex: 1,
                                            child: InputContainer(
                                              padding: EdgeInsets.only(
                                                  left: 10,
                                                  right: 24,
                                                  bottom: 24),
                                              label: "Cantidad",
                                              input: TextFormField(
                                                keyboardType:
                                                    TextInputType.number,
                                                decoration:
                                                    InputDecoration.collapsed(
                                                        hintText: "0",
                                                        hintStyle: TextStyle(
                                                            color: AppColors
                                                                .black_color
                                                                .withOpacity(
                                                                    0.34),
                                                            fontSize: 18,
                                                            height: 2.8,
                                                            fontFamily: AppFonts
                                                                .poppins_regular)),
                                              ),
                                            ),
                                          ),
                                        ]),
                                      )
                                      .toList(),
                                ),
                              ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        _materialUsado
                                            .add({"value": "", "quantity": 0});
                                      });
                                    },
                                    child: Container(
                                        padding: EdgeInsets.all(10),
                                        child: Icon(
                                          Icons.add,
                                          color: Colors.white,
                                        ),
                                        decoration: BoxDecoration(
                                          color: AppColors.blue_dark,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ))),
                              ],
                            ),
                          ]),
                        ],
                      ),
                    ),
                    JButton(
                      label: "CONFIRMACIÓN DEL CLIENTE",
                      padding: EdgeInsets.symmetric(vertical: 20),
                      background: AppColors.green_color,
                      onTab: () => {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    ClientConfirmationScreen()))
                      },
                    ),
                  ]))
        ]));
  }
}
