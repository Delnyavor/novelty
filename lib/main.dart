import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:novelty/common/theming/app_themes.dart';
import 'package:novelty/features/auth/presentation/bloc/login_bloc.dart';
import 'package:novelty/features/auth/presentation/bloc/registration_bloc/bloc/registration_bloc.dart';
import 'package:novelty/features/auth/presentation/pages/onboarding_page.dart';

import 'common/transitions/route_transitions.dart';
import 'di/injection_container.dart';
import 'features/auth/data/repositories/authentication_repository.dart';
import 'features/auth/presentation/bloc/app_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initDependencies();

  await Firebase.initializeApp();

  final authenticationRepository = sl<AuthenticationRepository>();
  await authenticationRepository.user.first;

  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AppBloc>(
          create: (_) => AppBloc(
            authenticationRepository: sl<AuthenticationRepository>(),
          ),
        ),
        BlocProvider<LoginBloc>(
          create: (_) => LoginBloc(
            authenticationRepository: sl<AuthenticationRepository>(),
          ),
        ),
        BlocProvider<RegistrationBloc>(
          create: (_) => RegistrationBloc(
            authenticationRepository: sl<AuthenticationRepository>(),
          ),
        ),
      ],
      child: MaterialApp(
        title: 'Novelty',
        theme: lightTheme,
        themeMode: ThemeMode.light,
        home: const Landing(),
      ),
    );
  }
}

class Landing extends StatelessWidget {
  const Landing({Key? key}) : super(key: key);
  void push(context) {
    Navigator.push(
      context,
      fadeInRoute(const OnBoardingPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(
          onPressed: () {
            push(context);
          },
          child: const Text('Click'),
        ),
      ),
    );
  }
}
