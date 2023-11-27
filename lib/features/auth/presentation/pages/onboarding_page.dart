import 'package:flutter/material.dart';
import 'package:novelty/common/routes/routes.dart';
import 'package:novelty/common/theming/app_colors.dart';
import 'package:novelty/common/transitions/route_transitions.dart';
import 'package:novelty/features/auth/presentation/pages/login_page.dart';
import 'package:novelty/features/auth/presentation/pages/registration_page.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({super.key});

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        toolbarHeight: 0,
      ),
      backgroundColor: AppColors.primary,
      body: Padding(
        padding: const EdgeInsets.all(45.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            ClipRect(
              child: Transform.scale(
                scale: 1.1,
                child: Image.asset('assets/images/s1.png'),
              ),
            ),
            const SizedBox(height: 18),
            title(),
            const SizedBox(height: 22),
            subTitle(),
            const Expanded(child: SizedBox.shrink()),
            skipWidget(),
            const SizedBox(height: 38),
            const _OnBoardingButtonBar(),
          ],
        ),
      ),
    );
  }

  Widget title() {
    return const Text(
      "Come on board.",
      style: TextStyle(
        fontSize: 32,
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget subTitle() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.0),
      child: Text(
        "Create a free account and share those precious experiences.",
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 16,
          color: AppColors.light,
          fontWeight: FontWeight.w200,
          height: 1.5,
        ),
      ),
    );
  }

  Widget skipWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
          onTap: () {
            Navigator.pushReplacementNamed(
                context, "${AppRoutes.app}${AppRoutes.homeRoutePrefix}");
          },
          child: const Text(
            'Skip',
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
}

class _OnBoardingButtonBar extends StatelessWidget {
  const _OnBoardingButtonBar();

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(18),
      child: DecoratedBox(
        decoration: const BoxDecoration(color: AppColors.light),
        child: Stack(children: [
          signInButton(context),
          registerButton(context),
        ]),
      ),
    );
  }

  Widget registerButton(context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          elevation: 0,
          backgroundColor: AppColors.gold,
          foregroundColor: Colors.black87,
          minimumSize: const Size(180, 54)),
      onPressed: () {
        Navigator.push(context, fadeInRoute(const RegistrationPage()));
      },
      child: const Text(
        'Register',
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
      ),
    );
  }

  Widget signInButton(context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        elevation: 0,
        backgroundColor: AppColors.light,
        foregroundColor: Colors.black87,
        minimumSize: const Size.fromHeight(54),
        // padding: const EdgeInsets.only(right: 50),
      ),
      onPressed: () {
        Navigator.push(context, fadeInRoute(const LoginPage()));
      },
      child: const Padding(
        padding: EdgeInsets.only(left: 180),
        child: Text(
          'Sign In',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
        ),
      ),
    );
  }
}
