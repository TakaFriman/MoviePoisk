import 'package:flutter/material.dart';
import 'package:themoviedb/Theme/app_button_style.dart';
import 'package:themoviedb/widgets/auth/form_widget.dart';

class AuthWidget extends StatefulWidget {
  const AuthWidget({super.key});

  @override
  State<AuthWidget> createState() => _AuthWidgetState();
}

class _AuthWidgetState extends State<AuthWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login to your account'),
        centerTitle: true,
      ),
      body: ListView(children: const [
        _HeaderWidget(),
      ]),
    );
  }
}

class _HeaderWidget extends StatelessWidget {
  const _HeaderWidget();

  @override
  Widget build(BuildContext context) {
    const textStyle = TextStyle(fontSize: 16, color: Colors.black);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 25),
            const FormWidget(),
            const SizedBox(height: 25),
            const Text('1 текст', style: textStyle),
            const SizedBox(height: 5),
            TextButton(onPressed: () {}, style: AppButtonStyle.linkButton, child: const Text('Register')),
            const SizedBox(height: 25),
            const Text('2 текст', style: textStyle),
            const SizedBox(height: 5),
            TextButton(onPressed: () {}, style: AppButtonStyle.linkButton, child: const Text('Verify email')),
          ],
        ),
      ),
    );
  }
}
