import 'package:flutter/material.dart';

class MovieStreamingInformation extends StatelessWidget {
  final String rating;

  const MovieStreamingInformation({
    Key? key,
    required this.rating,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 80),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _InformationContainer(label: rating),
          const _InformationContainer(label: 'HD'),
          const _InformationContainer(label: 'Dolby Vision'),
          const _InformationContainer(label: '5.1'),
          const _InformationContainer(label: 'CC'),
          const _InformationContainer(label: 'AD'),
        ],
      ),
    );
  }
}

class _InformationContainer extends StatelessWidget {
  final String label;

  const _InformationContainer({required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade700,
        borderRadius: const BorderRadius.all(Radius.circular(3)),
      ),
      padding: const EdgeInsets.all(2.0),
      child: Text(
        label,
        style: TextStyle(
          color: Colors.white,
          fontSize: 12,
          fontWeight: FontWeight.bold,
          backgroundColor: Colors.grey.shade700,
        ),
      ),
    );
  }
}
