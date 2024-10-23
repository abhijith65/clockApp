
import 'package:stacked/stacked.dart';

class HomeViewModel extends BaseViewModel{
// Stream<String> clock() async*{
//   yield "${DateTime.now().hour}:${DateTime.now().minute}:${DateTime.now().second}";
 //}
bool _running=true;
Stream<String> clock(Duration d,bool lag) async* {
  while (_running) {
    await Future<void>.delayed(const Duration(seconds: 1));
   if(lag){
     DateTime now = DateTime.now().add(d);
     yield "${now.hour}:${now.minute}:${now.second}";
   }else{
     DateTime now = DateTime.now().subtract(d);
     yield "${now.hour}:${now.minute}:${now.second}";
   }
  }
}
List<Map<String,dynamic>> lc=[{'name':'tokyo','hour':3,'minute':30,'lag':true},{'name':'los angeles','hour':12,'minute':30,'lag':false}];
addclock(String n,int? h,int? m,bool d){
  lc.add({
    'name': n,
    'hour': h,
    'minute':m,
    'lag': d
  });
  notifyListeners();
}
removeclock(int index){
  lc.removeAt(index);
  notifyListeners();
}
}
