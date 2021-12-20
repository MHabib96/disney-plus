import 'package:flutter/material.dart';

class MovieUtilityButtons extends StatelessWidget {
  const MovieUtilityButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: const [
        _UtilityButton(icon: Icons.add, label: 'Watchlist'),
        _UtilityButton(icon: Icons.groups_rounded, label: 'GroupWatch'),
        _UtilityButton(icon: Icons.movie_creation_outlined, label: 'Trailer'),
        _UtilityButton(icon: Icons.download, label: 'Download'),
      ],
    );
  }
}

class _UtilityButton extends StatelessWidget {
  final IconData icon;
  final String label;

  const _UtilityButton({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => print('tapped $label'),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(5),
            child: Icon(
              icon,
              size: 26,
              color: Colors.white,
            ),
          ),
          Text(
            label,
            style: const TextStyle(fontSize: 12),
          ),
        ],
      ),
    );
  }
}
