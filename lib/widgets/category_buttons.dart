import 'package:flutter/material.dart';

class CategoryButtons extends StatelessWidget {
  const CategoryButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: const [
            Expanded(
              child: _CategoryButton(
                imagePath: 'assets/images/category_logos/disney.png',
              ),
            ),
            SizedBox(width: 10),
            Expanded(
              child: _CategoryButton(
                imagePath: 'assets/images/category_logos/pixar.png',
              ),
            ),
            SizedBox(width: 10),
            Expanded(
              child: _CategoryButton(
                imagePath: 'assets/images/category_logos/marvel.png',
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          children: const [
            Expanded(
              child: _CategoryButton(
                imagePath: 'assets/images/category_logos/star_wars.png',
              ),
            ),
            SizedBox(width: 10),
            Expanded(
              child: _CategoryButton(
                imagePath: 'assets/images/category_logos/national_geographic.png',
              ),
            ),
            SizedBox(width: 10),
            Expanded(
              child: _CategoryButton(
                imagePath: 'assets/images/category_logos/star.png',
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _CategoryButton extends StatelessWidget {
  final String imagePath;

  const _CategoryButton({required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 4 / 2,
      child: GestureDetector(
        onTap: () => print('Go to category screen.'),
        child: Container(
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: [Color(0xFF1F202C), Color(0xFF2D2F3B)],
            ),
            border: Border.all(
              width: 2,
              color: const Color(0xFF383943),
            ),
            borderRadius: const BorderRadius.all(
              Radius.circular(8),
            ),
          ),
          child: Image.asset(imagePath),
        ),
      ),
    );
  }
}
