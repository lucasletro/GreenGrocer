import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:greengrocer/src/pages/auth/sign_in_screen.dart';
import 'package:greengrocer/src/pages/base/base_screen.dart';

import '../common_widgets/app_name_widget.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  //
  StreamSubscription? streamSubscription;

  //condição para verificar se o usuario esta logado no app
  @override
  void initState() {
    super.initState();
    //monitora as mudanças no estado de autenticação
    // do usuário usando Firebase Authentication.
    streamSubscription = FirebaseAuth.instance.authStateChanges().listen(
      (User? user) {
        if (user == null) {
          //caso nao tiver logado, vou para tela de login
          Future.delayed(
            const Duration(seconds: 2),
            () {
              Navigator.of(context)
                  .pushReplacement(MaterialPageRoute(builder: (c) {
                return const SignInScreen();
              }));
            },
          );
        } else {
          //se ja tiver logado ja vou para tela base
          Future.delayed(
            const Duration(seconds: 2),
            () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const BaseScreen(),
                ),
              );
            },
          );
        }
      },
    );
  }

  @override
  void dispose() {
    streamSubscription!.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.green.shade700,
                Colors.green.shade500,
                Colors.green.shade400,
              ]),
        ),
        child: const Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            //NOME DO APP
            AppNameWidget(
              greenTitleColor: Colors.white,
              textSize: 40,
            ),

            SizedBox(
              height: 10,
            ),

            //INDICADOR DE PROGRESSO
            CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation(Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
