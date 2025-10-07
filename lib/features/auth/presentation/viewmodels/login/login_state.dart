part of 'login_cubit.dart';



@immutable
abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object?> get props => [];
}

/// The initial state when the login form is first shown.
class LoginInitial extends LoginState {
  const LoginInitial();
}

/// State emitted while the login request is being processed.
class LoginLoading extends LoginState {
  const LoginLoading();
}

/// State emitted when the login request succeeds.
class LoginSuccess extends LoginState {
  final UserEntity user;

  const LoginSuccess(this.user);

  @override
  List<Object?> get props => [user];
}

/// State emitted when the login request fails.
class LoginFailure extends LoginState {
  final String message;

  const LoginFailure(this.message);

  LoginFailure copyWith({String? message}) {
    return LoginFailure(message ?? this.message);
  }

  @override
  List<Object?> get props => [message];
}
