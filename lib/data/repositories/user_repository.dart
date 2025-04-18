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

  Future<List<Map<String, dynamic>>> fetchAllRequests(String email) async {
    final data = _firebaseService.fetchAllRequests(email);
    return data;
  }

  Future<void> deleteRequestById(String requestId) async {
    await _firebaseService.deleteRequestById(requestId);
  }

  Future<void> sendRequest(String bloodType, String phoneNumber, String note,
      String hospital, String dEmail) async {
    await _firebaseService.sendRequest(
        bloodType: bloodType,
        phoneNumber: phoneNumber,
        note: note,
        hospital: hospital,
        dEmail: dEmail);
  }

  // Future<void> deleteUnverifiedUser() async {
  //   await _firebaseService.deleteUnverifiedUser();
  // }

  String get userEmail => _firebaseService.userEmail;
}
