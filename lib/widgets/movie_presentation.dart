import 'package:flutter/material.dart';

class MoviePresentaion extends StatelessWidget {
  final String logoImagePath;
  final String backgroundImagePath;

  const MoviePresentaion({
    Key? key,
    required this.logoImagePath,
    required this.backgroundImagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: AlignmentDirectional.bottomCenter,
      children: [
        _Background(imagePath: backgroundImagePath),
        _Logo(imagePath: logoImagePath),
      ],
    );
  }
}

class _Background extends StatelessWidget {
  final String imagePath;

  const _Background({required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (rect) {
        return const LinearGradient(
          begin: Alignment.center,
          end: Alignment.bottomCenter,
          colors: [Colors.black, Colors.transparent],
        ).createShader(Rect.fromLTRB(0, 0, rect.width, rect.height));
      },
      blendMode: BlendMode.dstIn,
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(12),
          topRight: Radius.circular(12),
        ),
        child: Image.asset(
          imagePath,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class _Logo extends StatelessWidget {
  final String imagePath;

  const _Logo({required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: -80,
      child: Image.asset(imagePath, height: 120),
    );
  }
}
