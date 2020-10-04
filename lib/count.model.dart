

import 'package:easystate/easystate.dart';

class CountModel extends EasyState {
  int value = 0;
  increase() {
    value++;
    update();
  }
}
