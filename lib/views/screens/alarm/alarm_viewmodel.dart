import 'package:stacked/stacked.dart';

class AlarmViewModal extends BaseViewModel{
List<Map<String,dynamic>> la=[];
addalarm(int h,int m){
  la.add({
    'hour': '$h',
    'minute':'$m',
    'done': false
  });
  notifyListeners();
}
removealarm(int index){
  la.removeAt(index);
  notifyListeners();
}

  void alarmdone(int index) {
    la[index]['done']=true;
    notifyListeners();
  }
}