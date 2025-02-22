import 'package:blood_bank/data/services/firebase_service.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseRepository {
  final FirebaseService _firebaseService;

  FirebaseRepository(this._firebaseService);

  Future<User?> signUp(String email, String password, String username,
      String bloodType, String location) async {
    try {
      return await _firebaseService.signUpWithEmailPassword(
          email, password, username, bloodType, location);
    } catch (e) {
      throw Exception('فشل في إنشاء الحساب: $e');
    }
  }

  Future<User?> signIn(String email, String password) async {
    try {
      return await _firebaseService.signInWithEmailPassword(email, password);
    } catch (e) {
      throw Exception('فشل في تسجيل الدخول: $e');
    }
  }

  Future<void> signOut() async {
    await _firebaseService.signOut();
  }
}
