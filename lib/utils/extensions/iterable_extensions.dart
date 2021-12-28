extension IterableExtensions<T> on Iterable<T> {
  Iterable<T> takeUpTo(int count) {
    if (length < count) count = length;
    return take(count);
  }
}
