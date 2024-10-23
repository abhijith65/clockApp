
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
    TextEditingController name=TextEditingController();
    TextEditingController hour=TextEditingController();
    TextEditingController minute=TextEditingController();
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
               Container(color: Colors.grey,
                 child: StreamBuilder(stream: model.clock(Duration(minutes: 0),true), builder: (context,snapshot){
                   if(snapshot.data ==null)return Text('lol');
                   return Text(snapshot.data!,style:TextStyle(fontSize: 70) ,);
                 }),
               ),
                ListTile(
                  title:Text( "world clocks"),
                  trailing: IconButton(onPressed: (){
                    showDialog(context: context, builder: (context){
                      return SimpleDialog(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(18.0),
                            child: TextField(
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: 'cityname'
                              ),controller: name,
                              textInputAction: TextInputAction.next,
                            ),
                          ),
                          //Text('time zone',textAlign: TextAlign.center,),
                          Wrap(
                            alignment: WrapAlignment.spaceEvenly,
                            children: [
                              Container(
                                width: 50,
                                child:  TextField(
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder(),filled: true,
                                      hintText: 'h'
                                  ),controller: hour, textInputAction:TextInputAction.next,
                                ),
                              ),
                              Container(
                                width: 50,
                                child:  TextField(
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder(),filled: true,
                                      hintText: 'm'
                                  ),controller: minute,
                                ),
                              )
                            ],
                          ),
                          MaterialButton(onPressed: (){
                            model.addclock(name.text,int.tryParse(hour.text)!, int.tryParse(minute.text),true);
                            Navigator.pop(context);

                          },child: Text('ok'),)
                        ],
                      );
                    });
                  }, icon: Icon(Icons.add)),
                ),
                model.lc.isEmpty?Container(
                  child: Text('no clocks'),
                ):Expanded(
                  child: ListView.builder(
                    itemCount: model.lc.length,
                      itemBuilder: (context,index){
                    return ListTile(
                      onTap: (){
                        print(model.lc[index]);
                      },
                      leading: IconButton(onPressed: (){
                        model.removeclock(index);
                      }, icon: Icon(Icons.remove_circle_outline)),
                      title: Text(model.lc[index]['name']),
                      trailing:  StreamBuilder(stream: model.clock(Duration(hours: model.lc[index]['hour'],minutes: model.lc[index]['minute']),model.lc[index]['lag']), builder: (context,snapshot){
                        if(snapshot.data ==null)return Text('lol');
                        return Text(snapshot.data!,style:TextStyle(fontSize: 20) ,);
                      }),
                    );
                  }),
                )
                
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
                    onSelected: (locale)=>
                        //locator<Settings>().setLocale(locale),
                        Provider.of<Settings>(context,listen: false).setLocale(locale),
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
