import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

//CAMPO DE TEXTO CUSTOMIZADO #2

class CustomTextField extends StatefulWidget {
  final IconData icon;
  final String label;
  final TextEditingController? controller; //login firebase

  //variavel para apresentar o botao de visibilidade
  // do suffixIcon no campo de senha
  final bool isSecret;

  final List<TextInputFormatter>? inputFormatters;

  //profile_tab
  final String? initialValue;
  final bool readOnly;

  const CustomTextField({
    Key? key,
    required this.icon,
    required this.label,
    this.isSecret = false,
    this.inputFormatters,
    this.initialValue,
    this.readOnly = false,
    this.controller,
  }) : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  //variavel para deixar o texto oculto nas senhas
  bool isObscure = false;

  @override
  void initState() {
    super.initState();
    //se o isSecret for true p isObscure tambem sera.
    isObscure = widget.isSecret;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: TextFormField(
        controller: widget.controller,
        readOnly: widget.readOnly, //campo apenas de leitura na profile_tab
        initialValue: widget.initialValue, //valor inicial do campo de texto
        inputFormatters: widget.inputFormatters,
        obscureText: isObscure,
        decoration: InputDecoration(
          prefixIcon: Icon(widget.icon),

          //se o isSecret for true mostra o botão senao retorna null
          suffixIcon: widget.isSecret
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      isObscure = !isObscure;
                    });
                  },
                  icon:
                      Icon(isObscure ? Icons.visibility : Icons.visibility_off),
                )
              : null,

          labelText: widget.label,
          isDense: true,
          //o campo de texto fica mais baixo
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(18),
          ),
        ),
      ),
    );
  }
}
