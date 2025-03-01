// lib/services/firebase_service.dart
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

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
      await _auth.currentUser!.sendEmailVerification();
    } on FirebaseAuthException {
      rethrow;
    } catch (e) {
      throw Exception("حدث خطأ أثناء تسجيل الخروج.");
    }
  }

  String get userEmail {
    if (_auth.currentUser != null) {
      return _auth.currentUser!.email ?? "لا يوجد بريد إلكتروني";
    }
    return "لا يوجد مستخدم";
  }
}
