import 'package:flutter/material.dart';

class CustomGridView extends StatelessWidget {
  final int crossAxisCount;
  List<Widget>? children;

  CustomGridView({
    Key? key,
    required this.crossAxisCount,
    this.children,
  }) : super(key: key);

  bool _hasChildren() {
    return children == null || children!.isEmpty ? false : true;
  }

  bool _validCrossAxisCount() {
    return crossAxisCount != 0 ? true : false;
  }

  int _numberOfRows() {
    var rows = children!.length / crossAxisCount;
    return rows.isNegative ? rows.floor() : rows.ceil();
  }

  void _fillWidgetList(int rows) {
    final remainder = (rows * crossAxisCount) - children!.length;
    if (remainder == 0) return;
    for (int i = 0; i < remainder; i++) {
      children!.add(Container());
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_hasChildren() == false || _validCrossAxisCount() == false) return Container();

    var _rows = _numberOfRows();
    _fillWidgetList(_rows);

    return Column(
      children: [
        for (int i = 0; i < _rows; i++) ...[
          Row(
            children: [
              for (int j = i * crossAxisCount; j < (i + 1) * crossAxisCount; j++) ...[
                Expanded(child: children![j]),
              ],
            ],
          ),
        ],
      ],
    );
  }
}
