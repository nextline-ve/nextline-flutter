import 'package:flutter/cupertino.dart';

class HStatusService extends StatefulWidget {
  HStatusService({Key key}) : super(key: key);

  @override
  _HStatusServiceState createState() => _HStatusServiceState();
}

class _HStatusServiceState extends State<HStatusService> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        child: Text("todo"),
      ),
    );
  }
}
