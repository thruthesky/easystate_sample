
import 'package:easystate/easystate.dart';

class TestModel extends EasyState {
  int value = 100;
  decrease() {
    value--;
    update();
  }
}
