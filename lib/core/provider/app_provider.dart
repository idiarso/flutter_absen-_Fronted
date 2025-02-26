import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

abstract class AppProvider with ChangeNotifier {
  bool _isLoading = false;
  bool _isDispose = false;
  String _errorMessage = '';
  String _snackbarMessage = '';
  late NavigatorState navigator;
  late BuildContext context;

  bool get isLoading => _isLoading;
  bool get isDispose => _isDispose;
  String get errorMessage => _errorMessage;
  String get snackbarMessage => _snackbarMessage;

  set errorMeesage(String param) => _errorMessage = param;
  set snackbarMessage(String param) => _snackbarMessage = param;

  void setContext(BuildContext context) {
    this.context = context;
    navigator = Navigator.of(context);
  }

  void showSnackBar(String message) {
    if (context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(message)),
      );
    }
  }

  void showLoading() {
    _isLoading = true;
    notifyListeners();
  }

  void hideLoading() {
    _isLoading = false;
    notifyListeners();
  }

  void init();

  @override
  void dispose() {
    _isDispose = true;
    super.dispose();
  }
}
