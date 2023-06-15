import 'package:flutter/material.dart';
import 'package:greengrocer/src/auth/components/custom_text_field.dart';

//TELA DE LOGIN #1

class SignInScreen extends StatelessWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,

      body: Column(
        children: [

          Expanded(
              child: Container(
            color: Colors.red,
          )),

          //CONTAINER BRANCO COM BORDAS ARREDONDADAS
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 40),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(45),
              )
            ),

            child: Column(
              //esticar os componentes no eixo cruzado(Botao entrar...)
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                //EMAIL
                const CustomTextField(
                  icon: Icons.email,
                  label: "Email",
                ),

                //SENHA
                const CustomTextField(
                  icon: Icons.lock,
                  label: "Senha",
                  isSecret: true,
                ),

                //BOTAO ENTRAR
                SizedBox(
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18),
                      ),
                      backgroundColor: Colors.green
                    ),
                      onPressed: (){},
                      child: const Text("Entrar", style: TextStyle(
                        fontSize: 18,
                        color: Colors.white
                      ),),
                  ),
                ),

                //BOTAO ESQUECI A SENHA
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: (){},
                    child: const Text(
                      "Esqueceu a senha?",
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
                ),

                //DIVISOR
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Row(
                    children: [
                      Expanded(
                        child: Divider(
                          color: Colors.grey.withAlpha(90),
                          thickness: 2,
                        ),
                      ),

                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        child: Text("Ou"),
                      ),

                      Expanded(
                        child: Divider(
                          color: Colors.grey.withAlpha(90),
                          thickness: 2,
                        ),
                      ),
                    ],
                  ),
                ),

                //BOTAO DE NOVO USUARIO
                SizedBox(
                  height: 50,
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18),
                      ),
                      side: const BorderSide(
                        width: 2,
                        color: Colors.green
                      ),
                    ),
                    onPressed: (){},
                    child: const Text("Criar conta", style: TextStyle(
                      fontSize: 18,
                    ),),
                  ),
                ),


              ],
            ),
          ),

        ],
      ),
    );
  }
}
