import 'package:flutter/material.dart';

import 'Auth/ui/screens/login_screen.dart';
import 'ServiceRequest/ui/screen/personal_form_screen.dart';
import 'ServiceRequest/ui/screen/select_internet_plan_screen.dart';
import 'ServiceRequest/ui/screen/select_service_screen.dart';

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
        '/select-service': (context) => SelectServiceScreen(),
        '/select-internet-plan': (context) => SelectInternetPlanScreen(),
        '/personal-form': (context) => PersonalFormScreen(),
      },
    );
  }
}
