import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:novelty/common/theming/app_colors.dart';

import '../bloc/login_bloc.dart';
import '../widgets/auth_input.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late double screenHeight;
  late LoginBloc bloc;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    bloc = BlocProvider.of<LoginBloc>(context);
    bloc.add(const ValidationStateChanged(true));

    screenHeight = MediaQuery.of(context).size.height;
  }

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
    bloc.add(const ValidationStateChanged(false));
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
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
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 35.0, vertical: 0),
          child: SizedBox(
            height: screenHeight - 40,
            child: form(),
          ),
        ),
      ),
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
              const SizedBox(height: 16),
              subTitle(),
            ],
          ),
        ),
        Column(
          children: [
            emailInput(),
            const SizedBox(height: 16),
            passwordInput(),
          ],
        ),
        // const SizedBox(height: 28),
        Column(
          children: [
            registerOption(),
            const SizedBox(height: 28),
            loginButton(),
            const SizedBox(height: 12),
          ],
        )
      ],
    );
  }

  Widget title() {
    return const Text(
      "Let's sign you in",
      style: TextStyle(
        fontSize: 28,
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget subTitle() {
    return const Text(
      "Welcome back. \nYou have been missed",
      style: TextStyle(
        fontSize: 22,
        color: AppColors.s2,
        fontWeight: FontWeight.w200,
      ),
    );
  }

  Widget registerOption() {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Don\'t have an account?',
          style: TextStyle(
            fontSize: 12,
            color: Colors.white,
            letterSpacing: 0.5,
          ),
        ),
        SizedBox(width: 5),
        InkWell(
          child: Text(
            'Register',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              letterSpacing: 0.5,
              fontSize: 12,
              color: Colors.white,
            ),
          ),
        )
      ],
    );
  }

  Widget emailInput() {
    return BlocBuilder<LoginBloc, LoginState>(
      buildWhen: (previous, current) => previous.email != current.email,
      builder: (context, state) {
        return AuthInput(
          key: const Key('loginForm_emailInput_textField'),
          controller: emailController,
          onChanged: (email) => bloc.add(EmailChanged(email)),
          keyBoardType: TextInputType.emailAddress,
          hint: 'Email',
          errorText: state.shouldValidate
              ? state.email.validationToString(state.email.displayError)
              : null,
        );
      },
    );
  }

  Widget passwordInput() {
    return BlocBuilder<LoginBloc, LoginState>(
      buildWhen: (previous, current) => previous.password != current.password,
      builder: (context, state) {
        return AuthInput(
          key: const Key('loginForm_passwordInput_textField'),
          controller: passwordController,
          onChanged: (password) => bloc.add(PasswordChanged(password)),
          obscure: true,
          hint: 'Password',
          errorText: state.shouldValidate
              ? state.password.validationToString(state.password.displayError)
              : null,
        );
      },
    );
  }

  Widget loginButton() {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        return state.status.isInProgress
            ? const CircularProgressIndicator()
            : ElevatedButton(
                key: const Key('loginForm_continue_raisedButton'),
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    elevation: 0,
                    backgroundColor: AppColors.gold,
                    foregroundColor: AppColors.primary,
                    minimumSize: const Size(double.infinity, 50)),
                onPressed: () {
                  if (emailController.text.isNotEmpty &&
                      passwordController.text.isNotEmpty) {
                    bloc.add(LoginWithCredentials());
                  } else {
                    bloc.add(ValidateFields());
                  }
                },
                child: const Text(
                  'Sign In',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                ),
              );
      },
    );
  }
}



// class _GoogleLoginButton extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context);
//     return ElevatedButton.icon(
//       key: const Key('loginForm_googleLogin_raisedButton'),
//       label: const Text(
//         'SIGN IN WITH GOOGLE',
//         style: TextStyle(color: Colors.white),
//       ),
//       style: ElevatedButton.styleFrom(
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(30),
//         ),
//         backgroundColor: theme.colorScheme.secondary,
//       ),
//       icon: const Icon(FontAwesomeIcons.google, color: Colors.white),
//       onPressed: () => bloc.logInWithGoogle(),
//     );
//   }
// }


