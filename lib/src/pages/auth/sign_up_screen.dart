import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:greengrocer/src/pages/base/base_screen.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import '../common_widgets/custom_text_field.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final cpfFormatter = MaskTextInputFormatter(
    mask: '###.###.###-##',
    filter: {'#': RegExp(r'[0-9]')},
  );

  final phoneFormatter = MaskTextInputFormatter(
    mask: '## # ####-####',
    filter: {'#': RegExp(r'[0-9]')},
  );

  final _cpfController = TextEditingController();

  final _phoneController = TextEditingController();

  final _nomeController = TextEditingController();

  final _emailController = TextEditingController();

  final _passwordController = TextEditingController();

  final _fireBaseAuth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.green,
      body: SingleChildScrollView(
        child: SizedBox(
          height: size.height,
          width: size.width,

          //stack permitir q coloque um widget em cima do outro
          child: Stack(
            children: [
              Column(
                children: [
                  //NOME DA TELA
                  const Expanded(
                    child: Center(
                      child: Text(
                        "Cadastro",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 35,
                        ),
                      ),
                    ),
                  ),

                  //CONTAINER BRANCO COM BORDAS ARREDONDADAS - FORMULARIO
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 32,
                      vertical: 40,
                    ),
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(45),
                        )),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        CustomTextField(
                          icon: Icons.email,
                          label: "Email",
                          controller: _emailController,
                        ),
                        CustomTextField(
                          icon: Icons.lock,
                          label: "Senha",
                          isSecret: true,
                          controller: _passwordController,
                        ),
                        CustomTextField(
                          icon: Icons.person,
                          label: "Nome",
                          controller: _nomeController,
                        ),
                        CustomTextField(
                          icon: Icons.phone,
                          label: "Celular",
                          inputFormatters: [phoneFormatter],
                          controller: _phoneController,
                        ),
                        CustomTextField(
                          icon: Icons.file_copy,
                          label: "CPF",
                          inputFormatters: [cpfFormatter],
                          controller: _cpfController,
                        ),
                        SizedBox(
                          height: 50,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18),
                              ),
                            ),
                            onPressed: () {
                              cadastrar();
                            },
                            child: const Text(
                              "Cadastrar usuario",
                              style:
                                  TextStyle(fontSize: 18, color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              //BOTAO DE RETORNAR A TELA ANTERIOR
              Positioned(
                left: 10,
                top: 10,
                child: SafeArea(
                  child: IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  cadastrar() async {
    try {
      UserCredential userCredential =
          await _fireBaseAuth.createUserWithEmailAndPassword(
              email: _emailController.text, password: _passwordController.text);

      if (userCredential != null) {
        userCredential.user!.updateDisplayName(_nomeController.text);
        // ignore: use_build_context_synchronously
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => const BaseScreen(),
            ),
            (route) => false);
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Crie uma senha mais forte"),
            backgroundColor: Colors.redAccent,
          ),
        );
      } else if (e.code == 'email-already-in-use') {
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Este email já foi cadastrado"),
            backgroundColor: Colors.redAccent,
          ),
        );
      }
    }
  }
}
