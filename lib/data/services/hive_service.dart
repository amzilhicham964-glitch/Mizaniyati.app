import 'package:hive_flutter/hive_flutter.dart';
import '../models/transaction_model.dart';
import '../models/wallet_model.dart';
import '../models/category_model.dart';
import '../models/budget_model.dart';
import '../models/saving_goal_model.dart';
import '../models/loan_model.dart';
import '../models/zakat_model.dart';
import '../models/bill_model.dart';
import '../models/user_model.dart';

class HiveService {
  static const String transactionsBox = 'transactions';
  static const String walletsBox = 'wallets';
  static const String categoriesBox = 'categories';
  static const String budgetsBox = 'budgets';
  static const String savingGoalsBox = 'saving_goals';
  static const String loansBox = 'loans';
  static const String zakatsBox = 'zakats';
  static const String billsBox = 'bills';
  static const String usersBox = 'users';

  /// Initialize Hive and register adapters
  static Future<void> init() async {
    await Hive.initFlutter();

    // Register adapters
    if (!Hive.isAdapterRegistered(TransactionModelAdapter().typeId)) {
      Hive.registerAdapter(TransactionModelAdapter());
    }
    if (!Hive.isAdapterRegistered(WalletModelAdapter().typeId)) {
      Hive.registerAdapter(WalletModelAdapter());
    }
    if (!Hive.isAdapterRegistered(CategoryModelAdapter().typeId)) {
      Hive.registerAdapter(CategoryModelAdapter());
    }
    if (!Hive.isAdapterRegistered(BudgetModelAdapter().typeId)) {
      Hive.registerAdapter(BudgetModelAdapter());
    }
    if (!Hive.isAdapterRegistered(SavingGoalModelAdapter().typeId)) {
      Hive.registerAdapter(SavingGoalModelAdapter());
    }
    if (!Hive.isAdapterRegistered(LoanModelAdapter().typeId)) {
      Hive.registerAdapter(LoanModelAdapter());
    }
    if (!Hive.isAdapterRegistered(ZakatModelAdapter().typeId)) {
      Hive.registerAdapter(ZakatModelAdapter());
    }
    if (!Hive.isAdapterRegistered(BillModelAdapter().typeId)) {
      Hive.registerAdapter(BillModelAdapter());
    }
    if (!Hive.isAdapterRegistered(UserModelAdapter().typeId)) {
      Hive.registerAdapter(UserModelAdapter());
    }

    // Open boxes
    await Hive.openBox<TransactionModel>(transactionsBox);
    await Hive.openBox<WalletModel>(walletsBox);
    await Hive.openBox<CategoryModel>(categoriesBox);
    await Hive.openBox<BudgetModel>(budgetsBox);
    await Hive.openBox<SavingGoalModel>(savingGoalsBox);
    await Hive.openBox<LoanModel>(loansBox);
    await Hive.openBox<ZakatModel>(zakatsBox);
    await Hive.openBox<BillModel>(billsBox);
    await Hive.openBox<UserModel>(usersBox);
  }

  /// Get a specific box
  static Box<T> getBox<T>(String boxName) {
    return Hive.box<T>(boxName);
  }

  /// Clear all boxes
  static Future<void> clearAll() async {
    await Hive.deleteBoxFromDisk(transactionsBox);
    await Hive.deleteBoxFromDisk(walletsBox);
    await Hive.deleteBoxFromDisk(categoriesBox);
    await Hive.deleteBoxFromDisk(budgetsBox);
    await Hive.deleteBoxFromDisk(savingGoalsBox);
    await Hive.deleteBoxFromDisk(loansBox);
    await Hive.deleteBoxFromDisk(zakatsBox);
    await Hive.deleteBoxFromDisk(billsBox);
    await Hive.deleteBoxFromDisk(usersBox);
  }
}
