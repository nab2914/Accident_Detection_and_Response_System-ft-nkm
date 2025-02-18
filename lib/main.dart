import 'package:flutter/material.dart';
import 'monitoringscreen.dart';
import 'login.dart';
import 'settings.dart';
import 'registerpage.dart';
import 'user.dart';
import 'report.dart'; // Import the new page
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  try{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,);
  }catch(e){debugPrint('Initialization failed: $e');}
  runApp(MyApp());
}
// In main.dart (keep the rest as is)
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',  // Changed from 'home' to '/'
      routes: {
        '/': (context) => LoginRegisterPage(),  // Changed from 'home'
        '/monitoring': (context) => MonitoringPage(),
        '/settings': (context) => SettingsPage(),
        '/register': (context) => RegisterPage(),
        '/user': (context) => UserPage(),
        '/accident_report': (context) => AccidentReportPage(),
      },
    );
  }
}
/*
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: 'home',
      routes: {
        'home': (context) => LoginRegisterPage(),
        '/monitoring': (context) => MonitoringPage(),
        '/settings': (context) => SettingsPage(),
        '/register': (context) => RegisterPage(),
        '/user': (context) => UserPage(),
        '/accident_report': (context) => AccidentReportPage(), // Add new route
      },
    );
  }
}

*/