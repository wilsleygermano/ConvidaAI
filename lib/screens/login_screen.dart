import 'package:convida_ai_1/design/app_colors.dart';
import 'package:convida_ai_1/screens/create_user_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginWidget extends StatefulWidget {
  final Function mudarEstado;
  const LoginWidget({Key? key, required this.mudarEstado}) : super(key: key);

  @override
  State<LoginWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  late Function mudarEstado;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    this.mudarEstado = widget.mudarEstado;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
      children: [
        const SizedBox(height: 120),
        Image.asset('lib/assets/convida_logo.png', width: 317, height: 90),
        const SizedBox(height: 170),
        Container(
            margin: const EdgeInsets.only(left: 25, right: 25, bottom: 20),
            child: TextField(
                controller: emailController,
                decoration: InputDecoration(
                    hintText: 'E-mail',
                    enabledBorder: UnderlineInputBorder(
                        borderSide:
                            BorderSide(color: AppColors.textFieldColor)),
                    focusedBorder: UnderlineInputBorder(
                        borderSide:
                            BorderSide(color: AppColors.textFieldColor))))),
        Container(
            margin: const EdgeInsets.only(left: 25, right: 25, bottom: 138),
            child: TextField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                    hintText: 'Password',
                    enabledBorder: UnderlineInputBorder(
                        borderSide:
                            BorderSide(color: AppColors.textFieldColor)),
                    focusedBorder: UnderlineInputBorder(
                        borderSide:
                            BorderSide(color: AppColors.textFieldColor))))),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
                margin: const EdgeInsets.only(right: 10),
                child: SizedBox(
                    width: 115,
                    height: 55,
                    child: ElevatedButton(
                      style: Theme.of(context).elevatedButtonTheme.style,
                      child: const Text('Login'),
                      onPressed: signIn,
                    ))),
            Container(
                margin: const EdgeInsets.only(left: 10),
                child: SizedBox(
                    width: 115,
                    height: 55,
                    child: ElevatedButton(
                        child: const Text('Registrar'),
                        style: Theme.of(context).elevatedButtonTheme.style,
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const CreateUserWidget()));
                        })))
          ],
        )
      ],
    ));
  }

  Future signIn() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: emailController.text.trim(),
      password: passwordController.text.trim(),
    );
    mudarEstado();
  }
}
