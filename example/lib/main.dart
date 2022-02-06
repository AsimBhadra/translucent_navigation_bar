import 'package:flutter/material.dart';
import 'package:translucent_navigation_bar/translucent_navigation_bar.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int selectedIndex = 0;

  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      bottomNavigationBar: TranslucentNavigationBar(
        mainTranslucentNavigationBarItem: TranslucentNavigationBarItem(
          iconData: PhosphorIcons.plus,
        ),
        onTap: (value) {
          setState(() {
            selectedIndex = value;
          });
          _pageController.animateToPage(
            selectedIndex,
            duration: const Duration(milliseconds:750),
            curve: Curves.bounceIn,
          );
        },
        onMainIconTap: () {
          showDialog(
            context: context,
            builder: (context) => const AlertDialog(
              title: Text('Main Icon pressed'),
            ),
          );
        },
        selectedIndex: selectedIndex,
        mainIconBackgroundColor: const Color(0xff0066ff),
        mainIconColor: Colors.white,
        items: [
          TranslucentNavigationBarItem(
            iconData: PhosphorIcons.houseSimple,
          ),
          TranslucentNavigationBarItem(
            iconData: PhosphorIcons.chat,
          ),
          TranslucentNavigationBarItem(
            iconData: PhosphorIcons.gear,
          ),
          TranslucentNavigationBarItem(
            iconData: PhosphorIcons.user,
          ),
        ],
      ),
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: _pageController,
        children: [
          Container(
            color: Colors.red,
            child: const Center(
              child: Text('Page 1'),
            ),
          ),
          Container(
            color: Colors.blue,
            child: const Center(
              child: Text('Page 2'),
            ),
          ),
          Container(
            color: Colors.green,
            child: const Center(
              child: Text('Page 3'),
            ),
          ),
          Container(
            color: Colors.yellow,
            child: const Center(
              child: Text('Page 4'),
            ),
          ),
        ],
      ),
    );
  }
}
