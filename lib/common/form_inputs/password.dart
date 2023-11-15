import 'package:formz/formz.dart';

import '../utils/form_validators.dart';

/// Validation errors for the [Password] [FormzInput].
enum PasswordValidationError { empty, tooShort, mismatch }

/// {@template password}
/// Form input for an password input.
/// {@endtemplate}

class Password extends FormzInput<String, PasswordValidationError> {
  const Password.dirty(super.value) : super.dirty();
  const Password.pure() : super.pure('');

  @override
  PasswordValidationError? validator(String value) {
    FormValidators v = FormValidators();
    if (value.isEmpty) return PasswordValidationError.empty;
    if (!v.validateMinLength(value, 7)) return PasswordValidationError.tooShort;
    return null;
  }

  String? validationToString(PasswordValidationError? error) {
    if (error == PasswordValidationError.empty) {
      return 'password should not be empty';
    }
    if (error == PasswordValidationError.tooShort) {
      return 'minimum length: 8 characters';
    }
    if (error == PasswordValidationError.mismatch) {
      return 'passwords do not match';
    }
    return null;
  }
}
