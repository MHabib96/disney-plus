import 'package:disney_plus/widgets/base/widget_size.dart';
import 'package:flutter/material.dart';

class WatchStatusBar extends StatelessWidget {
  final int duration;
  final int watched;

  const WatchStatusBar({
    Key? key,
    required this.duration,
    required this.watched,
  }) : super(key: key);

  double _getStatusBarValue(Size size) {
    var watchedPercentage = (watched / duration) * 100;
    return (watchedPercentage / 100) * size.width;
  }

  @override
  Widget build(BuildContext context) {
    return WidgetSize(
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
    );
  }
}
