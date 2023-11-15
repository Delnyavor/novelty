import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

import '../../../../common/theming/app_colors.dart';
import '../bloc/registration_bloc/bloc/registration_bloc.dart';
import 'auth_input.dart';

class RegistrationPersonalInfoPage extends StatefulWidget {
  const RegistrationPersonalInfoPage({super.key});

  @override
  State<RegistrationPersonalInfoPage> createState() =>
      _RegistrationPersonalInfoPageState();
}

class _RegistrationPersonalInfoPageState
    extends State<RegistrationPersonalInfoPage> {
  late RegistrationBloc bloc;
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    bloc = BlocProvider.of<RegistrationBloc>(context);
    bloc.add(RegistrationValidationStateChanged(state: mounted));
  }

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    ageController.dispose();
    bloc.add(const RegistrationValidationStateChanged(state: false));
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<RegistrationBloc, RegistrationState>(
      listener: (context, state) {
        if (state.status.isFailure) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(
                content: Text(state.errorMessage ?? 'Authentication Failure'),
              ),
            );
        }
      },
      child: form(),
    );
  }

  Widget form() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Align(
          alignment: Alignment.bottomLeft,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 150),
              title(),
            ],
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            subTitle(),
            const SizedBox(height: 12),
            const Divider(
              color: AppColors.s2,
              thickness: 0.1,
              height: 1,
            ),
            const SizedBox(height: 20),
            firstNameInput(),
            const SizedBox(height: 16),
            lastNameInput(),
            const SizedBox(height: 16),
            ageInput(),
          ],
        ),
        // const SizedBox(height: 28),
        Column(
          children: [
            registrationButton(),
            const SizedBox(height: 12),
          ],
        )
      ],
    );
  }

  Widget title() {
    return const Text(
      "Let's begin.",
      style: TextStyle(
        fontSize: 28,
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget subTitle() {
    return const Text(
      "Enter your details",
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 14,
        color: Colors.white60,
      ),
    );
  }

  Widget firstNameInput() {
    return BlocBuilder<RegistrationBloc, RegistrationState>(
      buildWhen: (previous, current) => previous.firstName != current.firstName,
      builder: (context, state) {
        return AuthInput(
          key: const Key('RegistrationForm_nameInput_textField'),
          controller: firstNameController,
          onChanged: (firstname) =>
              bloc.add(FirstNameChanged(firstname: firstname)),
          // keyBoardType: TextInputType.,
          hint: 'First Name',
          errorText: state.shouldValidate
              ? state.firstName.validationToString(state.firstName.displayError)
              : null,
        );
      },
    );
  }

  Widget lastNameInput() {
    return BlocBuilder<RegistrationBloc, RegistrationState>(
      buildWhen: (previous, current) => previous.lastName != current.lastName,
      builder: (context, state) {
        return AuthInput(
          key: const Key('RegistrationForm_nameInput_textField'),
          controller: lastNameController,
          onChanged: (lastName) =>
              bloc.add(LastNameChanged(lastName: lastName)),
          // keyBoardType: TextInputType.,
          hint: 'Last Name',
          errorText: state.shouldValidate
              ? state.lastName.validationToString(state.lastName.displayError)
              : null,
        );
      },
    );
  }

  Widget ageInput() {
    return BlocBuilder<RegistrationBloc, RegistrationState>(
      buildWhen: (previous, current) => previous.age != current.age,
      builder: (context, state) {
        return AuthInput(
          key: const Key('RegistrationForm_nameInput_textField'),
          controller: ageController,
          onChanged: (age) => bloc.add(AgeChanged(age: age)),
          keyBoardType: TextInputType.number,
          hint: 'Age',
          errorText: state.shouldValidate
              ? state.age.validationToString(state.age.displayError)
              : null,
        );
      },
    );
  }

  Widget registrationButton() {
    return BlocBuilder<RegistrationBloc, RegistrationState>(
      builder: (context, state) {
        return state.status.isInProgress
            ? const CircularProgressIndicator()
            : ElevatedButton(
                key: const Key('RegistrationForm_continue_raisedButton'),
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    elevation: 0,
                    backgroundColor: AppColors.gold,
                    foregroundColor: AppColors.primary,
                    minimumSize: const Size(double.infinity, 50)),
                onPressed: () {
                  if (state.age.isValid &&
                      state.firstName.isValid &&
                      state.lastName.isValid) {
                    bloc.add(const PageChanged(increment: 1));
                  } else {
                    //  TODO error snackbar
                  }
                },
                child: const Text(
                  'Continue',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                ),
              );
      },
    );
  }
}
