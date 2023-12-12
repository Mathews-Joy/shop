import 'package:flutter/material.dart';
import 'package:shop/PopupPages/popup_order.dart';

class Manage_Stocks extends StatelessWidget {
  const Manage_Stocks({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple.shade100,
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 100),
            Text(
              "ALL Stocks",
              style: TextStyle(color: Colors.black, fontSize: 20),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(14),
                child: ListView.builder(
                  itemCount: 2,
                  padding: EdgeInsets.all(9),
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.all(12),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(8),
                        ),
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
                              showMenu(
                                context: context,
                                position: RelativeRect.fromLTRB(100, 100, 0, 0),
                                items: [
                                  PopupMenuItem(
                                    child: Center(child: Text('Option 1')),
                                    value: 'option_1',
                                  ),
                                  // PopupMenuItem(
                                  //   child: Text('Option 2'),
                                  //   value: 'option_2',
                                  // ),
                                  // Add more PopupMenuItems as needed
                                ],
                              );
                            },
                            child: Text(
                              "view more",
                              style: TextStyle(fontSize: 12),
                            ),
                          ),
                          trailing: Column(
                            children: [
                              Wrap(
                                spacing: 0,
                                children: [
                                  IconButton(
                                    icon: Icon(
                                      Icons.add_task_outlined,
                                      size: 31,
                                    ),
                                    onPressed: () {
                                      show_order_details(context);
                                    },
                                    color: Colors.green.shade900,
                                  ),
                                  IconButton(
                                    icon: Icon(
                                      Icons.cancel_sharp,
                                      size: 31,
                                    ),
                                    onPressed: () {
                                      show_order_details(context);
                                    },
                                    color: Colors.red,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
