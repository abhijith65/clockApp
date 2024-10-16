import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:samplemodel/views/tools/settings.dart';
import 'package:stacked_services/stacked_services.dart';
import 'app/app.locator.dart';
import 'app/app.router.dart';
import 'generated/l10n.dart';
//import 'package:flutter_localizations/ src/ material_localizations. dart';
// flutter pub run build_runner build --delete-conflicting-outputs
//flutter pub run intl_utils:generate
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
         locale: Provider.of<Settings>(context).locale,
         supportedLocales: [
           Locale('en'),
           Locale('hi')
         ],
         localizationsDelegates: [
           S.delegate,
           GlobalMaterialLocalizations.delegate,
           GlobalWidgetsLocalizations.delegate,
           GlobalCupertinoLocalizations.delegate,
         ],
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