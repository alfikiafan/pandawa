import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:pandawa/screens/home_screen.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 100,
            ),
            Image.asset(
              'assets/logo.png',
              height: 180,
            ),
            const Text(
              'Ensiklopedia Wayang\nVersi 0.7.0-beta',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black45,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            const SizedBox(
              height: 70,
            ),
            const Text(
              'Dibuat dengan ❤ oleh:\nAlfiki Afan',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black54,
                fontSize: 18,
              ),
            ),
            const SizedBox(
              height: 120,
            ),
          ],
        ),
      ),
      bottomNavigationBar: const ResponsiveNavBar()
    );
  }
}

class ResponsiveNavBar extends StatefulWidget {
  const ResponsiveNavBar({Key? key}) : super(key: key);

  @override
  _ResponsiveNavBarState createState() => _ResponsiveNavBarState();
}

class _ResponsiveNavBarState extends State<ResponsiveNavBar> {
  int _selectedIndex = 1;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        if (constraints.maxWidth > 800) {
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 300, vertical: 10),
            decoration: BoxDecoration(
              color: Colors.white54,
              borderRadius: BorderRadius.circular(30),
            ),
            child: GNav(
              gap: 10,
              activeColor: Colors.blue,
              iconSize: 25,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              duration: const Duration(milliseconds: 100),
              tabBackgroundColor: Colors.white,
              tabs: [
                GButton(
                  icon: Icons.home,
                  text: 'Beranda',
                  onPressed: () {
                    Navigator.of(context)
                      .pushReplacement(MaterialPageRoute(builder: (_) => const HomeScreen()));
                  }
                ),
                const GButton(
                  icon: Icons.info,
                  text: 'Tentang',
                ),
              ],
              selectedIndex: _selectedIndex,
              onTabChange: (index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
            ),
          );
        }
        else {
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
            decoration: BoxDecoration(
              color: Colors.white54,
              borderRadius: BorderRadius.circular(30),
            ),
            child: GNav(
              gap: 10,
              activeColor: Colors.blue,
              iconSize: 25,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              duration: const Duration(milliseconds: 100),
              tabBackgroundColor: Colors.white,
              tabs: [
                GButton(
                  icon: Icons.home,
                  text: 'Beranda',
                  onPressed: () {
                    Navigator.of(context)
                      .pushReplacement(MaterialPageRoute(builder: (_) => const HomeScreen()));
                  }
                ),
                const GButton(
                  icon: Icons.info,
                  text: 'Tentang',
                ),
              ],
              selectedIndex: _selectedIndex,
              onTabChange: (index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
            ),
          );
        }
      },
    );
  }
}