import 'package:flutter/material.dart';
import 'package:nextline/Tickets/ui/widgets/background_tickets.dart';
import 'package:nextline/utils/app_colors.dart';
import 'package:nextline/utils/app_fonts.dart';
import 'package:nextline/widgets/jtext_field.dart';
import 'package:nextline/widgets/lateral_menu.dart';
import 'package:nextline/widgets/navigator_bar.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.blue_dark,
        title: Text(
          'PERFIL',
          style: TextStyle(fontFamily: AppFonts.input),
        ),
      ),
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
//          BackgroundTickets(),
          Container(
            child: ListView(
              children: [
                Center(
                  child: Container(
                    margin: EdgeInsets.only(top: 45),
                    child: Text("Avatar", style: TextStyle(color: AppColors.blue, fontSize: 19, fontFamily: AppFonts.poppins_bold),),
                  ),
                ),
                _inputRow("raz_cocial","Nombre/Razon social", "Nombre/Razon social", false),
                _inputRow("cedula","Cedula / RIF", "Cedula / RIF", false),
                _inputRow("telf","Número de Teléfono", "Número de Teléfono", false),
                _inputRow("email","Correo Electrónico", "Correo Electrónico", false),
                _inputRow("password","Cambiar Contraseña", "Cambiar Contraseña", true),
              ],
            ),
          )
        ],
      ),
      endDrawer: LateralMenu(),
      bottomNavigationBar: NavigatorBar(),
    );
  }

  Widget _inputRow(name, placeholder, value, isPassword){
    return Center(
      child: Container(
        margin: EdgeInsets.only(top: 35),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: Stack(
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
                    child: Text(placeholder, style: TextStyle(color: AppColors.gray_text_color, fontSize: 12, fontFamily: AppFonts.fontTitle),),
                  ),
                  if(!isPassword)
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 5, 0, 0),
                    child: Center(
                      child: JTextField(
                        label: placeholder,
                        inputType: TextInputType.text,
                        isPass: isPassword,
                        backgoundColor: Colors.white,
                      ),
                    ),
                  ),
                  if(isPassword)
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 5, 0, 0),
                    child: Center(
                      child: JTextField(
                        label: placeholder,
                        inputType: TextInputType.text,
                        isPass: isPassword,
                        backgoundColor: Colors.white,
                        icon: Icon(Icons.lock),
                      ),
                    ),
                  ),
                  if(!isPassword)
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(285, 40, 0, 0),
                        child: InkWell(
                          onTap: _toggleInput,
                          child: Icon(Icons.border_color, color: Color.fromRGBO(2, 144, 223, 1)),
                        ),
                      ),
                    ],
                  ),
                  if(isPassword)
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(15, 40, 0, 0),
                        child: InkWell(
                          onTap: _toggleShowPassword,
                          child: Icon(Icons.lock, color: Color.fromRGBO(2, 144, 223, 1)),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(246, 40, 0, 0),
                        child: InkWell(
                          onTap: _toggleInput,
                          child: Icon(Icons.border_color, color: Color.fromRGBO(2, 144, 223, 1)),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _toggleInput(){
    print("toggle ");
  }

  void _toggleShowPassword(){
    print("_toggleShowPassword ");
  }
}