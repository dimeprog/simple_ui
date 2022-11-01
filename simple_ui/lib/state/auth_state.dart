import 'package:equatable/equatable.dart';

class AuthState extends Equatable {
  const AuthState();
  @override
  List<Object?> get props => [];
}

class AuthStateSuccess extends AuthState {
  const AuthStateSuccess();
  @override
  List<Object?> get props => [];
}

class AuthStateInital extends AuthState {
  const AuthStateInital();
  @override
  List<Object?> get props => [];
}

class AuthStateLoading extends AuthState {
  const AuthStateLoading();
  @override
  List<Object?> get props => [];
}

class AuthStateError extends AuthState {
  final String errorMessage;
  const AuthStateError(this.errorMessage);
  @override
  List<Object?> get props => [];
}
