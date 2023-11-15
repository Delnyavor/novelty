import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:novelty/features/auth/presentation/widgets/reg_experience_page.dart';
import 'package:novelty/features/auth/presentation/widgets/reg_personal_details.dart';

import '../../../../common/theming/app_colors.dart';
import '../bloc/registration_bloc/bloc/registration_bloc.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  late RegistrationBloc bloc;

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
    bloc.add(const RegistrationValidationStateChanged(state: false));
    bloc.add(const PageChanged(increment: 0));
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
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.primary,
          automaticallyImplyLeading: false,
          elevation: 0,
          toolbarHeight: 0,
        ),
        backgroundColor: AppColors.primary,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 35.0, vertical: 0),
          child: body(),
        ),
      ),
    );
  }

  Widget body() {
    return BlocBuilder<RegistrationBloc, RegistrationState>(
      buildWhen: (previous, current) => previous.page != current.page,
      builder: (context, state) {
        return IndexedStack(
          index: state.page,
          children: const [
            RegistrationPersonalInfoPage(),
            RegistrationExperiencePage(),
          ],
        );
      },
    );
  }
}
