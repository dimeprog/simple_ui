import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AuthRepository {
  FirebaseAuth auth;
  AuthRepository(this.auth);
// login method
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

  // register method
  Future<User?> signUpWithEmailAndPassword(
      String email, String password) async {
    try {
      final result = await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      return result.user;
    } on FirebaseAuthException catch (err) {
      if (err.code == 'invalid-email') {
        throw AuthException('Invalid Email inputed');
      }
      if (err.code == "weak-password") {
        throw AuthException('Weak Password, re-enter your password');
      }

      if (err.code == "operation-not-allowed") {
        throw AuthException('You dont have access');
      }

      if (err.code == "email-already-in-use") {
        throw AuthException('Email already in use');
      }
    } on SocketException catch (e) {
      throw AuthException('No internet connection');
    } catch (e) {
      throw AuthException(e.toString());
    }
  }

  // authchanges method
  Stream<User?> authChanges() => auth.idTokenChanges();

  // signout
  Future signOut() async {
    try {
      await auth.signOut();
    } on FirebaseAuthException catch (err) {
      throw AuthException(err.toString());
    } on SocketException catch (e) {
      throw AuthException('No internet connection');
    } catch (e) {
      throw AuthException(e.toString());
    }
  }

  // change password
  Future changePassword() async {
    User user = auth.currentUser!;
    if (user != null) {
      try {
        String email = user.email!;
        auth.sendPasswordResetEmail(email: email);

        // await user.updatePassword(newPassword);
      } on FirebaseAuthException catch (err) {
        if (err.code == 'invalid-email') {
          throw AuthException('Invalid Email inputed');
        }

        if (err.code == "auth/unauthorized-continue-uri") {
          throw AuthException('You dont have access');
        }

        if (err.code == "auth/user-not-found") {
          throw AuthException('Email already in use');
        } else {
          throw AuthException('Error occurred, try again later');
        }
      } on SocketException catch (e) {
        throw AuthException('No internet connection');
      } catch (e) {
        throw AuthException(e.toString());
      }
    } else {
      throw AuthException('User not Autheniticated');
    }
  }
}

class AuthException implements Exception {
  final String message;
  AuthException(this.message);

  @override
  String toString() {
    return message;
  }
}
