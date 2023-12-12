// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:shop/ComponentsOfProductsStock/Basic_Textfield.dart';
import 'package:shop/ComponentsOfProductsStock/Stock_dropdown_searchbox.dart';

class ADD_Stock extends StatelessWidget {
  ADD_Stock({super.key});

  final stocknamecontroller = TextEditingController();
  final stockQuantitycontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green.shade200,
      body: SafeArea(
          child: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 90,
            ),
            const Text(
              "ADD STOCKS",
              style: TextStyle(color: Colors.black, fontSize: 20),
            ),
            const SizedBox(
              height: 0,
            ),
            Add_stocks_dropdown_searchbox(context, stockQuantitycontroller),
            // Add_stocks_searchbox(context, stocknamecontroller),
            const SizedBox(
              height: 00,
            ),
            BasicTextfield(
                controller: stockQuantitycontroller,
                hintText: "Enter Quantity"),

            const SizedBox(
              height: 30,
            ),
            SaveButton(onTap: () {})
          ],
        ),
      )),
    );
  }
}
