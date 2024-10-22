import 'package:flutter/material.dart';
import 'package:tripee/app/core/design/themes.dart';
import 'package:tripee/app/data/models/category_payment_model.dart';

class CategoryPayment extends StatelessWidget {
  final CategoryPaymentModel categoryPaymentModel;

  const CategoryPayment({super.key, required this.categoryPaymentModel});

  @override
  Widget build(BuildContext context) {
    return Text(categoryPaymentModel.name,
        style: Apptheme.ligthTheme.textTheme.bodySmall);
  }
}
