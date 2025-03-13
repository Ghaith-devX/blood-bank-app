// lib/services/firebase_service.dart
import 'package:blood_bank/model/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

class FirebaseService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  User? get currentUser => _auth.currentUser;

  Future<User?> signUpWithEmailPassword(
    String email,
    String password,
    String username,
    String bloodType,
    String location,
  ) async {
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
          'emailVerified': false,
        });
      }

      return userCredential.user;
    } on FirebaseAuthException {
      rethrow;
    } catch (e) {
      throw Exception("حدث خطأ أثناء إنشاء الحساب: ${e.toString()}");
    }
  }

  Future<void> updateEmailVerificationStatus() async {
    try {
      User? user = FirebaseAuth.instance.currentUser;

      if (user != null) {
        await user.reload();
        if (user.emailVerified) {
          await FirebaseFirestore.instance
              .collection("users")
              .doc(user.uid)
              .update({"emailVerified": true});
        }
      }
    } on FirebaseException {
      rethrow;
    } catch (e) {
      rethrow;
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
      final user = await FirebaseFirestore.instance
          .collection("users")
          .where("emailVerified", isEqualTo: true)
          .get();

      user.docs.forEach((element) {
        return userList.add(UserModel.fromMap(element.data()));
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

  Future<UserModel> getUserData() async {
    User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      try {
        DocumentSnapshot userDoc = await FirebaseFirestore.instance
            .collection("users")
            .doc(user.uid)
            .get();

        if (userDoc.exists) {
          return UserModel.fromMap(userDoc.data() as Map<String, dynamic>);
        } else {
          throw Exception("المستخدم غير موجود");
        }
      } on FirebaseAuthException {
        rethrow;
      } catch (e) {
        throw Exception('ظهر خطأ غير معروف');
      }
    } else {
      throw Exception("المستخدم لم يسجل الدخول");
    }
  }
}
