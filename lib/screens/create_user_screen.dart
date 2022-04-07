import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:convida_ai_1/design/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';
import '../classes/usuario.dart';

class CreateUserWidget extends StatefulWidget {
  const CreateUserWidget({Key? key}) : super(key: key);

  @override
  State<CreateUserWidget> createState() => CreateUserWidgetState();
}

class CreateUserWidgetState extends State<CreateUserWidget> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmePasswordController = TextEditingController();
  final pixController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    confirmePasswordController.dispose();
    pixController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Registre-se',
              style: TextStyle(
                  fontFamily: GoogleFonts.inter().fontFamily,
                  fontWeight: FontWeight.bold,
                  color: AppColors.titlesColor)),
        ),
        body: SingleChildScrollView(
          child: Center(
              child: Column(children: [
            const SizedBox(height: 50),
            Image.asset('lib/assets/convida_logo.png', width: 317, height: 90),
            const SizedBox(height: 50),
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
                margin: const EdgeInsets.only(left: 25, right: 25, bottom: 20),
                child: TextField(
                    obscureText: true,
                    controller: passwordController,
                    decoration: InputDecoration(
                        hintText: 'Senha',
                        enabledBorder: UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: AppColors.textFieldColor)),
                        focusedBorder: UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: AppColors.textFieldColor))))),
            Container(
                margin: const EdgeInsets.only(left: 25, right: 25, bottom: 20),
                child: TextField(
                    controller: confirmePasswordController,
                    obscureText: true,
                    decoration: InputDecoration(
                        hintText: 'Confirmar Senha',
                        enabledBorder: UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: AppColors.textFieldColor)),
                        focusedBorder: UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: AppColors.textFieldColor))))),
            Container(
                margin: const EdgeInsets.only(left: 25, right: 25, bottom: 40),
                child: TextField(
                    controller: pixController,
                    decoration: InputDecoration(
                        hintText: 'Pix',
                        enabledBorder: UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: AppColors.textFieldColor)),
                        focusedBorder: UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: AppColors.textFieldColor))))),
            Container(
                margin: const EdgeInsets.only(right: 10),
                child: SizedBox(
                    width: 120,
                    height: 55,
                    child: ElevatedButton(
                      style: Theme.of(context).elevatedButtonTheme.style,
                      child: const Text('Criar Conta'),
                      onPressed: () async {
                        if ((emailController.text.isNotEmpty == true &&
                                passwordController.text.isNotEmpty == true &&
                                pixController.text.isNotEmpty == true) &&
                            passwordController.text ==
                                confirmePasswordController.text) {
                          FirebaseAuth.instance
                              .createUserWithEmailAndPassword(
                                  email: emailController.text,
                                  password: passwordController.text)
                              .whenComplete(() => {
                                    FirebaseFirestore.instance
                                        .collection('users')
                                        .doc()
                                        .set(Usuario(emailController.text,
                                                pixController.text)
                                            .toJson())
                                        .then((_) => {
                                              showDialog<String>(
                                                  context: context,
                                                  builder: (BuildContext
                                                          context) =>
                                                      AlertDialog(
                                                        title:
                                                            const Text('Aviso'),
                                                        content: const Text(
                                                            'Usuário registrado com sucesso!'),
                                                        actions: <Widget>[
                                                          TextButton(
                                                            onPressed: () => {
                                                              Navigator.pop(
                                                                  context,
                                                                  'OK'),
                                                              Navigator.pop(
                                                                  context)
                                                            },
                                                            child: const Text(
                                                                'OK'),
                                                          ),
                                                        ],
                                                      ))
                                            })
                                  });
                          // inserir dados no firebase
                        } else if (emailController.text.isNotEmpty != true ||
                            passwordController.text.isNotEmpty != true ||
                            pixController.text.isNotEmpty != true) {
                          showDialog<String>(
                              context: context,
                              builder: (BuildContext context) => AlertDialog(
                                    title: const Text('Falha'),
                                    content: const Text(
                                        'Todos os campos devem ser preenchidos!'),
                                    actions: <Widget>[
                                      TextButton(
                                        onPressed: () =>
                                            Navigator.pop(context, 'OK'),
                                        child: const Text('OK'),
                                      ),
                                    ],
                                  ));
                        } else {
                          showDialog<String>(
                              context: context,
                              builder: (BuildContext context) => AlertDialog(
                                    title: const Text('Falha'),
                                    content: const Text(
                                        'A senha confirmada não é igual a senha digitada!'),
                                    actions: <Widget>[
                                      TextButton(
                                        onPressed: () =>
                                            Navigator.pop(context, 'OK'),
                                        child: const Text('OK'),
                                      ),
                                    ],
                                  ));
                        }
                      },
                    ))),
          ])),
        ));
  }
}
