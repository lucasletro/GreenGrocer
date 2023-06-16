import 'package:flutter/material.dart';
import 'package:greengrocer/src/auth/components/custom_text_field.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({Key? key}) : super(key: key);

  final cpfFormatter = MaskTextInputFormatter(
    mask: '###.###.###-##',
    filter: {'#': RegExp(r'[0-9]')},
  );

  final phoneFormatter = MaskTextInputFormatter(
    mask: '## # ####-####',
    filter: {'#': RegExp(r'[0-9]')},
  );



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
          // (botao de voltar a tela anterior)
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
                        fontSize: 35
                      ),),
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
                      )
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const CustomTextField(
                            icon: Icons.email,
                            label: "Email",
                        ),
                        const CustomTextField(
                          icon: Icons.lock,
                          label: "Senha",
                          isSecret: true,
                        ),
                        const CustomTextField(
                            icon: Icons.person,
                            label: "Nome"
                        ),
                        CustomTextField(
                            icon: Icons.phone,
                            label: "Celular",
                          inputFormatters: [phoneFormatter],
                        ),
                        CustomTextField(
                            icon: Icons.file_copy,
                            label: "CPF",
                          inputFormatters: [cpfFormatter],
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
                              onPressed: (){},
                              child: const Text("Cadastrar usuario", style: TextStyle(
                                fontSize: 18,
                                color: Colors.white
                              ),),
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
                      onPressed: (){
                        Navigator.of(context).pop();
                      },
                      icon: const Icon(Icons.arrow_back_ios, color: Colors.white,),
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
