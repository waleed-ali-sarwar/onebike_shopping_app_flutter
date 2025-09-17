import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:onebike_shopping_app_flutter/custom_widgets/custom_button.dart';
import '../custom_widgets/custom_buttondark.dart';
import '../custom_widgets/custom_card.dart';
import '../data/bike_data.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 115),
          child: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/bg.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    children: [
                      Text(
                        'Choose your Bike',
                        style: GoogleFonts.poppins(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                      const Spacer(),
                      CustomButton(icon: const Icon(Icons.search), onPressed: () {}),
                    ],
                  ),
                ),

                // Promo Banner + Category Buttons
                Column(
                  children: [
                    Container(
                      width: double.infinity,
                      height: 180,
                      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      decoration: BoxDecoration(
                        color: const Color(0xBD3B475F),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Stack(
                        children: [
                          Image.asset(
                            'assets/bike_01.png',
                            width: double.infinity,
                            height: double.infinity,
                            fit: BoxFit.cover,
                          ),
                          Positioned(
                            left: 16,
                            bottom: 16,
                            child: Text(
                              '30% Off',
                              style: GoogleFonts.poppins(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: const Color(0xFFCACACA),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CustomButton(title: 'All', onPressed: () {}),
                        CustomButtonDark(icon: const Icon(Icons.directions_bike), onPressed: () {}),
                        CustomButtonDark(icon: const Icon(Icons.add_road), onPressed: () {}),
                        CustomButtonDark(icon: const Icon(Icons.terrain), onPressed: () {}),
                        CustomButtonDark(icon: const Icon(Icons.safety_check), onPressed: () {}),
                      ],
                    ),
                  ],
                ),

                // Product Grid
                Padding(
                  padding: const EdgeInsets.all(1),
                  child: GridView.count(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio: 0.75,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    children: products.map((product) {
                      return CustomCard(
                        imagePath: product['image']!,
                        category: product['category']!,
                        title: product['title']!,
                        price: product['price']!,
                        onFavorite: () {
                          // Handle favorite logic here
                        },
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
