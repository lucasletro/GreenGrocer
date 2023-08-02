import 'package:flutter/material.dart';

class OrderStatusWidget extends StatelessWidget {
  final String status;
  final bool isOverdue; //indicar se o pagamento esta vencido

  //todos os status do pedido
  final Map<String, int> allStatus = <String, int>{
    "pending_payment": 0,
    "refunded": 1,
    "paid": 2,
    "preparing_purchase": 3,
    "shipping": 4,
    "delivered": 5,
  };

  //estatus atual - vai retornar um allStatus na chave status
  //! -indica que nao vai ser nulo, sempre sera uma das chaves
  int get currentStatus => allStatus[status]!;

  OrderStatusWidget({
    Key? key,
    required this.status,
    required this.isOverdue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const _StatusDot(
          isActive: true,
          title: "Pedido confirmado",
        ),
        const _CustomDivider(),
        if (currentStatus == 1) ...[
          //pix estornado
          const _StatusDot(
            isActive: true,
            title: "Pix estornado",
            backgroundColor: Colors.orange,
          ),
        ] else if (isOverdue) ...[
          //pedido vencido de pagamento
          const _StatusDot(
            isActive: true,
            title: "Pagamento Pix vencido",
            backgroundColor: Colors.red,
          ),

        ] else ...[
          _StatusDot(
            isActive: currentStatus >= 2,
            title: "Pagamento",
          ),
          const _CustomDivider(),

          _StatusDot(
            isActive: currentStatus >= 3,
            title: "Preparando",
          ),
          const _CustomDivider(),

          _StatusDot(
            isActive: currentStatus >= 4,
            title: "Envio",
          ),
          const _CustomDivider(),

          _StatusDot(
            isActive: currentStatus == 5,
            title: "Entregue",
          ),

        ]
      ],
    );
  }
}

//======================================================

//divisor usado entre um dot e outro
class _CustomDivider extends StatelessWidget {
  const _CustomDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      height: 10,
      width: 2,
      color: Colors.grey.shade300,
    );
  }
}

//DOT DE STATUS
class _StatusDot extends StatelessWidget {
  final bool isActive; //vai dizer se o botão esta ativo
  final String title;
  final Color? backgroundColor;

  const _StatusDot({
    Key? key,
    required this.isActive,
    required this.title,
    this.backgroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        //DOT
        Container(
          alignment: Alignment.center,
          height: 20,
          width: 20,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: Colors.green,
            ),
            //se a backgroundColor for nula a cor é verde
            color:
                isActive ? backgroundColor ?? Colors.green : Colors.transparent,
          ),
          child: isActive
              ? const Icon(
                  Icons.check,
                  size: 13,
                  color: Colors.white,
                )
              : const SizedBox.shrink(),
        ),

        //espaçamento entre o dot e o texto
        const SizedBox(
          width: 5,
        ),

        //TEXTO
        Expanded(
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 12,
            ),
          ),
        ),
      ],
    );
  }
}
