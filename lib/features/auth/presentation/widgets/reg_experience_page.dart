import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

import '../../../../common/theming/app_colors.dart';
import '../bloc/registration_bloc/bloc/registration_bloc.dart';
import 'auth_input.dart';

class RegistrationExperiencePage extends StatefulWidget {
  const RegistrationExperiencePage({super.key});

  @override
  State<RegistrationExperiencePage> createState() =>
      _RegistrationExperiencePageState();
}

class _RegistrationExperiencePageState
    extends State<RegistrationExperiencePage> {
  late RegistrationBloc bloc;
  final TextEditingController lifestyleController = TextEditingController();
  final TextEditingController experienceController = TextEditingController();
  final TextEditingController jobsController = TextEditingController();
  final TextEditingController educationLevel = TextEditingController();

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
    lifestyleController.dispose();
    experienceController.dispose();
    jobsController.dispose();
    educationLevel.dispose();
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
              // TODO: move this hadler to the parent
              SnackBar(
                content: Text(state.errorMessage ?? 'Authentication Failure'),
              ),
            );
        }
      },
      child: SingleChildScrollView(child: form()),
    );
  }

  Widget form() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 100),
            Transform.translate(
              offset: const Offset(-15, 0),
              child: Transform.flip(
                flipY: true,
                child: IconButton(
                  icon: const Icon(
                    Icons.keyboard_return,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    bloc.add(const PageChanged(increment: 0));
                  },
                ),
              ),
            ),
            title(),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 100),
            subTitle("Experience"),
            const SizedBox(height: 12),
            const Divider(
              color: AppColors.s2,
              thickness: 0.1,
              height: 1,
            ),
            const SizedBox(height: 20),
            lifestyleInput(),
            const SizedBox(height: 16),
            experienceInput(),
            const SizedBox(height: 60),
            subTitle("Professional"),
            const SizedBox(height: 12),
            const Divider(
              color: AppColors.s2,
              thickness: 0.1,
              height: 1,
            ),
            const SizedBox(height: 16),
            jobsInput(),
            const SizedBox(height: 16),
            educationLevelInput(),
          ],
        ),
        // const SizedBox(height: 28),
        Column(
          children: [
            const SizedBox(height: 60),
            registrationButton(),
          ],
        )
      ],
    );
  }

  Widget title() {
    return const Text(
      "Tell us about yourself.",
      style: TextStyle(
        fontSize: 28,
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget subTitle(String text) {
    return Text(
      text,
      style: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 14,
        color: Colors.white60,
      ),
    );
  }

  Widget lifestyleInput() {
    return BlocBuilder<RegistrationBloc, RegistrationState>(
      buildWhen: (previous, current) => previous.lifestyle != current.lifestyle,
      builder: (context, state) {
        return AuthInput(
          controller: lifestyleController,
          onChanged: (lifestyle) =>
              bloc.add(LifestyleChanged(lifestyle: lifestyle)),
          // keyBoardType: TextInputType.,
          hint: 'Lifestyle',
          errorText: state.shouldValidate
              ? state.lifestyle.validationToString(state.lifestyle.displayError)
              : null,
        );
      },
    );
  }

  Widget experienceInput() {
    return BlocBuilder<RegistrationBloc, RegistrationState>(
      buildWhen: (previous, current) =>
          previous.experience != current.experience,
      builder: (context, state) {
        return AuthInput(
          controller: experienceController,
          onChanged: (experience) =>
              bloc.add(ExperienceChanged(experience: experience)),
          // keyBoardType: TextInputType.,
          hint: 'Experience',
          errorText: state.shouldValidate
              ? state.experience
                  .validationToString(state.experience.displayError)
              : null,
        );
      },
    );
  }

  Widget jobsInput() {
    return BlocBuilder<RegistrationBloc, RegistrationState>(
      buildWhen: (previous, current) => previous.jobs != current.jobs,
      builder: (context, state) {
        return AuthInput(
          controller: jobsController,
          onChanged: (jobs) => bloc.add(JobsChanged(jobs: jobs)),
          // keyBoardType: TextInputType.,
          hint: 'Jobs Held',
          errorText: state.shouldValidate
              ? state.jobs.validationToString(state.jobs.displayError)
              : null,
        );
      },
    );
  }

  Widget educationLevelInput() {
    return BlocBuilder<RegistrationBloc, RegistrationState>(
      buildWhen: (previous, current) =>
          previous.educationLevel != current.educationLevel,
      builder: (context, state) {
        return AuthInput(
          controller: educationLevel,
          onChanged: (educationLevel) =>
              bloc.add(EducationLevelChanged(educationLevel: educationLevel)),
          // keyBoardType: TextInputType.,
          hint: "Education Level eg: 'PHD Graduate' ",
          errorText: state.shouldValidate
              ? state.educationLevel
                  .validationToString(state.educationLevel.displayError)
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
                  if (state.jobs.isValid &&
                      state.lifestyle.isValid &&
                      state.experience.isValid) {
                    FocusScope.of(context).unfocus();
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
