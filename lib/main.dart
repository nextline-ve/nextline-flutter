import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:nextline/DeclarePayment/ui/screens/declare_payment_screen.dart';
import 'package:nextline/Bills/ui/screens/bill_sent.dart';
import 'package:nextline/Home/ui/screens/home_screen.dart';
// import 'package:nextline/Home/ui/screens/profile_screen.dart';
import 'package:nextline/Profile/ui/screens/profile_screen.dart';
import 'package:nextline/Technician/Assignment/ui/screens/assignments_screen.dart';
//import 'package:nextline/Home/ui/screens/profile_screen.dart';
// import 'package:nextline/Home/ui/screens/profile_screen.dart';
import 'package:nextline/Tickets/ui/screens/tickets_history.dart';

import 'Auth/bloc/bloc_auth.dart';
import 'Auth/ui/screens/login_screen.dart';
import 'Bills/ui/screens/bill_details_screen.dart';
import 'Bills/ui/screens/bills_screen.dart';
import 'ChangePlan/ui/screens/change_plan.dart';
import 'ChangePlan/ui/screens/confirm_change_plan.dart';
import 'ChangePlan/ui/screens/change_plan_sent.dart';
import 'Home/ui/screens/splash_screen.dart';
import 'ServiceRequest/ui/screen/address_map.dart';
import 'ServiceRequest/ui/screen/finalize_request_screen.dart';
import 'ServiceRequest/ui/screen/installations_screen.dart';
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
        initialRoute: '/',
        routes: {
          '/': (context) => SplashScreen(),
          '/login': (context) => LoginScreen(),
          '/select-service': (context) => SelectServiceScreen(),
          '/select-internet-plan': (context) => SelectInternetPlanScreen(),
          '/personal-form': (context) => PersonalFormScreen(),
          '/installation': (context) => InstallationsScreen(),
          '/address-map': (context) => AddressMap(),
          '/finalize-request': (context) => FinalizeRequestScreen(),
          '/home': (context) => HomeScreen(),
          '/tickets': (context) => HistoryTicketScreen(),
          // '/bills': (context) => BillsScreen(),
          // '/bill-details': (context) => BillDetailsScreen(),
          //'/profile': (context) => ProfileScreen(),
          //'/profile': (context) => ProfileScreen(),
          // '/declare-payments': (context) => DeclarePaymentScreen(),
          '/success-declare-payments': (context) => BillSent(),
          '/change-plan': (context) => ChangePlan(),
          '/confirm-change-plan': (context) => ConfirmChangePlan(),
          '/success-change-plan': (context) => ChangePlanSent(),
          '/profile': (context) => ProfileScreen(),
          '/technician-home': (context) => AssignmentsScreen()
        },
      ),
      bloc: BlocAuth(),
    );
  }
}
