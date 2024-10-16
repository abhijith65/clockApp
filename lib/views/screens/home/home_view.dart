import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:samplemodel/views/screens/home/home_viewmodel.dart';
import 'package:samplemodel/views/tools/settings.dart';
import 'package:stacked/stacked.dart';

import '../../../generated/l10n.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final s=S.of(context);
   // var a='pop';
    return ViewModelBuilder<HomeViewModel>.reactive(
      builder: (context,model,child){
        return Scaffold(
          appBar: AppBar(
            title: Text(s.title),
          ),
          body: Center(
            child: Icon(Icons.waving_hand_rounded),
          ),
          drawer: Drawer(
            child:ListView(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height*.2,
                  color: Colors.blueAccent,
                  child: Align(alignment: Alignment.bottomLeft,
                      child: Text('Settings',style: TextStyle(fontSize: 28),)),
                ),
                ListTile(title: Text(''),
                 // title:PopupMenuButton(itemBuilder: Text('')),
                  // onTap: (){
                  //  // Provider.of<Settings>(context).setLocale(locale)
                  // },
                ),
                ListTile(
                  title: Text('dark mode'),
                  trailing: Switch(value: Provider.of<Settings>(context).isdark, onChanged: (o){
                    Provider.of<Settings>(context,listen: false).setTheme();
                    debugPrint('switch');
                  }),
                  onTap:(){
                    Provider.of<Settings>(context,listen: false).setTheme();
                  },
                ),
             Text('${Provider.of<Settings>(context).isdark}')
              ],
            )
          ),

        );
      },
      viewModelBuilder: ()=>HomeViewModel(),
    );
  }
}
