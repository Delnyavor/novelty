part of 'login_bloc.dart';

sealed class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class EmailChanged extends LoginEvent {
  final String email;

  const EmailChanged(this.email);

  @override
  List<Object> get props => [email];
}

class PasswordChanged extends LoginEvent {
  final String password;

  const PasswordChanged(this.password);

  @override
  List<Object> get props => [password];
}

class ValidationStateChanged extends LoginEvent {
  const ValidationStateChanged(this.shouldValidate);

  final bool shouldValidate;

  @override
  List<Object> get props => [shouldValidate];
}

class ValidateFields extends LoginEvent {}

class LoginWithCredentials extends LoginEvent {}
