extension ListExtensions on List {
  /// (Untested) Moves an [Item] from [currentIndex] to [newIndex].
  Future<void> move(int currentIndex, int newIndex) async {
    this.insert(newIndex, this.removeAt(currentIndex));
  }
}
