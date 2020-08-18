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
                _inputRow(),
              ],
            ),
          )
        ],
      ),
      endDrawer: LateralMenu(),
      bottomNavigationBar: NavigatorBar(),
    );
  }

  Widget _inputRow(){
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
                    child: Text("Nombre/Razon Social", style: TextStyle(color: AppColors.gray_text_color, fontSize: 12, fontFamily: AppFonts.fontTitle),),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 5, 0, 0),
                    child: Center(
                      child: JTextField(
                        label: "Nombre/Razon social",
                        inputType: TextInputType.text,
                        isPass: false,
                        backgoundColor: Colors.white,
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(285, 40, 0, 0),
                        child: InkWell(
                          onTap: _toggleInput,
                          child: Icon(Icons.border_color, color: Color.fromRGBO(2, 144, 223, 1)),
//                          child: Text("ico", style: TextStyle(color: AppColors.blue, fontSize: 19, fontFamily: AppFonts.poppins_bold),),
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
}