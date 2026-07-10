import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/transaction_model.dart';
import '../models/wallet_model.dart';
import '../models/budget_model.dart';
import '../models/saving_goal_model.dart';
import '../models/loan_model.dart';
import '../models/zakat_model.dart';
import '../models/bill_model.dart';
import '../../core/error/exceptions.dart';

class FirestoreService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Collections
  static const String usersCollection = 'users';
  static const String transactionsCollection = 'transactions';
  static const String walletsCollection = 'wallets';
  static const String budgetsCollection = 'budgets';
  static const String savingGoalsCollection = 'saving_goals';
  static const String loansCollection = 'loans';
  static const String zakatsCollection = 'zakats';
  static const String billsCollection = 'bills';

  /// Create a new document
  Future<void> createDocument({
    required String collection,
    required String docId,
    required Map<String, dynamic> data,
  }) async {
    try {
      await _firestore.collection(collection).doc(docId).set(data);
    } catch (e) {
      throw NetworkException(
        message: 'فشل إنشاء المستند',
        originalException: e,
      );
    }
  }

  /// Update a document
  Future<void> updateDocument({
    required String collection,
    required String docId,
    required Map<String, dynamic> data,
  }) async {
    try {
      await _firestore.collection(collection).doc(docId).update(data);
    } catch (e) {
      throw NetworkException(
        message: 'فشل تحديث المستند',
        originalException: e,
      );
    }
  }

  /// Delete a document
  Future<void> deleteDocument({
    required String collection,
    required String docId,
  }) async {
    try {
      await _firestore.collection(collection).doc(docId).delete();
    } catch (e) {
      throw NetworkException(
        message: 'فشل حذف المستند',
        originalException: e,
      );
    }
  }

  /// Get a document
  Future<DocumentSnapshot> getDocument({
    required String collection,
    required String docId,
  }) async {
    try {
      return await _firestore.collection(collection).doc(docId).get();
    } catch (e) {
      throw NetworkException(
        message: 'فشل جلب المستند',
        originalException: e,
      );
    }
  }

  /// Get documents from collection
  Future<QuerySnapshot> getDocuments({
    required String collection,
    List<QueryConstraint>? constraints,
  }) async {
    try {
      Query query = _firestore.collection(collection);
      if (constraints != null) {
        for (var constraint in constraints) {
          query = constraint.apply(query);
        }
      }
      return await query.get();
    } catch (e) {
      throw NetworkException(
        message: 'فشل جلب المستندات',
        originalException: e,
      );
    }
  }

  /// Listen to collection changes
  Stream<QuerySnapshot> watchCollection({
    required String collection,
    List<QueryConstraint>? constraints,
  }) {
    try {
      Query query = _firestore.collection(collection);
      if (constraints != null) {
        for (var constraint in constraints) {
          query = constraint.apply(query);
        }
      }
      return query.snapshots();
    } catch (e) {
      throw NetworkException(
        message: 'فشل مراقبة المجموعة',
        originalException: e,
      );
    }
  }

  /// Batch write
  Future<void> batchWrite({
    required List<(String, String, Map<String, dynamic>)> creates,
    required List<(String, String, Map<String, dynamic>)> updates,
    required List<(String, String)> deletes,
  }) async {
    try {
      final batch = _firestore.batch();

      for (var (collection, docId, data) in creates) {
        batch.set(_firestore.collection(collection).doc(docId), data);
      }

      for (var (collection, docId, data) in updates) {
        batch.update(_firestore.collection(collection).doc(docId), data);
      }

      for (var (collection, docId) in deletes) {
        batch.delete(_firestore.collection(collection).doc(docId));
      }

      await batch.commit();
    } catch (e) {
      throw NetworkException(
        message: 'فشل العملية الجماعية',
        originalException: e,
      );
    }
  }
}

abstract class QueryConstraint {
  Query apply(Query query);
}

class WhereConstraint extends QueryConstraint {
  final String field;
  final dynamic isEqualTo;

  WhereConstraint({required this.field, required this.isEqualTo});

  @override
  Query apply(Query query) => query.where(field, isEqualTo: isEqualTo);
}

class OrderByConstraint extends QueryConstraint {
  final String field;
  final bool descending;

  OrderByConstraint({required this.field, this.descending = false});

  @override
  Query apply(Query query) => query.orderBy(field, descending: descending);
}

class LimitConstraint extends QueryConstraint {
  final int limit;

  LimitConstraint(this.limit);

  @override
  Query apply(Query query) => query.limit(limit);
}
