import 'dart:async';

import 'package:shared/shared.dart';

class TimerBuilder extends StatefulWidget {
  final Widget Function(String time) child;
  final DateTime? startDateTime;
  final DateTime? endDateTime;

  const TimerBuilder({
    super.key,
    required this.child,
    required this.endDateTime,
    this.startDateTime,
  });

  @override
  State<TimerBuilder> createState() => _TimerBuilderState();
}

class _TimerBuilderState extends State<TimerBuilder> {
  Timer? _timer;
  late Duration _remaining;

  void _startTimer() {
    _updateRemaining();
    _timer = Timer.periodic(const Duration(seconds: 1), (_) => _updateRemaining());
  }

  void _updateRemaining() {
    final date = widget.startDateTime ?? DateTime.now();
    setState(() {
      _remaining = widget.endDateTime?.difference(date) ?? Duration.zero;
      if (_remaining.isNegative) {
        _remaining = Duration.zero;
        _timer?.cancel();
      }
    });
  }

  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final hours = twoDigits(duration.inHours);
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return '$hours:$minutes:$seconds';
  }

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final formattedTime = _formatDuration(_remaining);
    return widget.child(formattedTime);
  }
}
