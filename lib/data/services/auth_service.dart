import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../core/error/exceptions.dart';
import '../../core/error/failures.dart';

class AuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  /// Check if user is logged in
  bool get isLoggedIn => _firebaseAuth.currentUser != null;

  /// Get current user
  User? get currentUser => _firebaseAuth.currentUser;

  /// Get current user ID
  String? get currentUserId => _firebaseAuth.currentUser?.uid;

  /// Sign up with email and password
  Future<AuthFailureOrSuccess<User>> signUpWithEmail({
    required String email,
    required String password,
    required String name,
  }) async {
    try {
      // Create user account
      final userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Update profile with name
      await userCredential.user?.updateDisplayName(name);
      await userCredential.user?.reload();

      return Right(userCredential.user!);
    } on FirebaseAuthException catch (e) {
      return Left(
        FirebaseAuthFailure(
          _getAuthErrorMessage(e.code),
          code: e.code,
        ),
      );
    } catch (e) {
      return Left(
        FirebaseAuthFailure(
          'حدث خطأ غير متوقع',
          code: 'unexpected_error',
        ),
      );
    }
  }

  /// Sign in with email and password
  Future<AuthFailureOrSuccess<User>> signInWithEmail({
    required String email,
    required String password,
  }) async {
    try {
      final userCredential = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      return Right(userCredential.user!);
    } on FirebaseAuthException catch (e) {
      return Left(
        FirebaseAuthFailure(
          _getAuthErrorMessage(e.code),
          code: e.code,
        ),
      );
    } catch (e) {
      return Left(
        FirebaseAuthFailure(
          'حدث خطأ غير متوقع',
          code: 'unexpected_error',
        ),
      );
    }
  }

  /// Sign in with phone number
  Future<void> signInWithPhone({
    required String phoneNumber,
    required Function(PhoneAuthCredential) verificationCompleted,
    required Function(FirebaseAuthException) verificationFailed,
    required Function(String, int?) codeSent,
    required Function(String) codeAutoRetrievalTimeout,
  }) async {
    try {
      await _firebaseAuth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: verificationCompleted,
        verificationFailed: verificationFailed,
        codeSent: codeSent,
        codeAutoRetrievalTimeout: codeAutoRetrievalTimeout,
      );
    } catch (e) {
      throw AuthException(
        message: 'فشل التحقق من رقم الهاتف',
        code: 'phone_verification_failed',
      );
    }
  }

  /// Sign out
  Future<void> signOut() async {
    try {
      await _firebaseAuth.signOut();
    } catch (e) {
      throw AuthException(
        message: 'فشل تسجيل الخروج',
        code: 'sign_out_failed',
      );
    }
  }

  /// Reset password
  Future<void> resetPassword({required String email}) async {
    try {
      await _firebaseAuth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      throw AuthException(
        message: _getAuthErrorMessage(e.code),
        code: e.code,
      );
    }
  }

  /// Get auth state changes stream
  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();

  /// Get ID token
  Future<String?> getIdToken() async {
    try {
      return await _firebaseAuth.currentUser?.getIdToken();
    } catch (e) {
      return null;
    }
  }

  /// Error message mapping
  String _getAuthErrorMessage(String code) {
    switch (code) {
      case 'weak-password':
        return 'كلمة المرور ضعيفة جداً';
      case 'email-already-in-use':
        return 'البريد الإلكتروني مستخدم بالفعل';
      case 'invalid-email':
        return 'البريد الإلكتروني غير صحيح';
      case 'user-disabled':
        return 'حسابك معطل';
      case 'user-not-found':
        return 'المستخدم غير موجود';
      case 'wrong-password':
        return 'كلمة المرور غير صحيحة';
      case 'operation-not-allowed':
        return 'العملية غير مسموحة';
      case 'too-many-requests':
        return 'عدد محاولات كثير جداً. حاول لاحقاً';
      default:
        return 'حدث خطأ في المصادقة';
    }
  }
}

typedef AuthFailureOrSuccess<T> = Future<Either<Failure, T>>;

import 'package:dartz/dartz.dart';
import '../../core/error/failures.dart';
