import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:simple_ui/providers/auth_provider.dart';
import 'package:simple_ui/screens/login_screen.dart';
import 'package:simple_ui/screens/register_screen.dart';
import 'package:simple_ui/widgets/loading__page.dart';

class AuthChecker extends ConsumerWidget {
  const AuthChecker({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authStateProvider);
    return Scaffold(
      body: authState.when(
        data: (user) {
          if (user != null) {
            return const LoginScreen();
          } else {
            return const RegisterScreen();
          }
        },
        error: (err, _) {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text('Error loading Screen'),
          ));
        },
        loading: () => const LoadingScreen(),
      ),
    );
  }
}
