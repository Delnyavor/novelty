part of 'registration_bloc.dart';

final class RegistrationState extends Equatable {
  const RegistrationState({
    this.firstName = const TextInput.pure(),
    this.lastName = const TextInput.pure(),
    this.age = const TextInput.pure(),
    this.experience = const TextInput.pure(),
    this.lifestyle = const TextInput.pure(),
    this.educationLevel = const TextInput.pure(),
    this.jobs = const TextInput.pure(),
    this.status = FormzSubmissionStatus.initial,
    this.isValid = false,
    this.shouldValidate = false,
    this.errorMessage,
    this.page = 0,
  });

  final TextInput firstName;
  final TextInput lastName;
  final TextInput age;
  final TextInput experience;
  final TextInput lifestyle;
  final TextInput educationLevel;
  final TextInput jobs;
  final FormzSubmissionStatus status;
  final bool shouldValidate;
  final bool isValid;
  final String? errorMessage;
  final int page;

  @override
  List<Object?> get props => [
        status,
        isValid,
        errorMessage,
        shouldValidate,
        page,
        firstName,
        lastName,
        age,
        experience,
        lifestyle,
        educationLevel,
        jobs,
      ];

  RegistrationState copyWith({
    TextInput? firstName,
    TextInput? lastName,
    TextInput? age,
    TextInput? experience,
    TextInput? lifestyle,
    TextInput? educationLevel,
    TextInput? jobs,
    FormzSubmissionStatus? status,
    bool? isValid,
    bool? shouldValidate,
    String? errorMessage,
    int? page,
  }) {
    return RegistrationState(
      status: status ?? this.status,
      isValid: isValid ?? this.isValid,
      shouldValidate: shouldValidate ?? this.shouldValidate,
      errorMessage: errorMessage ?? this.errorMessage,
      page: page ?? this.page,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      age: age ?? this.age,
      experience: experience ?? this.experience,
      lifestyle: lifestyle ?? this.lifestyle,
      educationLevel: educationLevel ?? this.educationLevel,
      jobs: jobs ?? this.jobs,
    );
  }
}
