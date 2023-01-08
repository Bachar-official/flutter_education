import 'package:flutter/cupertino.dart';
import 'package:redux/redux.dart';

loggingMiddleware(Store<int> store, action, NextDispatcher next) {
  debugPrint('${DateTime.now()}: $action');

  next(action);
}