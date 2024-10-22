
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:samplemodel/app/app.router.dart';
import 'package:samplemodel/app/utils.dart';

import 'package:samplemodel/views/screens/home/home_viewmodel.dart';
import 'package:samplemodel/views/tools/settings.dart';
import 'package:stacked/stacked.dart';

import '../../../generated/l10n.dart';

class HomeView extends StatelessWidget {
 const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    debugPrint('home');
    final s=S.of(context);
   // var a='pop';
    return ViewModelBuilder<HomeViewModel>.reactive(
      builder: (context,model,child){
        return Scaffold(
          appBar: AppBar(
            title: Text(s.title),
          ),
          body: Center(
            child: Column(
              children: [
               StreamBuilder(stream: model.clock(), builder: (context,snapshot){
                 if(snapshot.data ==null)return Text('lol');
                 return Text(snapshot.data!,style:TextStyle(fontSize: 70) ,);
               })
              ],
            ),
          ),
          drawer: Drawer(
            child:ListView(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height*.2,
                  color: Colors.blueAccent,
                  child: Align(alignment: Alignment.bottomLeft,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(s.settings,style: TextStyle(fontSize: 28),),
                      )),
                ),
                ListTile(
                  leading: Icon(Icons.record_voice_over_outlined),
                  title:PopupMenuButton(
                    onSelected: (locale)=>Provider.of<Settings>(context,listen: false).setLocale(locale),
                    itemBuilder:(context)=>[
                      PopupMenuItem(child: Text('English'),value: Locale('en'),),
                      PopupMenuItem(child: Text('हिन्दी'),value: Locale('hi'),),
                    ],
                    child: Text(s.languages),
                  ) ,
                ),
                ListTile(
                  leading: Icon(Icons.mode_night),
                  title: Text(s.darkMode),
                  trailing: Switch(value: Provider.of<Settings>(context).isdark, onChanged: (o){
                    Provider.of<Settings>(context,listen: false).setTheme();
                    debugPrint('switch');
                  }),
                  // onTap:(){
                  //   Provider.of<Settings>(context,listen: false).setTheme();
                  // },
                ),
            // Text('${Provider.of<Settings>(context).isdark}')
              ],
            )
          ),
          floatingActionButton: FloatingActionButton(onPressed: (){
            navigationService.navigateTo(Routes.alarmView);
          },child: Icon(Icons.alarm),),

        );
      },
      viewModelBuilder: ()=>HomeViewModel(),
    );
  }

}
