import 'dart:async';

import 'package:flutter/material.dart';
import 'package:nextline/utils/app_session.dart';

class SplashScreen extends StatefulWidget {

  @override
  _SplashScreen createState() => new _SplashScreen();
}


class _SplashScreen extends State<SplashScreen> {
  Future checkSession() async {
    AppSession appSession = AppSession();
    return await appSession.isActiveSession();
  }

  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      checkSession().then( (isLoggedIn) {
        (isLoggedIn) ? Navigator.pushReplacementNamed(context, '/home') : 
        Navigator.pushNamed(context, '/login');
      });
    });
    
    
    
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        
        child: Column(      
          mainAxisAlignment: MainAxisAlignment.center,  
          children: [
            Padding(
                padding: const EdgeInsets.all(30),
                child: Image.asset('assets/images/splash.jpg',width:300),
              ),
            Center(child: CircularProgressIndicator())
          ],
        ),    
      )
    );
  }

}