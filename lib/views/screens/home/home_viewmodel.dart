
import 'package:stacked/stacked.dart';

class HomeViewModel extends BaseViewModel{
Stream<String> clock() async*{
  yield "${DateTime.now().hour}:${DateTime.now().minute}";
}
}