part of 'movie_utility_buttons.dart';

class _UtilityButton extends StatelessWidget {
  final IconData icon;
  final String label;

  const _UtilityButton({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
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
