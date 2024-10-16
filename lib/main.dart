import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:samplemodel/views/tools/settings.dart';
import 'package:stacked_services/stacked_services.dart';

import 'app/app.locator.dart';
import 'app/app.router.dart';

void main(){
  setupLocator();
  runApp( ChangeNotifierProvider(
      create: (context)=>Settings(),
      child: MyApp()));
}
class MyApp extends StatelessWidget {
   MyApp({super.key});

  @override
  Widget build(BuildContext context) {
   return MaterialApp(
         debugShowCheckedModeBanner: false,
         theme:Provider.of<Settings>(context).isdark?ThemeData.dark(
           useMaterial3: false
         )
             :  ThemeData(colorSchemeSeed: Colors.redAccent
           // primarySwatch: MaterialColor(0xffFCE900, {
           //   500 : Color(0xffFCE900)
           // })
         ),
         builder: (context,child){
           return MediaQuery(data: MediaQuery.of(context).copyWith(textScaler: TextScaler.linear(1)), child: child!);
         },
         onGenerateRoute: StackedRouter().onGenerateRoute,
         navigatorKey: StackedService.navigatorKey,
         navigatorObservers: [
           StackedService.routeObserver
         ],

   );
  }
}