import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:pandawa/models/wayang.dart';
import 'package:pandawa/screens/about_screen.dart';
import 'package:pandawa/screens/home_screen.dart';

class WayangScreen extends StatefulWidget {
  final Wayang wayang;

  const WayangScreen({Key? key, required this.wayang}) : super(key: key);

  @override
  _WayangScreenState createState() => _WayangScreenState();
}

class _WayangScreenState extends State<WayangScreen> {
  final _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        if (constraints.maxWidth > 1000) {
          return SafeArea(
            child: Scaffold(
              body: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                   width: MediaQuery.of(context).size.width /2 - 250,
                   height: MediaQuery.of(context).size.height,
                     child: Center(
                       child: Stack(
                        children: [
                          Container (
                            height: MediaQuery.of(context).size.height - 300,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              image: DecorationImage(
                                fit: BoxFit.fitHeight,
                                image: AssetImage(widget.wayang.image),
                              ),
                            ),
                          ),
                          Positioned (
                            top: 20,
                            right: 10,
                            left: 10,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CircleAvatar(
                                  radius: 20,
                                  backgroundColor: Colors.white,
                                  child: IconButton(
                                    icon: const Icon(
                                      Icons.arrow_back,
                                      color: Colors.black,
                                    ),
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                  ),
                                ),
                              ],
                            )
                          ),
                          Positioned(
                            bottom: 0,
                            right: 10,
                            child: Container (
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.3),
                                    spreadRadius: 2,
                                    blurRadius: 2,
                                    offset: const Offset(0, 3),
                                  )
                                ]
                              ),
                              transform: Matrix4.translationValues(0, 20, 0),
                              child: const CircleAvatar(
                                radius: 25,
                                backgroundColor: Colors.white,
                                child: MarkButton()
                              ),
                            )
                          ),
                        ],
                       ),
                     ),
                  ),
                  Scrollbar(
                    thumbVisibility: true,
                    controller: _scrollController,
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width / 2 + 225,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 30,
                            ),
                            Text(
                              widget.wayang.name,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 32,
                              ),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            Expanded(
                              flex: 1,
                              child: SingleChildScrollView(
                                scrollDirection: Axis.vertical,//.horizontal
                                child: Text(
                                  widget.wayang.description,
                                  textAlign: TextAlign.justify,
                                  style: const TextStyle(
                                    fontSize: 17,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              bottomNavigationBar: const ResponsiveNavBar()
            ),
          );
        }
        else {
          return SafeArea(
            child: Scaffold(
              body: ListView(
                children: [
                  Stack(
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height / 2 + 50,
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20),
                          ),
                          image: DecorationImage(
                            fit: BoxFit.fitHeight,
                            image: AssetImage(widget.wayang.image),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 20,
                        right: 10,
                        left: 10,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CircleAvatar(
                              radius: 20,
                              backgroundColor: Colors.white,
                              child: IconButton(
                                icon: const Icon(
                                  Icons.arrow_back,
                                  color: Colors.black,
                                ),
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                              ),
                            ),
                          ],
                        )
                      ),
                      Positioned(
                        bottom: 0,
                        right: 10,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.3),
                                spreadRadius: 2,
                                blurRadius: 2,
                                offset: const Offset(0, 3),
                              )
                            ]
                          ),
                          transform: Matrix4.translationValues(0, 20, 0),
                          child: const CircleAvatar(
                            radius: 25,
                            backgroundColor: Colors.white,
                            child: MarkButton()
                          ),
                        )
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          widget.wayang.name,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 32,
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Text(
                          widget.wayang.description,
                          textAlign: TextAlign.justify,
                          style: const TextStyle(
                            fontSize: 17,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              bottomNavigationBar: const ResponsiveNavBar()
            ),
          );
        }
      },
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}

class MarkButton extends StatefulWidget {
  const MarkButton({Key? key}) : super(key: key);

  @override
  _MarkButtonState createState() => _MarkButtonState();
}

class _MarkButtonState extends State<MarkButton> {
  bool isMarked = false;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        isMarked ? Icons.star : Icons.star_border,
        color: Colors.black,
      ),
      onPressed: () {
        setState(() {
          isMarked = !isMarked;
        });
      },
    );
  }
}
class ResponsiveNavBar extends StatefulWidget {
  const ResponsiveNavBar({Key? key}) : super(key: key);

  @override
  _ResponsiveNavBarState createState() => _ResponsiveNavBarState();
}

class _ResponsiveNavBarState extends State<ResponsiveNavBar> {

  int _selectedIndex = 0;

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
              // ignore: prefer_const_literals_to_create_immutables
              tabs: [
                GButton(
                  icon: Icons.home,
                  text: 'Beranda',
                  onPressed: () {
                    Navigator.of(context)
                      .pushReplacement(MaterialPageRoute(builder: (_) => const HomeScreen()));
                  }
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
          );
        }
      },
    );
  }
}