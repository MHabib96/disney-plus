import 'package:disney_plus/widgets/helpers/watch_status_bar.dart';
import 'package:disney_plus/widgets/play_button.dart';
import 'package:flutter/material.dart';

class PlayButtonWithStatus extends StatelessWidget {
  final int duration;
  final int? watched;

  const PlayButtonWithStatus({
    Key? key,
    required this.duration,
    this.watched,
  }) : super(key: key);

  int _getRemainingMinutes() {
    if (watched == null) return 0;
    return duration - watched!;
  }

  @override
  Widget build(BuildContext context) {
    final _remainder = _getRemainingMinutes();
    final _hasPlayed = _remainder != 0;

    return Column(
      children: [
        PlayButton(hasPlayed: _hasPlayed),
        if (_hasPlayed) ...[
          const SizedBox(height: 5),
          _WatchStatusWithMinutes(
            duration: duration,
            watched: watched!,
          ),
        ],
      ],
    );
  }
}

class _WatchStatusWithMinutes extends StatelessWidget {
  final int duration;
  final int watched;

  const _WatchStatusWithMinutes({
    required this.duration,
    required this.watched,
  });

  @override
  Widget build(BuildContext context) {
    int _remainder = duration - watched;

    return Row(
      children: [
        Expanded(
          child: WatchStatusBar(
            duration: duration,
            watched: watched,
          ),
        ),
        const SizedBox(width: 10),
        Center(
          child: Text(
            '$_remainder\m remaining',
            style: const TextStyle(fontSize: 12),
          ),
        ),
      ],
    );
  }
}
