import 'package:flutter/material.dart';
import 'timer_service.dart';

class TimerControls extends StatelessWidget {
  final TimerService timerService;

  const TimerControls({required this.timerService, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: timerService,
      builder: (context, _) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.tealAccent.shade700,
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                elevation: 5,
              ),
              onPressed: timerService.toggleTimer,
              icon: Icon(timerService.isRunning ? Icons.pause : Icons.play_arrow),
              label: Text(timerService.isRunning ? "Pause" : "Start"),
            ),
            const SizedBox(width: 20),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.grey.shade700,
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                elevation: 5,
              ),
              onPressed: timerService.reset,
              icon: const Icon(Icons.refresh),
              label: const Text("Reset"),
            ),
            const SizedBox(width: 20),

          ],
        );
      },
    );
  }
}
