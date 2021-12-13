enum GenreType {
  ScienceFiction,
  Fantasy,
  SuperHero,
  ActionAdventure,
  Romance,
  Drama,
  Buddy,
  Spy,
}

extension GenreExtensions on GenreType {
  String get name {
    switch (this) {
      case GenreType.ScienceFiction:
        return 'Science Fiction';
      case GenreType.Fantasy:
        return 'Fantasy';
      case GenreType.SuperHero:
        return 'Super Hero';
      case GenreType.ActionAdventure:
        return 'Action-Adventure';
      case GenreType.Romance:
        return 'Romance';
      case GenreType.Drama:
        return 'Drama';
      case GenreType.Buddy:
        return 'Buddy';
      case GenreType.Spy:
        return 'Spy / Espionage';
      default:
        return 'Error: genre type not implemented';
    }
  }
}

extension GenreListExtensions on List<GenreType> {
  String get name {
    String name = '';
    for (int i = 0; i < this.length; i++) {
      if (i == this.length - 1) {
        name = name + '${this[i].name}';
      } else {
        name = name + '${this[i].name}, ';
      }
    }
    return name;
  }
}
