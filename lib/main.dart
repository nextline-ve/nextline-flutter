import 'package:flutter/material.dart';

import 'apps/Auth/ui/screens/login_screen.dart';
import 'apps/ServiceRequest/ui/screen/selection_service_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => LoginScreen(),
        '/select-service': (context) => SelectionServiceScreen(),
      },
    );
  }
}
