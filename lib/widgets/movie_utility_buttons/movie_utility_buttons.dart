import 'package:disney_plus/widgets/custom_animated_icon.dart';
import 'package:flutter/material.dart';

part 'utility_button.dart';

class MovieUtilityButtons extends StatelessWidget {
  const MovieUtilityButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: const [
        CustomAnimatedIcon(
          startIcon: Icons.add,
          endIcon: Icons.check,
          duration: Duration(milliseconds: 500),
          startIconColor: Colors.white,
          endIconColor: Colors.blue,
          iconSize: 26,
          beginRotation: 0.5,
          endRotation: 1.0,
          label: 'Watchlist',
          padding: EdgeInsets.all(5),
        ),
        _UtilityButton(
          icon: Icons.groups_rounded,
          label: 'GroupWatch',
        ),
        _UtilityButton(
          icon: Icons.movie_creation_outlined,
          label: 'Trailer',
        ),
        _UtilityButton(
          icon: Icons.download,
          label: 'Download',
        ),
      ],
    );
  }
}
