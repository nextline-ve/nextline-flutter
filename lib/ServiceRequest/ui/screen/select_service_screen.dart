import 'package:flutter/material.dart';
import 'package:nextline/ServiceRequest/bloc/bloc_service_request.dart';
import 'package:nextline/ServiceRequest/ui/widgets/services.dart';
import 'package:nextline/widgets/background.dart';
import 'package:nextline/widgets/jtitle.dart';
import 'package:nextline/widgets/line.dart';

class SelectServiceScreen extends StatelessWidget {
  BlocServiceRequest bloc = BlocServiceRequest();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(0, 109, 186, 1),
      ),
      body: Stack(
        children: [
          Background(pathImage: "assets/images/bg.jpg"),
          SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.only(top: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: 50),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        JTitle(title: "Selecciona"),
                        JTitle(title: "un Servicio"),
                        Line(
                          top: 10,
                        ),
                      ],
                    ),
                  ),
                  StreamBuilder(
                      stream: bloc.listServices,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return ListView.builder(
                            itemCount: snapshot.data.length,
                            shrinkWrap: true,
                            itemBuilder: (ctx, i) => Services(
                                id: snapshot.data[i].id,
                                name: snapshot.data[i].servicio));
                        }
                        
                        return Container(
                              child:
                                  Center(child: CircularProgressIndicator()));
                        
                      }),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
