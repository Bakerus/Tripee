import 'package:flutter/material.dart';
import 'package:tripee/app/modules/recipe_payment/views/widgets/infos_payment.dart';

class CashOut extends StatelessWidget {
  const CashOut({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        InfosPayment(
            paymentName: "Cash",
            date: "12:30, 02Septembre 2024",
            content: "42 Promenade Sussex Ontario K1M 2C9",
            amount: "32",
            state: true)
      ],
    );
  }
}
