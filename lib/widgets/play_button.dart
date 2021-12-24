import 'package:disney_plus/utils/ui/ui_utils.dart';
import 'package:flutter/material.dart';

class PlayButton extends StatelessWidget {
  final bool hasPlayed;

  const PlayButton({
    Key? key,
    required this.hasPlayed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: Colors.white,
        minimumSize: const Size(double.infinity, 40),
      ),
      onPressed: () => print('playing movie...'),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(
            Icons.play_arrow_rounded,
            color: Colors.black,
          ),
          Text(
            hasPlayed ? 'CONTINUE' : 'PLAY',
            style: kPlayButtonStyle,
          ),
        ],
      ),
    );
  }
}
