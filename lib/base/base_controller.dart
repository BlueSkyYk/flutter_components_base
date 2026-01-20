import 'package:flutter/material.dart';

abstract class BaseController {
  bool _isInitialized = false;
  bool _isVisible = false;
  bool _isDisposed = false;

  bool get isInitialized => _isInitialized;

  bool get isVisible => _isVisible;

  bool get isDisposed => _isDisposed;

  TickerProvider? _tickerProvider;

  TickerProvider? get tickerProvider => _tickerProvider;

  final ValueNotifier<bool> canGesturePop = ValueNotifier<bool>(true);

  void setTickerProvider(TickerProvider provider) {
    _tickerProvider = provider;
  }

  void removeTickerProvider() {
    _tickerProvider = null;
  }

  void pageInit() {
    _isInitialized = true;
    onPageInit();
  }

  void firstFrameRendering() {
    onFirstFrameRendering();
  }

  void pageClose() {
    _isDisposed = true;
    onPageClose();
  }

  @protected
  void onPageInit() {}

  @protected
  void onFirstFrameRendering() {}

  @protected
  void onPageShow() {}

  @protected
  void onPageHide() {}

  @protected
  void onPageClose() {}

  void onUpdateVisible(bool visible) {
    if (visible) {
      _isVisible = true;
      onPageShow();
    } else {
      _isVisible = false;
      onPageHide();
    }
  }

  void setCanGesturePop(bool value) {
    canGesturePop.value = value;
  }
}
