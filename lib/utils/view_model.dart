import 'package:flutter/foundation.dart';

class ViewModel extends ChangeNotifier {
  bool _isLoading = false;

  set isLoading(value) {
    _isLoading = value;
    notifyListeners();
  }

  get isLoading => _isLoading;
}
