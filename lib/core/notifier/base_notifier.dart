import 'package:flutter/material.dart';

abstract class BaseNotifier extends ChangeNotifier {
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();
  bool _isLoading = false;

  GlobalKey<NavigatorState> get navigatorKey => _navigatorKey;
  NavigatorState get navigator => _navigatorKey.currentState!;
  bool get isLoading => _isLoading;

  Future<void> init();

  void showLoading() {
    _isLoading = true;
    notifyListeners();
  }

  void hideLoading() {
    _isLoading = false;
    notifyListeners();
  }

  void showSnackBar(String message) {
    if (_navigatorKey.currentContext != null) {
      ScaffoldMessenger.of(_navigatorKey.currentContext!).showSnackBar(
        SnackBar(content: Text(message)),
      );
    }
  }
}