extension StringExtension on String {
  /// Check if string is email
  bool get isEmail {
    final emailRegex = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    );
    return emailRegex.hasMatch(this);
  }

  /// Check if string is phone number
  bool get isPhoneNumber {
    final phoneRegex = RegExp(r'^[0-9]{10,15}$');
    return phoneRegex.hasMatch(replaceAll(RegExp(r'[^0-9]'), ''));
  }

  /// Check if string is valid password (min 8 chars, 1 uppercase, 1 number)
  bool get isValidPassword {
    final passwordRegex = RegExp(
      r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d@\$!%*?&]{8,}$',
    );
    return passwordRegex.hasMatch(this);
  }

  /// Capitalize first letter
  String get capitalize {
    if (isEmpty) return '';
    return '${this[0].toUpperCase()}${substring(1)}';
  }

  /// Remove all spaces
  String get removeSpaces => replaceAll(' ', '');

  /// Format currency (add thousands separator)
  String formatCurrency() {
    try {
      final number = double.parse(replaceAll(',', ''));
      return number.toStringAsFixed(2).replaceAllMapped(
        RegExp(r'(\d)(?=(\d{3})+(?!\d))'),
        (Match m) => '${m[1]},',
      );
    } catch (e) {
      return this;
    }
  }
}
