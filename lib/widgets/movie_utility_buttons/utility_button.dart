part of 'movie_utility_buttons.dart';

class _UtilityButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final EdgeInsets padding;

  const _UtilityButton({
    required this.icon,
    required this.label,
    this.padding = EdgeInsets.zero,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => print('tapped $label'),
      child: Column(
        children: [
          Padding(
            padding: padding,
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
