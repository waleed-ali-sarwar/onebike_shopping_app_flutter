import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'screens/home_screen.dart';
import 'screens/product_view_screen.dart';

import 'screens/cart_screen.dart';

class OneBikeShopping extends StatefulWidget {
  const OneBikeShopping({super.key});

  @override
  State<OneBikeShopping> createState() => _OneBikeShoppingState();
}

class _OneBikeShoppingState extends State<OneBikeShopping> {
  int _selectIndexScreen = 0;
  final GlobalKey<CurvedNavigationBarState> _navKey = GlobalKey();

  final List<Widget> pages = [
    HomeScreen(), // Bike
    ProductViewScreen(), // Map
    CartScreen(), // Cart
    HomeScreen(), // Profile
    HomeScreen(), // Docs
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'One Bike Shopping',
      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme(),
      ),
      home: Scaffold(
        backgroundColor: const Color(0xFF1B2230),
        body: IndexedStack(
          index: _selectIndexScreen,
          children: pages,
        ),
        bottomNavigationBar: CurvedNavigationBar(
          key: _navKey,
          index: _selectIndexScreen,
          height: 60.0,
          items: const [
            Icon(Icons.directions_bike, size: 30, color: Colors.white),
            Icon(Icons.map, size: 30, color: Colors.white),
            Icon(Icons.shopping_cart, size: 30, color: Colors.white),
            Icon(Icons.person, size: 30, color: Colors.white),
            Icon(Icons.description, size: 30, color: Colors.white),
          ],
          color: const Color(0xFF1B2230),
          buttonBackgroundColor: const Color(0xFF34C8E8),
          backgroundColor: Colors.transparent,
          animationCurve: Curves.easeInOut,
          animationDuration: const Duration(milliseconds: 500),
          onTap: (index) {
            setState(() {
              _selectIndexScreen = index;
            });
          },
        ),
      ),
    );
  }
}
