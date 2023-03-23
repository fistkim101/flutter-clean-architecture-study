import 'dart:async';

import 'package:flutter_clean_architecture/presentation/simple_mvvm/simple_model.dart';

class SimpleViewModel {
  late SimpleModel _model;
  final StreamController<SimpleModel> _streamController =
      StreamController<SimpleModel>();

  Stream<SimpleModel> get mvvmStream => _streamController.stream;

  SimpleViewModel() {
    _model = SimpleModel();
  }

  void update() {
    _streamController.sink.add(_model);
  }

  void increaseCounter() {
    _model.count++;
    update();
  }

  void decreaseCounter() {
    _model.count--;
    update();
  }
}
