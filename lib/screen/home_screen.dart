import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:new_app_wfn/main.dart';
import 'package:new_app_wfn/utils/customShape.dart';
import '../fragment/home_fragment.dart';
import '../fragment/invoices_fragment.dart';
import '../fragment/offers_fragment.dart';
import '../fragment/profile_fragment.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;
  final fragment = [
    HomeFragment(contracts: utente.contracts),
    Profile(),
    Invoices(),
    Offers(),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        child: Scaffold(
      extendBodyBehindAppBar: false,
      appBar: AppBar(
        toolbarHeight: 100,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        flexibleSpace: ClipPath(
          clipper: AppBarShape(),
          child:Container(
            color: Colors.teal,
            child: Center(
              child: Image.asset(
              "./asset/logo.png",
              scale: 5,
          ),
            ),
          )
        ),
      ),
      body: fragment[currentIndex],
      bottomNavigationBar: 
      CurvedNavigationBar(
        index: currentIndex,
        height: 50.0,
        items: const <Widget>[

          Icon(Icons.home, size: 30, shadows: <Shadow>[Shadow(color: Colors.teal, blurRadius: 2.0)],),
          Icon(Icons.person, size: 30),
          Icon(Icons.payment, size: 30),
          Icon(Icons.local_offer_sharp, size: 30),
          
        ],
        color: Colors.white,
        buttonBackgroundColor: Colors.white,
        backgroundColor: Colors.teal,
        animationCurve: Curves.easeIn,
        animationDuration: const Duration(milliseconds: 300),
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        letIndexChange: (index) => true,
      ),
    ));
  }
}
