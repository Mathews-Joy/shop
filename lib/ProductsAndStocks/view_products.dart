import 'package:flutter/material.dart';
import 'package:shop/PopupPages/popup_view_products.dart';

class ViewProducts extends StatelessWidget {
  const ViewProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber.shade200,
      body: SafeArea(
          child: Column(
        children: [
          const SizedBox(
            height: 100,
          ),
          const Text(
            "All Products",
            style: TextStyle(color: Colors.black, fontSize: 20),
          ),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.all(14),
            child: ListView.builder(
                itemCount: 2,
                padding: const EdgeInsets.all(12),
                itemBuilder: ((context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(12),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(8)),
                      child: ListTile(
                        leading: Image.asset(
                          "assets/pngwing.com.png",
                          height: 36,
                        ),
                        title: const Text(
                          "Name",
                          style: TextStyle(fontSize: 15),
                        ),
                        subtitle: GestureDetector(
                          // Show the popup menu on "view more" tap
                          onTap: () {
                            show_product_details(context);
                            // showMenu(
                            //   context: context,
                            //   position: RelativeRect.fromLTRB(100, 100, 100, 0),
                            //   items: [
                            //     PopupMenuItem(
                            //       child: Center(child: Text('Option 1')),
                            //       value: 'option_1',
                            //     ),
                            //   ],
                            // );
                          },
                          child: const Text(
                            "view more",
                            style: TextStyle(fontSize: 12),
                          ),
                        ),
                        trailing: IconButton(
                            icon: const Icon(Icons.cancel), onPressed: () {}),
                      ),
                    ),
                  );
                })),
          )),
        ],
      )),
    );
  }
}
