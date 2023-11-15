import 'package:formz/formz.dart';

enum TextInputValidationError { empty }

class TextInput extends FormzInput<String, TextInputValidationError> {
  const TextInput.dirty(super.value) : super.dirty();
  const TextInput.pure() : super.pure('');

  @override
  TextInputValidationError? validator(String? value) {
    if (value!.isEmpty) return TextInputValidationError.empty;
    return null;
  }

  String? validationToString(TextInputValidationError? error) {
    if (error == TextInputValidationError.empty) {
      return 'Field is required';
    }

    return null;
  }
}
