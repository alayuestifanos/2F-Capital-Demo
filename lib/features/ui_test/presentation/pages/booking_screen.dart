import 'package:flutter/material.dart';

class BookingScreen extends StatefulWidget {
  const BookingScreen({super.key});

  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
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
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.amber,
                  foregroundColor: Colors.black,
                  padding: const EdgeInsets.all(16),
                  textStyle: const TextStyle(fontSize: 20)),
              onPressed: () {},
              child: const Text('Refresh'),
            ),
          ),
          const Expanded(
              child: Center(
                  child: Text(
            "You don't have any booking yet",
            style: TextStyle(
                color: Color.fromARGB(255, 20, 9, 117),
                fontSize: 16,
                fontWeight: FontWeight.bold),
          )))
        ],
      ),
    );
  }
}
