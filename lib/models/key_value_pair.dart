class KeyValuePair<TKey, TValue> {
  final TKey key;
  final TValue value;

  KeyValuePair(this.key, this.value);

  const KeyValuePair.constant(this.key, this.value);
}
