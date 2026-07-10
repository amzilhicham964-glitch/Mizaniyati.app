extension NumExtension on num {
  /// Format number as currency
  String toCurrency({String symbol = 'ر.س', int decimals = 2}) {
    return '$symbol ${toStringAsFixed(decimals)}';
  }

  /// Format number with thousands separator
  String toFormattedString({int decimals = 2}) {
    return toStringAsFixed(decimals).replaceAllMapped(
      RegExp(r'(\d)(?=(\d{3})+(?!\d))'),
      (Match m) => '${m[1]},';
    );
  }

  /// Convert bytes to MB
  double toMB() {
    return this / (1024 * 1024);
  }

  /// Convert bytes to GB
  double toGB() {
    return this / (1024 * 1024 * 1024);
  }

  /// Check if number is positive
  bool get isPositive => this > 0;

  /// Check if number is negative
  bool get isNegative => this < 0;

  /// Check if number is zero
  bool get isZero => this == 0;

  /// Get absolute value
  num getAbsolute() => abs();
}
