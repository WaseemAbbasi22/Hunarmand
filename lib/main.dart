import 'package:Hunarmand_signIn_Ui/BusinessLogic/routegernator.dart';
import 'package:Hunarmand_signIn_Ui/Models/job_models/jobdetail_model.dart';
import 'package:Hunarmand_signIn_Ui/Service/auth.dart';
import 'package:Hunarmand_signIn_Ui/Service/mapservices/mapapp_bloc.dart';
import 'package:Hunarmand_signIn_Ui/controllers/appstate_controller.dart';
import 'package:Hunarmand_signIn_Ui/controllers/group_provider.dart';
import 'package:Hunarmand_signIn_Ui/controllers/joboffer_provider.dart';
import 'package:Hunarmand_signIn_Ui/controllers/postjob_provider.dart';
import 'package:Hunarmand_signIn_Ui/controllers/worker_provider.dart';
//import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AuthService>(
          create: (BuildContext context) {
            return AuthService();
          },
        ),
        // Provider(
        //   auth: AuthService(),
        // ),
        ChangeNotifierProvider<PostedJobProvider>(
          create: (BuildContext context) {
            return PostedJobProvider();
          },
        ),
        ChangeNotifierProvider<JobOfferProvider>(
          create: (BuildContext context) {
            return JobOfferProvider();
          },
        ),
        ChangeNotifierProvider<WorkerProvider>(
          create: (BuildContext context) {
            return WorkerProvider();
          },
        ),
        ChangeNotifierProvider<MapApplicationBloc>(
          create: (BuildContext context) {
            return MapApplicationBloc();
          },
        ),
        ChangeNotifierProvider<AppStateController>(
          create: (BuildContext context) {
            return AppStateController();
          },
        ),
        ChangeNotifierProvider<JobDetailProvider>(
          create: (BuildContext context) {
            return JobDetailProvider();
          },
        ),
        ChangeNotifierProvider<GroupProvider>(
          create: (BuildContext context) {
            return GroupProvider();
          },
        ),
      ],
      child: MaterialApp(
        // showPerformanceOverlay: true,
        theme: ThemeData(
            primarySwatch: Colors.deepOrange, primaryColor: Colors.deepOrange),
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        // home: AuthService().handleAuth(),
        onGenerateRoute: RouteGernator.generateRoute,
      ),
    );
  }
}
