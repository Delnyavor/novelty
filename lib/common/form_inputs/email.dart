import 'package:formz/formz.dart';

import '../utils/form_validators.dart';

/// Validation errors for the [Email] [FormzInput].
enum EmailValidationError { empty, formatError }

/// {@template }
/// Form input for an email input.
/// {@endtemplate}
class Email extends FormzInput<String, EmailValidationError> {
  const Email.pure() : super.pure('');

  const Email.dirty([super.value = '']) : super.dirty();

  @override
  EmailValidationError? validator(String value) {
    FormValidators v = FormValidators();
    if (value.isEmpty) return EmailValidationError.empty;
    if (!v.validateEmail(value)) return EmailValidationError.formatError;
    return null;
  }

  String? validationToString(EmailValidationError? error) {
    if (error == EmailValidationError.empty) return 'value should not be empty';
    if (error == EmailValidationError.formatError) return 'email is invalid';
    return null;
  }
}
