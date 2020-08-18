import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:nextline/DeclarePayment/ui/screens/declare_payment_screen.dart';
import 'package:nextline/Home/ui/screens/home_screen.dart';
import 'package:nextline/Tickets/ui/screens/chat.dart';
import 'package:nextline/Tickets/ui/screens/create_ticket.dart';
import 'package:nextline/Tickets/ui/screens/tickets_history.dart';

import 'Auth/bloc/bloc_auth.dart';
import 'Auth/ui/screens/login_screen.dart';
import 'Bills/ui/screens/bill_details_screen.dart';
import 'Bills/ui/screens/bills_screen.dart';
import 'ChangePlan/ui/screens/change_plan.dart';
import 'ChangePlan/ui/screens/confirm_change_plan.dart';
import 'Home/ui/screens/splash_screen.dart';
import 'ServiceRequest/ui/screen/finalize_request_screen.dart';
import 'ServiceRequest/ui/screen/installations_screen.dart';
import 'ServiceRequest/ui/screen/personal_form_screen.dart';
import 'ServiceRequest/ui/screen/select_internet_plan_screen.dart';
import 'ServiceRequest/ui/screen/select_service_screen.dart';
import 'Tickets/ui/screens/success_create_ticket.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      child: MaterialApp(
        initialRoute: '/',
        routes: {
          '/': (context) => SplashScreen(),
          '/login': (context) => LoginScreen(),
          '/select-service': (context) => SelectServiceScreen(),
          '/select-internet-plan': (context) => SelectInternetPlanScreen(),
          '/personal-form': (context) => PersonalFormScreen(),
          '/installation': (context) => InstallationsScreen(),
          '/finalize-request': (context) => FinalizeRequestScreen(),
          '/home': (context) => HomeScreen(),
          '/tickets': (context) => HistoryTicketScreen(),
          '/create-ticket': (context) => CreateTicketScreen(),
          '/success-create-ticket': (context) => SuccessCreateTicketScreen(),
          '/chat': (context) => Chat(),
          '/bills': (context) => BillsScreen(),
          '/bill-details': (context) => BillDetailsScreen(),
          '/change-plan': (context) => ChangePlan(),
          '/declare-payments': (context) => DeclarePaymentScreen(),
          '/confirm-change-plan': (context) => ConfirmChangePlan(),
        },
      ),
      bloc: BlocAuth(),
    );
  }
}
