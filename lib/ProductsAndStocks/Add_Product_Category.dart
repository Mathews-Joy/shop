// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:shop/ComponentsOfProductsStock/Basic_Textfield.dart';

class Add_product_category extends StatelessWidget {
  Add_product_category({super.key});
  final categorynamecontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green.shade200,
      body: SafeArea(
          child: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 100,
            ),
            const Text(
              "ADD CATEGORY",
              style: TextStyle(color: Colors.black, fontSize: 20),
            ),
            const SizedBox(
              height: 50,
            ),
            BasicTextfield(
                controller: categorynamecontroller, hintText: "**********"),
            const SizedBox(
              height: 50,
            ),
            SaveButton(onTap: () {})
          ],
        ),
      )),
    );
  }
}
