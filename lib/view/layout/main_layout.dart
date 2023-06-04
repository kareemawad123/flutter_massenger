import 'package:first_day/view/Chats/chatPage.dart';
import 'package:first_day/view/albums/albums.dart';
import 'package:first_day/view/users/users.dart';
import 'package:flutter/material.dart';

class MainLayOut extends StatefulWidget {
  const MainLayOut({Key? key}) : super(key: key);

  @override
  State<MainLayOut> createState() => _MainLayOutState();
}

class _MainLayOutState extends State<MainLayOut> {
  int _currentIndex = 0;
  List<Widget> pages = [
    const ChatPage(),
    const UsersPage(),
    const AlbumsPage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.chat), label: 'Chats'),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle), label: 'Account'),
          BottomNavigationBarItem(
              icon: Icon(Icons.album), label: 'Albums'),
        ],
        onTap: (index) {
          _currentIndex = index;
          setState(() {});
        },
      ),
      body: Padding(
        padding: const EdgeInsets.only(right: 10, top: 5, bottom: 0, left: 5),
        child: pages[_currentIndex],
      ),
    );
  }
}
