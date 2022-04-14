import 'package:flutter/foundation.dart';
import 'package:test_provider/home_state.dart';

class HomeController extends ChangeNotifier {
  var homeState = HomeState();

  Future<void> loadData() async {
    homeState.loading = true;
    await Future.delayed(const Duration(seconds: 3));
    homeState.loading = false;
    notifyListeners();
  }

  Future onButtonClick() async {
    homeState.doing = true;
    notifyListeners();
    await Future.delayed(const Duration(seconds: 2));
    homeState.count++;
    homeState.doing = false;
    notifyListeners();
  }

  void colorClicked() {
    homeState.isOdd = !homeState.isOdd;
    notifyListeners();
  }
}
