import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../sign_up/data/models/user_model.dart';
import './pages.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.user});
  final UserModel user;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  static final List<Widget> _widgetOptions = [
    const SearchScreen(),
    const BookingScreen(),
    const NotificationScreen(),
    const SettingsScreen()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   systemOverlayStyle: const SystemUiOverlayStyle(
      //     statusBarColor: Color(0xff1e1c67),
      //     statusBarIconBrightness: Brightness.dark,
      //     statusBarBrightness: Brightness.light,
      //   ),
      //   backgroundColor: const Color(0xff1e1c67),
      // ),
      // appBar: CommonWidgets.getAppBar(
      //   leading: Builder(
      //     builder: (BuildContext context) {
      //       return Container(
      //         margin: const EdgeInsets.only(right: 10),
      //         child: IconButton(
      //           icon: const Icon(
      //             Icons.menu,
      //             color: Colors.black,
      //           ),
      //           onPressed: () {
      //             print("Button is pressed");
      //             Scaffold.of(context).openDrawer();
      //           },
      //           tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
      //         ),
      //       );
      //     },
      //   ),
      //   actions: [
      //     Container(
      //       margin: const EdgeInsets.only(right: 10),
      //       child: PopupMenuButton(
      //           onSelected: (value) async {
      //             switch (value) {
      //               case 1:
      //                 await SharedPreferencesHelper.removeUserFromPrefs(
      //                   SharedPreferencesHelper.userKey,
      //                   sl<SharedPreferences>(),
      //                 );
      //                 if (context.mounted) {
      //                   Navigator.pushNamed(context, Login.routeName);
      //                 }

      //                 break;
      //               case 2:
      //                 break;
      //             }
      //           },
      //           offset: const Offset(5, 50),
      //           shape: RoundedRectangleBorder(
      //               borderRadius: BorderRadius.circular(10)),
      //           color: const Color(0xff757575),
      //           elevation: 10,
      //           icon: const Icon(
      //             Icons.person,
      //             size: 40,
      //             color: Colors.blueGrey,
      //           ),
      //           itemBuilder: (context) {
      //             return [
      //               const PopupMenuItem(
      //                 value: 1,
      //                 child: Text(
      //                   "logout",
      //                   textAlign: TextAlign.center,
      //                   style: TextStyle(color: Colors.white),
      //                 ),
      //               ),
      //               const PopupMenuItem(
      //                 value: 2,
      //                 child: Text(
      //                   "my Account",
      //                   textAlign: TextAlign.center,
      //                   style: TextStyle(color: Colors.white),
      //                 ),
      //               ),
      //             ];
      //           }),
      //     )
      //   ],
      // ),
      // drawer: DrawerScreen(user: widget.user),
      body: Container(
        // padding: const EdgeInsets.symmetric(
        //   vertical: 10,
        // ),
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: 'Booking',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notifications',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
        currentIndex: _selectedIndex,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: const Color.fromARGB(255, 20, 9, 117),
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
        showUnselectedLabels: true,
      ),
    );
  }
}
