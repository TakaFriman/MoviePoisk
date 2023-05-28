import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:themoviedb/Theme/app_button_style.dart';
import 'package:themoviedb/widgets/home/home_page.dart';

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
        title: Text('Login to your account'),
        centerTitle: true,
      ),
      body: ListView(children: [
        _HeaderWidget(),
      ]),
    );
  }
}

class _HeaderWidget extends StatelessWidget {
  const _HeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    const textStyle = TextStyle(fontSize: 16, color: Colors.black);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 25),
            _FormWidget(),
            SizedBox(height: 25),
            Text('1 текст', style: textStyle),
            SizedBox(height: 5),
            TextButton(
                onPressed: () {},
                style: AppButtonStyle.linkButton,
                child: Text('Register')),
            SizedBox(height: 25),
            Text('2 текст', style: textStyle),
            SizedBox(height: 5),
            TextButton(
                onPressed: () {},
                style: AppButtonStyle.linkButton,
                child: Text('Verify email')),
          ],
        ),
      ),
    );
  }
}

class _FormWidget extends StatefulWidget {
  const _FormWidget({super.key});

  @override
  State<_FormWidget> createState() => __FormWidgetState();
}

class __FormWidgetState extends State<_FormWidget> {
  final _loginTextController = TextEditingController(text: 'admin');
  final _passwordTextController = TextEditingController(text: '123456');
  String? errorText = null;
  void _auth() {
    final login = _loginTextController.text;
    final pass = _passwordTextController.text;
    if (login == 'admin' && pass == '123456') {
      errorText = null;

      Navigator.of(context).pushReplacementNamed('/home_page');
    } else {
      errorText = 'Неверный логин или пароль';
    }
    setState(() {});
  }

  void _resetPassword() {
    print('Reset Pass');
  }

  @override
  Widget build(BuildContext context) {
    final textStyle = const TextStyle(fontSize: 16, color: Color(0xFF212529));

    final textFieldDecorator = const InputDecoration(
        focusedBorder:
            OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),
        contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        isCollapsed: true);
    final color = const Color(0xFF01B4E4);
    final errorText = this.errorText;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (errorText != null) ...[
          Text(
            errorText,
            style: TextStyle(color: Colors.red, fontSize: 18),
          ),
          SizedBox(
            height: 20,
          )
        ],
        Text('UserName', style: textStyle),
        const SizedBox(height: 5),
        TextField(
          controller: _loginTextController,
          decoration: textFieldDecorator,
        ),
        const SizedBox(height: 20),
        Text('Password', style: textStyle),
        const SizedBox(height: 5),
        TextField(
          controller: _passwordTextController,
          decoration: textFieldDecorator,
          obscureText: true,
        ),
        const SizedBox(height: 25),
        Row(
          children: [
            ElevatedButton(
              onPressed: _auth,
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(color),
                foregroundColor: MaterialStateProperty.all(Colors.white),
                textStyle: MaterialStateProperty.all(
                  TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                ),
                padding: MaterialStateProperty.all(
                    EdgeInsets.symmetric(horizontal: 16, vertical: 8)),
              ),
              child: Text('Login'),
            ),
            SizedBox(width: 25),
            TextButton(
              onPressed: _resetPassword,
              style: AppButtonStyle.linkButton,
              child: Text('Reset password'),
            ),
          ],
        )
      ],
    );
  }
}
