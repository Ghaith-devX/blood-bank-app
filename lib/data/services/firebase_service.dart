// lib/services/firebase_service.dart
import 'package:blood_bank/model/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

class FirebaseService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  User? get currentUser => _auth.currentUser;

  Future<User?> signUpWithEmailPassword(String email, String password,
      String username, String bloodType, String location) async {
    try {
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (userCredential.user != null) {
        await _firestore.collection('users').doc(userCredential.user?.uid).set({
          'email': email,
          'username': username,
          'bloodType': bloodType,
          'location': location,
        });
      }

      return userCredential.user;
    } on FirebaseAuthException {
      rethrow;
    } catch (e) {
      throw Exception("حدث خطأ أثناء إنشاء الحساب: ${e.toString()}");
    }
  }

  Future<User?> signInWithEmailPassword(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential.user;
    } on FirebaseAuthException {
      rethrow;
    } catch (e) {
      throw Exception("حدث خطأ أثناء تسجيل الدخول: ${e.toString()}");
    }
  }

  Future<void> signOut() async {
    try {
      await _auth.signOut();
    } on FirebaseAuthException {
      rethrow;
    } catch (e) {
      throw Exception("حدث خطأ أثناء تسجيل الخروج. $e");
    }
  }

  Future<void> verifyEmail() async {
    try {
      User? user = FirebaseAuth.instance.currentUser;

      if (user != null && user.emailVerified == false) {
        await user.reload();
        await user.sendEmailVerification();
      } else {
        throw FirebaseAuthException(
            code: "user-not-found", message: "المستخدم غير موجود");
      }
    } on FirebaseAuthException {
      rethrow;
    } catch (e) {
      throw Exception("حدث خطأ أثناء إرسال البريد الإلكتروني.");
    }
  }

  Future<void> resetPassword(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException {
      rethrow;
    } catch (e) {
      throw Exception('الرجاء إدخال بريد إلكتروني');
    }
  }

  String get userEmail {
    if (_auth.currentUser != null) {
      return _auth.currentUser!.email ?? "لا يوجد بريد إلكتروني";
    }
    return "لا يوجد مستخدم";
  }

  Future<List<UserModel>> get() async {
    List<UserModel> userList = [];

    try {
      final user = await FirebaseFirestore.instance.collection("users").get();

      user.docs.forEach((element) {
        return userList.add(UserModel.fromJson(element.data()));
      });
      return userList;
    } on FirebaseException catch (e) {
      if (kDebugMode) {
        print("خطأ ${e.code} : ${e.message}");
      }
      return userList;
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
