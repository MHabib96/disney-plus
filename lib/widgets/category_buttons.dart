import 'package:disney_plus/constants/asset_constants.dart';
import 'package:flutter/material.dart';

class CategoryButtons extends StatelessWidget {
  const CategoryButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: const [
            Expanded(child: _CategoryButton(imagePath: kDisneyCategoryLogo)),
            SizedBox(width: 10),
            Expanded(child: _CategoryButton(imagePath: kPixarCategoryLogo)),
            SizedBox(width: 10),
            Expanded(child: _CategoryButton(imagePath: kMarvelCategoryLogo)),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          children: const [
            Expanded(child: _CategoryButton(imagePath: kStarWarsCategoryLogo)),
            SizedBox(width: 10),
            Expanded(child: _CategoryButton(imagePath: kNationalGeographicCategoryLogo)),
            SizedBox(width: 10),
            Expanded(child: _CategoryButton(imagePath: kStarCategoryLogo)),
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
