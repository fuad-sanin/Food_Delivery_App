import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class AuthProvider extends ChangeNotifier {
  final FirebaseAuth _firebaseAuth;
  AuthProvider(this._firebaseAuth);

  bool _isLoading = false;
  Stream<User?> stream() => _firebaseAuth.authStateChanges();
  bool get loading => _isLoading;

  //SignOut
  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }

  //SignIn
  Future<String> signIn(String email, String password) async {
    try {
      _isLoading = true;
      notifyListeners();
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email.trim(), password: password.trim());
      return Future.value('');
    } on FirebaseAuthException catch (ex) {
      _isLoading = false;
      notifyListeners();
      return Future.value(ex.message);
    }
  }

  Future<String> signUp(String email, String password) async {
    try {
      _isLoading = true;
      notifyListeners();
      await _firebaseAuth.createUserWithEmailAndPassword(
          email: email.trim(), password: password.trim());
      return Future.value('');
    } on FirebaseAuthException catch (ex) {
      _isLoading = false;
      notifyListeners();
      return Future.value(ex.message);
    }
  }
}
