import 'package:disney_plus/widgets/base/widget_size.dart';
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

  double _getWatchedPercentage() {
    if (watched == null) return 0;
    return (watched! / duration) * 100;
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
          _WatchStatus(
            remainder: _remainder,
            watchedPercentage: _getWatchedPercentage(),
          ),
        ],
      ],
    );
  }
}

class _WatchStatus extends StatelessWidget {
  final int remainder;
  final double watchedPercentage;

  const _WatchStatus({
    required this.remainder,
    required this.watchedPercentage,
  });

  double _getStatusBarValue(Size size) {
    return (watchedPercentage / 100) * size.width;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: WidgetSize(
            builder: (context, size, child) {
              return Stack(
                children: [
                  Container(
                    height: 5,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade800,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  Container(
                    height: 5,
                    width: _getStatusBarValue(size),
                    decoration: BoxDecoration(
                      color: Colors.blueGrey,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
        const SizedBox(width: 10),
        Center(
          child: Text(
            '$remainder\m remaining',
            style: const TextStyle(fontSize: 12),
          ),
        ),
      ],
    );
  }
}
