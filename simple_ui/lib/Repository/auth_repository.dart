import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AuthRepository {
  FirebaseAuth auth;
  AuthRepository(this.auth);

  Future<User?> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      final result = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      return result.user;
    } on FirebaseAuthException catch (err) {
      if (err.code == 'invalid-email') {
        throw AuthException('Invalid Email inputed');
      }
      if (err.code == "wrong-password") {
        throw AuthException('Wrong Password, try again');
      }

      if (err.code == "user-not-found") {
        throw AuthException('User not found');
      }

      if (err.code == "user-disabled") {
        throw AuthException('User is Disabled');
      }
    } on SocketException catch (e) {
      throw AuthException('No internet connection');
    } catch (e) {
      throw AuthException(e.toString());
    }
  }

  // authchanges functions
  Stream<User?> authChanges() => auth.idTokenChanges();
}

class AuthException implements Exception {
  final String message;
  AuthException(this.message);

  @override
  String toString() {
    return message;
  }
}
