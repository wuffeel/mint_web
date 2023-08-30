class LayoutUtils {
  /// Calculates the optimal spacing between items dynamically, based on the
  /// available [maxWidth] and the desired number of [itemsPerRow].
  ///
  /// The [mainSpacing] parameter defines the minimum spacing between items,
  /// ensuring that the result spacing is not greater than this value.
  ///
  /// Returns the calculated spacing between items.
  static double calculateSpacing(
      double maxWidth,
      int itemsPerRow, {
        double? mainSpacing,
      }) {
    final desired = mainSpacing ?? 0;
    final itemWidth = (maxWidth - desired * (itemsPerRow - 1)) / itemsPerRow;

    final spacing = (maxWidth - itemWidth * itemsPerRow) / (itemsPerRow - 1);
    return spacing.clamp(0, desired);
  }

  /// Calculates the optimal width for each item based on the available
  /// [maxWidth] and the desired spacing between items.
  ///
  /// The [mainSpacing] parameter defines the minimum spacing between items.
  ///
  /// Returns the calculated width for each item.
  static double getItemWidth(
      double maxWidth,
      int itemsPerRow, {
        double? mainSpacing,
      }) {
    final spacing = calculateSpacing(
      maxWidth,
      itemsPerRow,
      mainSpacing: mainSpacing,
    );
    return (maxWidth - spacing * (itemsPerRow - 1)) / itemsPerRow;
  }
}
