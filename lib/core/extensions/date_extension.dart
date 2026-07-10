import 'package:intl/intl.dart';

extension DateTimeExtension on DateTime {
  /// Format date to string (dd/MM/yyyy)
  String formatDate() {
    return DateFormat('dd/MM/yyyy', 'ar_SA').format(this);
  }

  /// Format date with time (dd/MM/yyyy HH:mm)
  String formatDateTime() {
    return DateFormat('dd/MM/yyyy HH:mm', 'ar_SA').format(this);
  }

  /// Format time only (HH:mm)
  String formatTime() {
    return DateFormat('HH:mm', 'ar_SA').format(this);
  }

  /// Get day name in Arabic
  String getDayName() {
    final days = ['الأحد', 'الاثنين', 'الثلاثاء', 'الأربعاء', 'الخميس', 'الجمعة', 'السبت'];
    return days[weekday % 7];
  }

  /// Get month name in Arabic
  String getMonthName() {
    final months = [
      'يناير', 'فبراير', 'مارس', 'أبريل', 'مايو', 'يونيو',
      'يوليو', 'أغسطس', 'سبتمبر', 'أكتوبر', 'نوفمبر', 'ديسمبر'
    ];
    return months[month - 1];
  }

  /// Check if date is today
  bool get isToday {
    final now = DateTime.now();
    return year == now.year && month == now.month && day == now.day;
  }

  /// Check if date is yesterday
  bool get isYesterday {
    final yesterday = DateTime.now().subtract(const Duration(days: 1));
    return year == yesterday.year &&
        month == yesterday.month &&
        day == yesterday.day;
  }

  /// Get start of day
  DateTime get startOfDay {
    return DateTime(year, month, day);
  }

  /// Get end of day
  DateTime get endOfDay {
    return DateTime(year, month, day, 23, 59, 59);
  }

  /// Get start of month
  DateTime get startOfMonth {
    return DateTime(year, month, 1);
  }

  /// Get end of month
  DateTime get endOfMonth {
    return DateTime(year, month + 1, 0, 23, 59, 59);
  }
}
