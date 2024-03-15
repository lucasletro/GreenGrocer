import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:greengrocer/src/pages/auth/sign_in_screen.dart';
import 'package:greengrocer/src/pages/common_widgets/custom_text_field.dart';

import 'package:greengrocer/src/config/app_data.dart' as appData;

class ProfileTab extends StatefulWidget {
  const ProfileTab({Key? key}) : super(key: key);

  @override
  State<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
  //
  final _fireBaseAuth = FirebaseAuth.instance;
  String nome = "";
  String email = "";
  String celular = "";
  String cpf = "";
  bool _isLoading = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //pegarUsuario();
    _fetchUser();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Perfil do usuário",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.green,
        actions: [
          IconButton(
            onPressed: () {
              logout();
            },
            icon: const Icon(Icons.logout, color: Colors.white),
          ),
        ],
      ),

      //FORMULARIO
      body: _isLoading? const Center(child: CircularProgressIndicator(),) : ListView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.fromLTRB(16, 32, 16, 16),
        children: [
          //email
          CustomTextField(
            readOnly: true,
            initialValue: email, /////////
            icon: Icons.email,
            label: "Email",
          ),

          //nome
           CustomTextField(
            readOnly: true,
            initialValue: nome, ///////////
            icon: Icons.person,
            label: "Nome",
          ),

          //celular
          CustomTextField(
            readOnly: true,
            initialValue: celular,
            icon: Icons.phone,
            label: "Celular",
          ),

          //CPF
          CustomTextField(
            readOnly: true,
            initialValue: cpf,
            icon: Icons.file_copy,
            label: "CPF",
            isSecret: true,
          ),

          //Botão para atualizar a senha
          SizedBox(
            height: 50,
            child: OutlinedButton(
              style: OutlinedButton.styleFrom(
                side: const BorderSide(color: Colors.green),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              onPressed: () {
                updatePassword();
              },
              child: const Text("Atualizar senha"),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _fetchUser() async {
    User? user = _fireBaseAuth.currentUser;
    if (user != null) {
      setState(() {
        nome = user.displayName ?? "";
        email = user.email ?? "";
        celular = user.phoneNumber ?? "";
        //cpf = user.
        _isLoading = false;
      });
    } else {
      setState(() {
        _isLoading = false;
      });
    }
  }

  // pegarUsuario() async {
  //   User? usuario = await _fireBaseAuth.currentUser;
  //
  //   if(usuario != null){
  //     setState(() {
  //       nome = usuario.displayName!;
  //       email = usuario.email!;
  //     });
  //   }
  //
  // }

  //metodo para sair do app
  logout() async {
    await _fireBaseAuth.signOut().then(
          (user) => Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const SignInScreen(),
            ),
          ),
        );
  }

  //dialog para atualizar a senha
  Future<bool?> updatePassword() {
    return showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 12),

                      //titulo
                      child: Text(
                        "Atualização de senha",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),

                    //senha atual
                    const CustomTextField(
                      icon: Icons.lock,
                      label: "Senha atual",
                      isSecret: true,
                    ),

                    //nova senha
                    const CustomTextField(
                      icon: Icons.lock_outline,
                      label: "Nova senha",
                      isSecret: true,
                    ),

                    //confirmação nova senha
                    const CustomTextField(
                      icon: Icons.lock_outline,
                      label: "Confirmar nova senha",
                      isSecret: true,
                    ),

                    //botão de confirmação
                    SizedBox(
                      height: 45,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        onPressed: () {},
                        child: const Text(
                          "Atualizar",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              //botão de fechar.
              Positioned(
                top: 5,
                right: 5,
                child: IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: const Icon(Icons.close),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
