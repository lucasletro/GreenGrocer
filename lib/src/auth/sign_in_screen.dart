import 'package:flutter/material.dart';

//TELA DE LOGIN

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
          Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 40),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(45),
                  )
                ),

                child: Column(
                  children: [
                    //email
                    TextFormField(
                      decoration: InputDecoration(
                        isDense: true, //o campo de texto fica mais baixo
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(18),
                        ),
                      ),
                    ),

                    //senha
                    TextFormField(),

                  ],
                ),
          )),

        ],
      ),
    );
  }
}
