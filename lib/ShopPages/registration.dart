// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, unnecessary_new

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cross_file/cross_file.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shop/ShopPages/LoginPage.dart';

class Shop_registration extends StatefulWidget {
  const Shop_registration({super.key});

  @override
  State<Shop_registration> createState() => _Shop_registrationState();
}

class _Shop_registrationState extends State<Shop_registration> {
  XFile? selectedImage;
  String? imageurl;
  final TextEditingController namecontroller = TextEditingController();
  final TextEditingController emailcontroller = TextEditingController();
  final TextEditingController passwordcontroller = TextEditingController();
  final TextEditingController conformpasswordcontroller =
      TextEditingController();
  final TextEditingController phonecontroller = TextEditingController();
  final TextEditingController placecontroller = TextEditingController();
  final TextEditingController addresscontroller = TextEditingController();
  final formkey = GlobalKey<FormState>();
  Future<void> _pickImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        selectedImage = XFile(pickedFile.path);
      });
    }
  }

  Future<void> registershop() async {
    if (passwordcontroller.text == conformpasswordcontroller.text) {
      print("helo");
      {
        print("object");
        try {
          final FirebaseAuth auth = FirebaseAuth.instance;
          final FirebaseStorage storage = FirebaseStorage.instance;
          final FirebaseFirestore firestore = FirebaseFirestore.instance;

          final UserCredential userCredential =
              await auth.createUserWithEmailAndPassword(
                  email: emailcontroller.text.trim(),
                  password: passwordcontroller.text.trim());

          final User? user = userCredential.user;
          if (user != null) {
            Fluttertoast.showToast(
              msg: 'Registration successfull',
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              backgroundColor: Colors.green,
              textColor: Colors.white,
            );

            final String userId = user.uid;

            if (selectedImage != null) {
              final Reference ref =
                  storage.ref().child('user_profile_images/$userId.jpg');
              await ref.putFile(File(selectedImage!.path));
              final _imageUrl = await ref.getDownloadURL();
              setState(() {
                imageurl = _imageUrl;
              });
            }

            await firestore.collection('users').doc(userId).set({
              'name': namecontroller.text,
              'email': emailcontroller.text,
              'password': passwordcontroller,
              'phone': phonecontroller,
              'address': addresscontroller,
              'profileImageUrl': imageurl,
              'nextAppointment': '',
              'previousAppointment': '',
            });

            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => LoginPage()),
            );
          }
        } catch (e) {
          // Handle registration failure and show an error toast.
          Fluttertoast.showToast(
            msg: 'Error registering user: $e',
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            backgroundColor: Colors.red,
            textColor: Colors.white,
          );
          print('Error registering user: $e');
        }
      }
    }
    //  else {
    //   Fluttertoast.showToast(
    //     msg: 'Please make sure your password matchs',
    //     toastLength: Toast.LENGTH_SHORT,
    //     gravity: ToastGravity.BOTTOM,
    //     backgroundColor: Colors.red,
    //     textColor: Colors.white,
    //   );
    // }
  }

  // var isOBsecure=true.obs;
  // validateEmail() {}
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 90,
                  ),
                  Icon(
                    Icons.shopping_cart_rounded,
                    size: 60,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Lets Go..🤩🤩",
                    style: GoogleFonts.bebasNeue(fontSize: 35),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Register yor shop",
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  GestureDetector(
                    onTap: _pickImage,
                    child: Stack(
                      children: [
                        CircleAvatar(
                          radius: 30,
                          backgroundColor: const Color(0xff4c505b),
                          backgroundImage: selectedImage != null
                              ? FileImage(File(selectedImage!.path))
                              : imageurl != null
                                  ? NetworkImage(imageurl!)
                                  : const AssetImage('assets/anonymous.jpg')
                                      as ImageProvider,
                          child: selectedImage == null && imageurl == null
                              ? const Icon(
                                  Icons.add,
                                  size: 30,
                                  color: Colors.white,
                                )
                              : null,
                        ),
                        if (selectedImage != null || imageurl != null)
                          const Positioned(
                            bottom: 0,
                            right: 0,
                            child: CircleAvatar(
                              backgroundColor: Colors.white,
                              radius: 18,
                              child: Icon(
                                Icons.edit,
                                size: 18,
                                color: Colors.black,
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          border: Border.all(color: Colors.white)),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: TextField(
                          decoration: InputDecoration(
                              border: InputBorder.none, hintText: "Name"),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          border: Border.all(color: Colors.white)),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: TextField(
                          decoration: InputDecoration(
                              border: InputBorder.none, hintText: "Email "),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          border: Border.all(color: Colors.white)),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: TextField(
                          decoration: InputDecoration(
                              border: InputBorder.none, hintText: "Phone"),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          border: Border.all(color: Colors.white)),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: TextField(
                          decoration: InputDecoration(
                              border: InputBorder.none, hintText: "Address "),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          border: Border.all(color: Colors.white)),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: TextField(
                          decoration: InputDecoration(
                              border: InputBorder.none, hintText: "Place "),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          border: Border.all(color: Colors.white)),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: TextField(
                          obscureText: true,
                          decoration: InputDecoration(
                              border: InputBorder.none, hintText: "Password"),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          border: Border.all(color: Colors.white)),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: TextField(
                          obscureText: true,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Conform Password"),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Container(
                      padding: EdgeInsets.all(25),
                      decoration: BoxDecoration(
                          color: Colors.deepPurple,
                          borderRadius: BorderRadius.circular(22)),
                      child: new GestureDetector(
                        onTap: registershop,
                        child: new Text(
                          "SIGN UP",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.center,
                  //   children: [
                  //     Text("Not a member ? "),
                  //   ],
                  // )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
