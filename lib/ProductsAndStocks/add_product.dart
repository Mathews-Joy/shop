import 'package:flutter/material.dart';

import '../ComponentsOfProductsStock/Basic_Textfield.dart';

class AddProduct extends StatelessWidget {
  AddProduct({super.key});

  final productnamecontroller = TextEditingController();
  final productcategorycontroller = TextEditingController();
  final productflavourcontroller = TextEditingController();
  final productpricecontroller = TextEditingController();

  void addproduct() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              const Icon(
                Icons.lock,
                size: 100,
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "Add product",
                style: TextStyle(color: Colors.grey[7000], fontSize: 20),
              ),
              const SizedBox(
                height: 25,
              ),
              BasicTextfield(
                  controller: productnamecontroller, hintText: 'Product Name'),
              const SizedBox(
                height: 10,
              ),
              BasicTextfield(
                  controller: productcategorycontroller,
                  hintText: 'Product category'),
              const SizedBox(
                height: 10,
              ),
              BasicTextfield(
                  controller: productflavourcontroller,
                  hintText: 'Product flavour'),
              const SizedBox(
                height: 10,
              ),
              BasicTextfield(
                  controller: productpricecontroller,
                  hintText: 'Product price'),
              const SizedBox(
                height: 10,
              ),
              SaveButton(onTap: addproduct),
              const SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
