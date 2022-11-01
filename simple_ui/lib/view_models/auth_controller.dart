import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:simple_ui/providers/auth_provider.dart';
import 'package:simple_ui/screens/home_page.dart';
import 'package:simple_ui/screens/login_screen.dart';
import 'package:simple_ui/state/auth_state.dart';

class AuthController extends StateNotifier<AuthState> {
  final Ref ref;
  AuthController(this.ref) : super(const AuthStateInital());

  // methods
  // login
  void loginWithEmailAndPassword(
      String email, String password, BuildContext context) {
    state = const AuthStateLoading();
    try {
      ref
          .read(authRepositoryProvider)
          .signInWithEmailAndPassword(email, password)
          .then(
        (_) {
          state = const AuthStateSuccess();
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => HomePage()));
        },
      ).catchError((e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              e.toString(),
            ),
          ),
        );
      });
    } catch (e) {
      state = AuthStateError(e.toString());
    }
  }

  //sign up
  void signUpWithEmailAndPassword(
      String email, String password, BuildContext context) {
    state = const AuthStateLoading();
    try {
      ref
          .read(authRepositoryProvider)
          .signUpWithEmailAndPassword(email, password)
          .then(
        (_) {
          state = const AuthStateSuccess();
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => HomePage()));
        },
      );
    } catch (e) {
      state = AuthStateError(e.toString());
    }
  }

  // signout
  void signOut(BuildContext context) async {
    state = const AuthStateLoading();
    try {
      await ref.read(authRepositoryProvider).signOut().then(
        (_) {
          state = const AuthStateSuccess();
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => const LoginScreen()));
        },
      );
    } catch (e) {
      state = AuthStateError(e.toString());
    }
  }
}

// create controller stateProvider here
final authControllerProvider = StateNotifierProvider<AuthController, AuthState>(
    (ref) => AuthController(ref));
