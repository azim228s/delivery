import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

import 'base_screen_state.dart';
import 'base_view_model.dart';

abstract class BasePresenter<M extends BaseViewModel> {
  M model;
  final BehaviorSubject<M> _subject = BehaviorSubject<M>();
  late BuildContext context;

  Stream<M> get stream => _subject.stream;

  BasePresenter(this.model);

  void initWithContext(BuildContext context) {
    bool firstInit = false;
    try {
      // ignore: unnecessary_statements
      this.context.hashCode != 0;
    } catch (e) {
      firstInit = true;
    }
    this.context = context;
    if (firstInit) onInitWithContext();
  }

  void onInitWithContext() {}

  void dispose() {
    _subject.close();
  }

  void updateView() {
    if (!_subject.isClosed) _subject.sink.add(model);
  }

  void startLoading() {
    model.state = ScreenState.Loading;
    updateView();
  }

  void endLoading() {
    model.state = ScreenState.Done;
    updateView();
  }

  void startReading() {
    model.state = ScreenState.Reading;
    updateView();
  }

  void goBack() => Navigator.of(context).pop();

  void endLoadingWithError() {
    model.state = ScreenState.Error;
    updateView();
  }
}
