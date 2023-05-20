import '/pages/onboarding.dart';
import 'package:flutter/material.dart';
import 'package:arcore_flutter_plugin/arcore_flutter_plugin.dart';
import 'package:firebase_core/firebase_core.dart';

import 'screens/splash.dart';
import 'widgets/search_box.dart';


Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  print('ARCORE IS AVAILABLE?');
  print(await ArCoreController.checkArCoreAvailability());
  print('\nAR SERVICES INSTALLED?');
  print(await ArCoreController.checkIsArCoreInstalled());
  runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Colors.white,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: SplashScreen(),
      )
  );
}
//
// // import 'package:firebase_core/firebase_core.dart';
// // import 'package:firebase_database/firebase_database.dart';
// // import 'package:firebase_database/ui/firebase_animated_list.dart';
// // import 'package:flutter/material.dart';
// //
// // Future<void> main() async {
// //   WidgetsFlutterBinding.ensureInitialized();
// //   await Firebase.initializeApp();
// //   runApp(MaterialApp(
// //     home: MyApp()
// //   ));
// // }
// //
// // class MyApp extends StatefulWidget {
// //   const MyApp({Key? key}) : super(key: key);
// //
// //   @override
// //   State<MyApp> createState() => _MyAppState();
// // }
// //
// // class _MyAppState extends State<MyApp> {
// //   DatabaseReference db_Ref =
// //   FirebaseDatabase.instance.ref().child('mesh');
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       body: SingleChildScrollView(
// //         child: Container(
// //           child: FirebaseAnimatedList(
// //             query: db_Ref,
// //             shrinkWrap: true,
// //             itemBuilder: (BuildContext context, DataSnapshot snapshot, Animation<double> animation, int index) {
// //               Map mesh = snapshot.value as Map;
// //               return ListTile(
// //                 title: Text(mesh['name']),
// //                 subtitle: Text(mesh['Gender']),
// //               );
// //             },
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// // }