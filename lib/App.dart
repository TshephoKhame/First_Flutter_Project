import 'package:first_flutter_project/Login.dart';
import 'package:first_flutter_project/groups.dart';
import 'package:first_flutter_project/landing.dart';
import 'package:first_flutter_project/settings.dart';
import 'package:flutter/material.dart';

class mainApp extends StatefulWidget {
  const mainApp({super.key});

  @override
  State<mainApp> createState() => _mainAppState();
}

class _mainAppState extends State<mainApp> {
  int pageIndex = 0;
  List<Widget> pageList = <Widget>[
    const Landing(),
    const groups(),
    const Settings(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: null,
        actions: pageIndex == 2
            ? <Widget>[
                IconButton(
                  icon: const Icon(
                    Icons.exit_to_app_rounded,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (BuildContext context) => login(),
                      ),
                    );
                    // do something
                  },
                )
              ]
            : null,
      ),
      body: pageList[pageIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            label: "Home",
            icon: Icon(
              Icons.home,
            ),
          ),
          BottomNavigationBarItem(
            label: "Groups",
            icon: Icon(
              Icons.people_alt,
            ),
          ),
          BottomNavigationBarItem(
            label: "Settings",
            icon: Icon(
              Icons.settings,
            ),
          )
        ],
        backgroundColor: Color.fromARGB(255, 31, 28, 17),
        currentIndex: pageIndex,
        elevation: 0,
        fixedColor: Colors.white,
        onTap: (int index) {
          setState(() {
            pageIndex = index;
          });
        },
      ),
    );
  }
}
