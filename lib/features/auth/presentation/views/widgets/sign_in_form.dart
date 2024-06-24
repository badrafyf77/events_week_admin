import 'package:events_week_admin/core/utils/colors.dart';
import 'package:events_week_admin/core/utils/customs/app_logo.dart';
import 'package:events_week_admin/core/utils/customs/button.dart';
import 'package:events_week_admin/core/utils/customs/text_field.dart';
import 'package:events_week_admin/core/utils/helpers/validators.dart';
import 'package:events_week_admin/core/utils/styles.dart';
import 'package:flutter/material.dart';

class SignInForm extends StatefulWidget {
  const SignInForm({super.key});

  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Form(
      key: formKey,
      child: Padding(
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
                    style: Styles.normal20.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
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
                } else if (!value.isValidEmail()) {
                  return 'vérifier votre e-mail';
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
                  onPressed: () {
                    if (formKey.currentState!.validate()) {}
                  },
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
    );
  }
}