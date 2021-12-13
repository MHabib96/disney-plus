enum RatingType {
  Zero,
  Six,
  Twelve,
  Sixteen,
}

extension RatingExtensions on RatingType {
  String get name {
    switch (this) {
      case RatingType.Zero:
        return '0+';
      case RatingType.Six:
        return '6+';
      case RatingType.Twelve:
        return '12+';
      case RatingType.Sixteen:
        return '16+';
      default:
        return 'Error: rating type not implemented';
    }
  }
}
