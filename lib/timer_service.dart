import 'dart:async';
import 'package:flutter/material.dart';


class TimerService extends ChangeNotifier {
  static const int workDuration = 25 * 60;
  static const int breakDuration = 5 * 60;

  late int _seconds;
  bool _isRunning = false;
  bool _isWorkTime = true;
  Timer? _timer;

  int get seconds => _seconds;
  bool get isRunning => _isRunning;
  bool get isWorkTime => _isWorkTime;

  void initialize() {
    _seconds = workDuration;
  }

  void toggleTimer() {
    if (_isRunning) {
      _pause();
    } else {
      _start();
    }
  }

  void _start() {
    _isRunning = true;
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_seconds > 0) {
        _seconds--;
      } else {
        _switchMode();
      }
      notifyListeners();
    });
    notifyListeners();
  }

  void _pause() {
    _isRunning = false;
    _timer?.cancel();
    notifyListeners();
  }

  void reset() {
    _pause();
    _seconds = isWorkTime ? workDuration : breakDuration;
    notifyListeners();
  }

  void _switchMode() {
    _isWorkTime = !_isWorkTime;
    _seconds = _isWorkTime ? workDuration : breakDuration;

    // Ses çal


  }


  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}
