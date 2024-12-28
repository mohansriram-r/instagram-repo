import 'package:flutter/material.dart';
import 'package:instagram_clone/models/user_model.dart';
import 'package:instagram_clone/providers/user_providers.dart';
import 'package:instagram_clone/utils/constants/colors.dart';
import 'package:instagram_clone/utils/constants/global_variavle.dart';
import 'package:instagram_clone/utils/theme/theme.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PageController _pageController = PageController();
  int _page = 0;

  navigationPage(int page) {
    _pageController.jumpToPage(page);
  }

  onPageChanged(int page) {
    setState(() {
      _page = page;
    });
  }

  @override
  void dispose() {
    super.dispose();
    _pageController;
  }
  // @override
  // void initState() {
  //   super.initState();
  //   addData();
  // }

  // addData() async {
  //   UserProviders userProviders = Provider.of(context, listen: false);
  //   await userProviders.refreshUser();
  // }

  @override
  Widget build(BuildContext context) {
    // UserM? user = Provider.of<UserProviders>(context).getUser;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: CThemeData.darkThemeData,
      home: Scaffold(
        backgroundColor: CColors.mobileBackgroundColor,
        body: PageView(
          physics: const NeverScrollableScrollPhysics(),
          controller: _pageController,
          onPageChanged: onPageChanged,
          children: GlobalVariable.pageItems,
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _page,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'search',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.add_box_outlined),
              label: 'post',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.notifications),
              label: 'notification',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'profile',
            )
          ],
          onTap: navigationPage,
        ),
      ),
    );
  }
}
