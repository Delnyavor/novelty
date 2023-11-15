part of 'registration_bloc.dart';

sealed class RegistrationEvent extends Equatable {
  const RegistrationEvent();

  @override
  List<Object> get props => [];
}

class RegistrationValidationStateChanged extends RegistrationEvent {
  final bool state;

  const RegistrationValidationStateChanged({required this.state});

  @override
  List<Object> get props => [state];
}

class FirstNameChanged extends RegistrationEvent {
  final String firstname;
  const FirstNameChanged({required this.firstname});

  @override
  List<Object> get props => [firstname];
}

class LastNameChanged extends RegistrationEvent {
  final String lastName;
  const LastNameChanged({required this.lastName});

  @override
  List<Object> get props => [lastName];
}

class AgeChanged extends RegistrationEvent {
  final String age;
  const AgeChanged({required this.age});

  @override
  List<Object> get props => [age];
}

class ExperienceChanged extends RegistrationEvent {
  final String experience;
  const ExperienceChanged({required this.experience});

  @override
  List<Object> get props => [experience];
}

class LifestyleChanged extends RegistrationEvent {
  final String lifestyle;
  const LifestyleChanged({required this.lifestyle});

  @override
  List<Object> get props => [lifestyle];
}

class EducationLevelChanged extends RegistrationEvent {
  final String educationLevel;
  const EducationLevelChanged({required this.educationLevel});

  @override
  List<Object> get props => [educationLevel];
}

class JobsChanged extends RegistrationEvent {
  final String jobs;
  const JobsChanged({required this.jobs});

  @override
  List<Object> get props => [jobs];
}

class PageChanged extends RegistrationEvent {
  final int increment;

  const PageChanged({required this.increment});

  @override
  List<Object> get props => [increment];
}
