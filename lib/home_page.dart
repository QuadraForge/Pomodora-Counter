import 'package:flutter/material.dart';
import 'timer_service.dart';
import 'timer_display.dart';
import 'timer_controls.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final timerService = TimerService();

  @override
  void initState() {
    super.initState();
    timerService.initialize();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF2C5364), Color(0xFF0F2027)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              const SizedBox(height: 20),
              const Text(
                'FocusMate',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  letterSpacing: 1.5,
                ),
              ),
              const SizedBox(height: 40),
              TimerDisplay(timerService: timerService),
              const SizedBox(height: 40),
              TimerControls(timerService: timerService),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    timerService.dispose();
    super.dispose();
  }
}
