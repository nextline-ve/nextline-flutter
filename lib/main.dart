import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:nextline/Home/ui/screens/home_screen.dart';
import 'package:nextline/Tickets/ui/screens/chat.dart';
import 'package:nextline/Tickets/ui/screens/create_ticket.dart';
import 'package:nextline/Tickets/ui/screens/created_ticket.dart';
import 'package:nextline/Tickets/ui/screens/tickets_history.dart';

import 'Auth/bloc/bloc_auth.dart';
import 'Auth/ui/screens/login_screen.dart';
import 'ServiceRequest/ui/screen/instalations_screen.dart';
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
    return BlocProvider(
      child: MaterialApp(
        initialRoute: '/chat',
        routes: {
          '/': (context) => LoginScreen(),
          '/select-service': (context) => SelectServiceScreen(),
          '/select-internet-plan': (context) => SelectInternetPlanScreen(),
          '/personal-form': (context) => PersonalFormScreen(),
          '/instalations': (context) => InstalationsScreen(),
          '/home': (context) => HomeScreen(),
          '/tickets': (context) => HistoryTicketScreen(),
          '/create-ticket': (context) => CreateTicketScreen(),
          '/created-ticket': (context) => CreatedTicketScreen(),
          '/chat': (context) => Chat(),
        },
      ),
      bloc: BlocAuth(),
    );
  }
}
