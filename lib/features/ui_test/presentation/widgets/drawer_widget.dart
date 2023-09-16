import 'package:flutter/material.dart';
import 'package:two_f_demo/features/sign_up/data/models/user_model.dart';

class DrawerScreen extends StatelessWidget {
  const DrawerScreen({super.key, required this.user});
  final UserModel user;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width / 1.6,
      child: Drawer(
        child: Container(
          decoration: const BoxDecoration(
            color: Color(0xffEFEFEF),
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                DrawerHeader(
                  decoration: const BoxDecoration(color: Color(0xffEFEFEF)),
                  padding: EdgeInsets.zero,
                  child: Stack(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 100, left: 5),
                        child: Text(user.email ?? ""),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 30, left: 20),
                        child: const CircleAvatar(
                          radius: 30,
                          backgroundImage: AssetImage(
                            "assets/images/logo.png",
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
