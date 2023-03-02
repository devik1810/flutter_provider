import 'package:flutter/cupertino.dart';
import 'package:flutter_provider/screen/modal/modaldata.dart';

class HomeProvider extends ChangeNotifier {
  List<Stddata> l1 = [];

  void AddData(Stddata s1) {
    l1.add(s1);
    notifyListeners();
  }

  void DeletData(int index) {
    l1.removeAt(index);
    notifyListeners();
  }

  void UpdateData(int index, Stddata s1) {
    l1[index] = s1;
    notifyListeners();
  }
}
