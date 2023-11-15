import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:novelty/common/form_inputs/text.dart';

import '../../../../data/repositories/authentication_repository.dart';

part 'registration_event.dart';
part 'registration_state.dart';

class RegistrationBloc extends Bloc<RegistrationEvent, RegistrationState> {
  final AuthenticationRepository authenticationRepository;

  RegistrationBloc({required this.authenticationRepository})
      : super(const RegistrationState()) {
    on<FirstNameChanged>(_onFirstNameChanged);
    on<LastNameChanged>(_onLastNameChanged);
    on<AgeChanged>(_onAgeChanged);
    on<RegistrationValidationStateChanged>(_onRegistrationValidationChanged);
    on<PageChanged>(_onPageChanged);
  }
  void _onRegistrationValidationChanged(
      RegistrationValidationStateChanged event,
      Emitter<RegistrationState> emit) {
    emit(state.copyWith(shouldValidate: event.state));
  }

  void _onPageChanged(PageChanged event, Emitter<RegistrationState> emit) {
    emit(state.copyWith(page: event.increment));
  }

  void _onFirstNameChanged(
      FirstNameChanged event, Emitter<RegistrationState> emit) {
    final firstName = TextInput.dirty(event.firstname);
    emit(
      state.copyWith(
        firstName: firstName,
      ),
    );
  }

  void _onLastNameChanged(
      LastNameChanged event, Emitter<RegistrationState> emit) {
    final lastName = TextInput.dirty(event.lastName);
    emit(
      state.copyWith(
        lastName: lastName,
      ),
    );
  }

  void _onAgeChanged(AgeChanged event, Emitter<RegistrationState> emit) {
    final age = TextInput.dirty(event.age);
    emit(
      state.copyWith(
        age: age,
      ),
    );
  }
}
