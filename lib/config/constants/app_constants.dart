class AppStrings {
  // App Titles
  static const String appName = 'ميزانيتي';
  static const String appDescription = 'تطبيق تتبع المصاريف الشخصية';

  // Navigation
  static const String home = 'الرئيسية';
  static const String transactions = 'العمليات';
  static const String savings = 'الادخار';
  static const String reports = 'التقارير';
  static const String settings = 'الإعدادات';

  // Home Screen
  static const String welcomeBack = 'أهلا بعودتك';
  static const String currentBalance = 'الرصيد الحالي';
  static const String income = 'الدخل';
  static const String expenses = 'المصروفات';
  static const String savings_label = 'الادخار';
  static const String recentTransactions = 'آخر العمليات';
  static const String viewAll = 'عرض الكل';
  static const String addTransaction = 'إضافة عملية';

  // Buttons
  static const String add = 'إضافة';
  static const String edit = 'تعديل';
  static const String delete = 'حذف';
  static const String save = 'حفظ';
  static const String cancel = 'إلغاء';
  static const String confirm = 'تأكيد';
  static const String continue_text = 'متابعة';
  static const String next = 'التالي';
  static const String back = 'رجوع';
  static const String done = 'تم';

  // Categories
  static const String food = 'غذاء';
  static const String transport = 'مواصلات';
  static const String utilities = 'المرافق';
  static const String entertainment = 'ترفيه';
  static const String health = 'صحة';
  static const String shopping = 'تسوق';
  static const String other = 'أخرى';
  static const String category = 'فئة';

  // Messages
  static const String noTransactions = 'لا توجد عمليات حالياً';
  static const String emptyState = 'لا توجد بيانات';
  static const String deleteConfirm = 'هل أنت متأكد من الحذف؟';
  static const String operationSuccess = 'تمت العملية بنجاح';
  static const String operationFailed = 'فشلت العملية';
  static const String tryAgain = 'حاول مرة أخرى';

  // Dialogs
  static const String warning = 'تحذير';
  static const String error = 'خطأ';
  static const String success = 'نجح';
  static const String info = 'معلومة';
}

class AppConstants {
  // Durations
  static const Duration animationDuration = Duration(milliseconds: 300);
  static const Duration shortDuration = Duration(milliseconds: 200);
  static const Duration longDuration = Duration(milliseconds: 500);

  // Padding and Margin
  static const double defaultPadding = 16.0;
  static const double smallPadding = 8.0;
  static const double largePadding = 24.0;

  // Border Radius
  static const double defaultBorderRadius = 8.0;
  static const double smallBorderRadius = 4.0;
  static const double largeBorderRadius = 16.0;

  // Icon Sizes
  static const double smallIconSize = 16.0;
  static const double defaultIconSize = 24.0;
  static const double largeIconSize = 32.0;

  // Hive Box Names
  static const String transactionsBox = 'transactions';
  static const String settingsBox = 'settings';
  static const String categoriesBox = 'categories';
}
