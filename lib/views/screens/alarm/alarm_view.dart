import 'package:flutter/material.dart';
import 'package:samplemodel/views/screens/alarm/alarm_viewmodel.dart';
import 'package:stacked/stacked.dart';

class AlarmView extends StatelessWidget {
  const AlarmView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AlarmViewModal>.reactive(viewModelBuilder: ()=>AlarmViewModal(), builder: (context,model,child){
      return Scaffold(
        appBar: AppBar(
          title: Text('Alarms')
        ),
        body: model.la.isEmpty?Center(child: Text('set an alarm')):
        ListView.builder(
          itemCount: model.la.length,
            itemBuilder: (context,index){
          return ListTile(
            leading: IconButton(onPressed: (){model.removealarm(index);}, icon: Icon(Icons.remove_circle_outline)),
            title: Text('${model.la[index]['hour']}:${model.la[index]['minute']}'),
            trailing: Switch(value: !model.la[index]['done'], onChanged: (value){
              model.alarmdone(index);
            }),
          );
        }),
        floatingActionButton: FloatingActionButton(
            onPressed: () async {
              TimeOfDay? settime = await showTimePicker(context: context, initialTime: TimeOfDay(hour: 0, minute: 0));
              model.addalarm(settime!.hour, settime.minute);
        },
        child: Icon(Icons.add_alarm),),
      );
    });
  }
}
