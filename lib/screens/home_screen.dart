import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:pandawa/screens/about_screen.dart';
import 'package:pandawa/screens/search_screen.dart';
import 'package:pandawa/screens/wayang_screen.dart';
import 'package:pandawa/models/wayang.dart';

class HomeScreen extends StatelessWidget {

  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        if (constraints.maxWidth > 800) {
          return const WebScreen();
        }
        else {
          return const MobileScreen();
        }
      },
    );
  }
}

class MobileScreen extends StatefulWidget {
  const MobileScreen({Key? key}) : super(key: key);

  @override
  _MobileScreenState createState() => _MobileScreenState();
}

class _MobileScreenState extends State<MobileScreen> {
  int _index = 0;
  int _selectedIndex = 0;
  final PageController pageController = PageController(viewportFraction: 0.7);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    'Ensiklopedia Wayang',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: QuickSearchScreen()
            ),
            Expanded(
              child: Scrollbar(
                thumbVisibility: true,
                hoverThickness: 30.0,
                controller:pageController,
                child: SizedBox(
                  height: MediaQuery.of(context).size.height - 300,
                  child: PageView.builder(
                    itemCount: wayangList.length,
                    controller: pageController,
                    onPageChanged: (int index) => setState(() => _index = index),
                    itemBuilder: (context, i) {
                      return Transform.scale(
                        scale: i == _index ? 1.0 : 0.9,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => WayangScreen(
                                  wayang: wayangList[i],
                                )
                              )
                            );
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                height: MediaQuery.of(context).size.height - 400,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  image: DecorationImage(
                                    fit: BoxFit.fitHeight,
                                    image: AssetImage(wayangList[i].image),
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.3),
                                      spreadRadius: 2,
                                      blurRadius: 2,
                                      offset: const Offset(2, 3),
                                    )
                                  ]
                                ),
                              ),
                              Text(
                                wayangList[i].name,
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }
                  ),
                ),
              ),
            ),
          ],
        ),
        bottomNavigationBar: Container(
          padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
          decoration: BoxDecoration(
            color: Colors.white54,
            borderRadius: BorderRadius.circular(30),
          ),
          child: GNav(
            gap: 15,
            activeColor: Colors.blue,
            iconSize: 25,
            padding: const EdgeInsets.all(4),
            duration: const Duration(milliseconds: 300),
            tabBackgroundColor: Colors.white,
            tabs: [
              const GButton(
                icon: Icons.home,
                text: 'Beranda',
              ),
              GButton(
                icon: Icons.info,
                text: 'Tentang',
                onPressed: () {
                  Navigator.of(context)
                    .pushReplacement(MaterialPageRoute(builder: (_) => const AboutScreen()));
                }
              )
            ],
            selectedIndex: _selectedIndex,
            onTabChange: (index) {
              setState(() {
                _selectedIndex = index;
              });
            },
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }
}

class WebScreen extends StatefulWidget {
  const WebScreen({Key? key}) : super(key: key);

  @override
  _WebScreenState createState() => _WebScreenState();
}

class _WebScreenState extends State<WebScreen> {
  int _index = 0;
  int _selectedIndex = 0;
  final PageController pageController = PageController(viewportFraction: 0.2);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    'Ensiklopedia Wayang',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 35,
                    ),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: QuickSearchScreen()
            ),
            Scrollbar(
              thumbVisibility: true,
              hoverThickness: 30.0,
              controller:pageController,
              child: SizedBox(
                height: MediaQuery.of(context).size.height - 250,
                child: PageView.builder(
                  itemCount: wayangList.length,
                  controller: pageController,
                  onPageChanged: (int index) => setState(() => _index = index),
                  itemBuilder: (context, i) {
                    return Transform.scale(
                      scale: i == _index ? 1.0 : 0.9,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => WayangScreen(
                                wayang: wayangList[i],
                              )
                            )
                          );
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              height: MediaQuery.of(context).size.height - 350,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                image: DecorationImage(
                                  fit: BoxFit.fitHeight,
                                  image: AssetImage(wayangList[i].image),
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.3),
                                    spreadRadius: 2,
                                    blurRadius: 2,
                                    offset: const Offset(2, 3),
                                  )
                                ]
                              ),
                            ),
                            Text(
                              wayangList[i].name,
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }
                ),
              ),
            ),
          ],
        ),
        bottomNavigationBar: Container(
          padding: const EdgeInsets.symmetric(horizontal: 300, vertical: 10),
          decoration: BoxDecoration(
            color: Colors.white54,
            borderRadius: BorderRadius.circular(30),
          ),
          child: GNav(
            gap: 15,
            activeColor: Colors.blue,
            iconSize: 25,
            padding: const EdgeInsets.all(4),
            duration: const Duration(milliseconds: 300),
            tabBackgroundColor: Colors.white,
            tabs: [
              const GButton(
                icon: Icons.home,
                text: 'Beranda',
              ),
              GButton(
                icon: Icons.info,
                text: 'Tentang',
                onPressed: () {
                  Navigator.of(context)
                    .pushReplacement(MaterialPageRoute(builder: (_) => const AboutScreen()));
                }
              )
            ],
            selectedIndex: _selectedIndex,
            onTabChange: (index) {
              setState(() {
                _selectedIndex = index;
              });
            },
          ),
        ),
      ),
    );
  }
}