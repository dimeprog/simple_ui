import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:simple_ui/Repository/auth_repository.dart';

// to make an instance for auth repo
final authRepositoryProvider =
    Provider<AuthRepository>((ref) => AuthRepository(FirebaseAuth.instance));
//  to check user login state weather it to send you home or in login page
final authStateProvider = StreamProvider<User?>(
    ((ref) => ref.read(authRepositoryProvider).authChanges()));
