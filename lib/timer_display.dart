import 'package:flutter/material.dart';
import 'timer_service.dart';

class TimerDisplay extends StatelessWidget {
  final TimerService timerService;

  const TimerDisplay({required this.timerService, Key? key}) : super(key: key);

  String formatTime(int seconds) {
    final minutes = (seconds ~/ 60).toString().padLeft(2, '0');
    final secs = (seconds % 60).toString().padLeft(2, '0');
    return '$minutes:$secs';
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: timerService,
      builder: (context, _) {
        final percent = timerService.seconds /
            (timerService.isWorkTime
                ? TimerService.workDuration
                : TimerService.breakDuration);
        final label = timerService.isWorkTime ? "Focus Time" : "Break Time";

        return Column(
          children: [
            Text(
              label,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w500,
                color: Colors.white70,
              ),
            ),
            const SizedBox(height: 24),
            Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  width: 220,
                  height: 220,
                  child: CircularProgressIndicator(
                    value: percent,
                    strokeWidth: 10,
                    backgroundColor: Colors.white12,
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.tealAccent),
                  ),
                ),
                Text(
                  formatTime(timerService.seconds),
                  style: const TextStyle(
                    fontSize: 48,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
