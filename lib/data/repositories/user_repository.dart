import 'package:blood_bank/data/services/firebase_service.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseRepository {
  final FirebaseService _firebaseService;

  FirebaseRepository(this._firebaseService);

  Future<User?> signUp(String email, String password, String username,
      String bloodType, String location) async {
    return await _firebaseService.signUpWithEmailPassword(
        email, password, username, bloodType, location);
  }

  Future<void> updateEmailVerificationStatus() async {
    await _firebaseService.updateEmailVerificationStatus();
  }

  Future<User?> signIn(String email, String password) async {
    return await _firebaseService.signInWithEmailPassword(email, password);
  }

  Future<void> signOut() async {
    await _firebaseService.signOut();
  }

  Future<void> verifyEmail() async {
    await _firebaseService.verifyEmail();
  }

  Future<void> resetPassword(String email) async {
    await _firebaseService.resetPassword(email);
  }

  String get userEmail => _firebaseService.userEmail;
}
