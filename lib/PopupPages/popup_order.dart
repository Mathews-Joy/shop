import 'package:flutter/material.dart';

// ignore: non_constant_identifier_names
show_order_details(context) {
  return showDialog(
      context: context,
      builder: (context) {
        return Center(
          child: Material(
            type: MaterialType.transparency,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              padding: EdgeInsets.all(15),
              width: 320,
              height: 420,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(2),
                    child: Image.asset(
                      "assets/pngwing.com.png",
                      width: 200,
                      height: 200,
                    ),
                  ),
                  SizedBox(
                    height: 3,
                  ),
                  Text("order details"),
                  Text("order details"),
                  Text("order details"),
                  SizedBox(
                    height: 20,
                    width: 40,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        height: 20,
                        width: 40,
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        child: Text("ConForm"),
                      ),
                      SizedBox(
                        height: 20,
                        width: 5,
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        child: Text("Cancel"),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      });
}
