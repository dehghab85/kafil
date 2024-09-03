import 'package:flutter/material.dart';
import 'package:nava/core/theme/app_pallete.dart';
import 'package:fpdart/fpdart.dart' show Left, Right;
import 'package:nava/core/utils.dart';
import 'package:nava/core/widget/loader.dart';
import 'package:nava/features/auth/ViewModel/auth_viewmodel.dart';
import 'package:nava/features/auth/view/pages/SignupPage.dart';
import 'package:nava/features/auth/widget/auth_gradiant_button.dart';
import 'package:nava/features/auth/widget/custom_field.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nava/features/home/pages/home_page.dart';

class Loginpage extends ConsumerStatefulWidget {
  const Loginpage({super.key});

  @override
  ConsumerState<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends ConsumerState<Loginpage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
    formKey.currentState!.validate();
  }

  @override
  Widget build(BuildContext context) {
        final isLoading = ref
        .watch(authViewmodelProvider.select((val) => val?.isLoading == true));

    ref.listen(authViewmodelProvider, (_, next) {
      next?.when(
        data: (data) {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => const HomePage(),
            ),
            (_) => false
          );
        },
        error: (error, st) {
          showSnackBar(context, error.toString());
        },
        loading: () {},
      );
    });

    return Scaffold(
      appBar: AppBar(),
      body: isLoading
          ? const Loader()
          : Padding(
              padding: const EdgeInsets.all(15.0),
              child: Form(
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Sign In',
                      style:
                          TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    CustomField(
                      hintText: 'Email',
                      controller: emailController,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    CustomField(
                      hintText: 'Password',
                      controller: passwordController,
                      isObscureText: true,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    AuthGradientButton(
                        buttonText: 'Sign in',
                        onTap: () async {
                          if (formKey.currentState!.validate()) {
                            ref.read(authViewmodelProvider.notifier).logInUser(
                                email: emailController.text,
                                password: passwordController.text);
                          } else {
                            showSnackBar(context, 'Missing failed');
                          }
                        }),
                    const SizedBox(
                      height: 20,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Signuppage(),
                          ),
                        );
                      },
                      child: RichText(
                        text: TextSpan(
                          text: 'Don\'t have an account?  ',
                          style: Theme.of(context).textTheme.titleMedium,
                          children: const [
                            TextSpan(
                              text: 'Sign Up',
                              style: TextStyle(
                                color: Pallete.gradient1,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
    );
  }
}
