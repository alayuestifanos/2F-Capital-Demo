import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Stack(children: [
            Container(
              decoration: const BoxDecoration(
                color: Colors.transparent,
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage(
                    'assets/images/background.jpeg',
                  ),
                ),
              ),
              height: 350.0,
            ),
            Container(
              height: 350.0,
              decoration: BoxDecoration(
                  color: Colors.white,
                  gradient: LinearGradient(
                      begin: FractionalOffset.topCenter,
                      end: FractionalOffset.bottomCenter,
                      colors: [
                        const Color.fromARGB(255, 14, 6, 85).withOpacity(0.7),
                        const Color.fromARGB(255, 20, 9, 117).withOpacity(0.7),
                      ],
                      stops: const [
                        0.0,
                        1.0
                      ])),
            )
          ]),
          Expanded(
            child: ListView.separated(
              itemCount: 25,
              separatorBuilder: (BuildContext context, int index) =>
                  const Divider(),
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  leading: const Icon(
                    Icons.settings,
                    color: Color.fromARGB(255, 20, 9, 117),
                  ),
                  title: Text(
                    'item $index',
                    style: const TextStyle(
                        color: Color.fromARGB(255, 20, 9, 117),
                        fontSize: 26,
                        fontWeight: FontWeight.bold),
                  ),
                  trailing: const Icon(Icons.arrow_right_alt),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
