import 'package:flutter/material.dart';

class MultipleFloatingActionButtons extends StatelessWidget {
  final List<FloatingActionButton> floatingActionButtons;
  final EdgeInsets padding;
  final double spacing;

  const MultipleFloatingActionButtons({
    Key? key,
    required this.floatingActionButtons,
    this.padding = EdgeInsets.zero,
    this.spacing = 0.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Wrap(
        spacing: spacing,
        children: floatingActionButtons,
      ),
    );
  }
}
