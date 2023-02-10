import 'package:firebase_auth/firebase_auth.dart';

class AuthController {
  final FirebaseAuth _auth;
  AuthController(this._auth);

  Stream<User?> get authStateChanges => _auth.idTokenChanges();
  Future<String> login(
    String email,
    String password,
  ) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      return 'log in';
    } catch (e) {
      return '$e';
    }
  }

   Future<String> siginUp(
    String email,
    String password,
  ) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      return 'Sigin up';
    } catch (e) {
      return '$e';
    }
  }
}
