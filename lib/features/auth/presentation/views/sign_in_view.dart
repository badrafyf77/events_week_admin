import 'package:events_week_admin/core/utils/colors.dart';
import 'package:events_week_admin/core/utils/customs/app_logo.dart';
import 'package:events_week_admin/core/utils/customs/button.dart';
import 'package:events_week_admin/core/utils/customs/custom_scaffold.dart';
import 'package:events_week_admin/core/utils/customs/text_field.dart';
import 'package:events_week_admin/core/utils/images.dart';
import 'package:events_week_admin/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    Size size = MediaQuery.of(context).size;
    GlobalKey<FormState> formKey = GlobalKey();
    return CustomScaffold(
      body: Form(
        key: formKey,
        child: Row(
          children: [
            Expanded(
              child: Container(
                color: AppColors.kPrimaryColor,
                child: Lottie.asset(AppAssets.login),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Spacer(),
                  SizedBox(
                    width: size.width * 0.32,
                    child: Column(
                      children: [
                        const AppLogo(),
                        Text(
                          'Connectez-vous a votre compte',
                          style: Styles.normal20,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Text(
                    'E-mail',
                    style: Styles.normal16,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  MyTextField(
                    width: size.width * 0.32,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Entrer votre e-mail';
                      }
                      return null;
                    },
                    hintText: 'Email',
                    controller: emailController,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Mot de passe',
                    style: Styles.normal16,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  MyTextField(
                    width: size.width * 0.32,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Entrer votre mot de passe';
                      } else if (value.length < 8) {
                        return 'Mot de passe doit être d\'au moins 8 caractères';
                      }
                      return null;
                    },
                    hintText: 'Mot de passe',
                    controller: passwordController,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomButton(
                        title: 'Se connecter',
                        onPressed: () async {},
                        backgroundColor: AppColors.kPrimaryColor,
                        height: 40,
                        width: size.width * 0.32,
                      ),
                    ],
                  ),
                  const Spacer(flex: 2),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
