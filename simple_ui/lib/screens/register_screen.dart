import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:simple_ui/screens/home_page.dart';
import 'package:simple_ui/screens/login_screen.dart';
import 'package:simple_ui/view_models/auth_controller.dart';
import 'package:simple_ui/widgets/auth_nav_widget.dart';

import '../widgets/textEditing_widget.dart';

class RegisterScreen extends ConsumerStatefulWidget {
  const RegisterScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends ConsumerState<RegisterScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.clear();
    emailController.dispose();
    passwordController.clear();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff065eab),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Center(
            child: Form(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 200,
                        height: 200,
                        child: SvgPicture.asset('assets/images/register.svg'),
                      ),
                      const Center(
                        child: Text(
                          "Register",
                          style: TextStyle(
                            color: Colors.amber,
                            fontWeight: FontWeight.w900,
                            fontSize: 30,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 70,
                      ),
                      AppTextEditingWidget(
                          key: ValueKey(1),
                          controller: emailController,
                          hintText: 'Email'),
                      const SizedBox(
                        height: 30,
                      ),
                      AppTextEditingWidget(
                        key: const ValueKey(2),
                        controller: passwordController,
                        hintText: 'Password',
                        isObsecure: true,
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      SizedBox(
                        height: 70,
                        width: 200,
                        child: ElevatedButton(
                          onPressed: () {
                            if (emailController.text.isNotEmpty &&
                                passwordController.text.isNotEmpty) {
                              ref
                                  .read(authControllerProvider.notifier)
                                  .signUpWithEmailAndPassword(
                                    emailController.text,
                                    passwordController.text,
                                    context,
                                  );
                            }
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => HomePage()));
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xff0C2D48),
                              elevation: 8),
                          child: const Text(
                            'Register',
                            style: TextStyle(
                              color: Color(0xffffffff),
                              fontWeight: FontWeight.w700,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      AuthBottomNavWidget(
                        onPress: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const LoginScreen()));
                        },
                        buttonOption: 'Sign in',
                        titleOption: 'I already have an account',
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
