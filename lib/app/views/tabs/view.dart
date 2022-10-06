import 'package:flutter/material.dart';
import 'package:the_socials/app/app.dart';

class TabsView extends StatefulWidget {
  const TabsView({Key? key}) : super(key: key);

  @override
  State<TabsView> createState() => _TabsViewState();
}

class _TabsViewState extends State<TabsView> {
  int _currentIndex = 0;

  List<Widget> body = [
    HomeView(),
    FriendListView(),
    const AddPostView(),
  ];
  final _viewModel = TabsViewModel();

  @override
  void initState() {
    super.initState();
    _viewModel.addUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: body[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (int newIndex) {
          setState(() {
            _currentIndex = newIndex;
          });
        },
        items: const [
          BottomNavigationBarItem(
            label: 'Home',
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            label: 'FriendList',
            icon: Icon(Icons.accessibility_outlined),
          ),
          BottomNavigationBarItem(
            label: 'Add Post',
            icon: Icon(Icons.add_a_photo_outlined),
          ),
        ],
      ),
    );
  }
}
