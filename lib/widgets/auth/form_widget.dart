import 'package:flutter/material.dart';
import 'package:themoviedb/widgets/auth/auth_widget_model.dart';

import '../../Theme/app_button_style.dart';

class FormWidget extends StatelessWidget {
  const FormWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final model = AuthProvider.read(context)?.model;

    const textStyle = TextStyle(fontSize: 16, color: Color(0xFF212529));

    const textFieldDecorator = InputDecoration(
        focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),
        contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        isCollapsed: true);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const _ErrorMessageWidget(),
        const Text('UserName', style: textStyle),
        const SizedBox(height: 5),
        TextField(
          controller: model?.loginTextController,
          decoration: textFieldDecorator,
        ),
        const SizedBox(height: 20),
        const Text('Password', style: textStyle),
        const SizedBox(height: 5),
        TextField(
          controller: model?.passwordTextController,
          decoration: textFieldDecorator,
          obscureText: true,
        ),
        const SizedBox(height: 25),
        Row(
          children: [
            const AuthButton(),
            const SizedBox(width: 25),
            TextButton(
              onPressed: () {},
              style: AppButtonStyle.linkButton,
              child: const Text('Reset password'),
            ),
          ],
        )
      ],
    );
  }
}

class AuthButton extends StatelessWidget {
  const AuthButton({super.key});

  @override
  Widget build(BuildContext context) {
    const color = Color(0xFF01B4E4);
    final model = AuthProvider.watch(context)?.model;
    final child = model?.isAuthProgress == true
        ? const SizedBox(
            width: 15,
            height: 15,
            child: CircularProgressIndicator(
              strokeWidth: 2,
            ))
        : const Text('Login');
    final onPressed = model?.canStartAuth == true ? () => model?.auth(context) : null;
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(color),
        foregroundColor: MaterialStateProperty.all(Colors.white),
        textStyle: MaterialStateProperty.all(
          const TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
        ),
        padding: MaterialStateProperty.all(const EdgeInsets.symmetric(horizontal: 16, vertical: 8)),
      ),
      child: child,
    );
  }
}

class _ErrorMessageWidget extends StatelessWidget {
  const _ErrorMessageWidget();

  @override
  Widget build(BuildContext context) {
    final errorMessage = AuthProvider.watch(context)?.model.errorMessage;

    if (errorMessage == null) return const SizedBox.shrink();
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Text(
        errorMessage,
        style: const TextStyle(color: Colors.red, fontSize: 18),
      ),
    );
  }
}
