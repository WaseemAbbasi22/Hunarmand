import 'package:Hunarmand_signIn_Ui/BusinessLogic/routegernator.dart';
import 'package:Hunarmand_signIn_Ui/controllers/postjob_controller.dart';
import 'package:Hunarmand_signIn_Ui/controllers/postjob_provider.dart';
//import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<PostedJobProvider>(
      create: (BuildContext context) {
        return PostedJobProvider();
      },
      child: MaterialApp(
        // showPerformanceOverlay: true,
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        onGenerateRoute: RouteGernator.generateRoute,
      ),
    );
  }
}
