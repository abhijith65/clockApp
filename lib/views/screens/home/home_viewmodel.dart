
import 'package:stacked/stacked.dart';

class HomeViewModel extends BaseViewModel{
// Stream<String> clock() async*{
//   yield "${DateTime.now().hour}:${DateTime.now().minute}:${DateTime.now().second}";
 //}
bool _running=true;
Stream<String> clock() async* {
  while (_running) {
    await Future<void>.delayed(const Duration(seconds: 1));
    DateTime now = DateTime.now();
    yield "${now.hour}:${now.minute}:${now.second}";
  }
}

}
