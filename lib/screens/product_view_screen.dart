import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:onebike_shopping_app_flutter/custom_widgets/custom_button.dart';
import '../custom_widgets/custom_appbar.dart';

class ProductViewScreen extends StatefulWidget {
  const ProductViewScreen({super.key});
  @override
  State<ProductViewScreen> createState() {
    return _ProductViewScreenState();
  }
}

class _ProductViewScreenState extends State<ProductViewScreen> {
  int _currentIndex = 0;
  List<String> images = [
    'assets/bike_01.png',
    'assets/b2.png',
    'assets/b3.png',
  ];
  final CarouselOptions options = CarouselOptions(
    height: 200,
    autoPlay: true,
    enlargeCenterPage: true,
    viewportFraction: 0.9,
    onPageChanged: (index, reason) {
      // We'll update _currentIndex in setState later
    },
  );
  late final screenHeight = MediaQuery.of(context).size.height;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/bg.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            CustomAppbar(
              icon: const Icon(
                Icons.arrow_back_ios_new,
                color: Colors.white,
                size: 24,
              ),
              text_title: 'PEUGEOT - LR01',
              onPressed: () {
                setState(() {

                });
              },
            ),

            // Carousel
            CarouselSlider(
              items: images
                  .map(
                    (item) => Container(
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        image: DecorationImage(
                          image: AssetImage(item),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  )
                  .toList(),
              options: options.copyWith(
                onPageChanged: (index, reason) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
              ),
            ),

            const Gap(10),

            // Dot Indicators
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: images.asMap().entries.map((entry) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      _currentIndex = entry.key;
                    });
                  },
                  child: Container(
                    width: 8.0,
                    height: 8.0,
                    margin: const EdgeInsets.symmetric(horizontal: 4.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: _currentIndex == entry.key
                          ? Colors.white
                          : Colors.white.withOpacity(0.4),
                    ),
                  ),
                );
              }).toList(),
            ),
            const Gap(20),
            Container(
              height: screenHeight * 0.55,
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [
                    Color(0xFF353F54), // Start color
                    Color(0xFF222834), // End color
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Column(
                children: [
                  const Gap(5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF323B4F),
                          foregroundColor: Colors.white,
                          elevation: 2,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        onPressed: () {},
                        child: const Text(
                          "Description",
                          style: TextStyle(color: Color(0xFF3CA4EB)),
                        ),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF323B4F),
                          foregroundColor: Colors.white,
                          elevation: 2,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        onPressed: () {},
                        child: const Text(
                          "Specification",
                          style: TextStyle(color: Color(0xFF3CA4EB)),
                        ),
                      ),
                    ],
                  ),
                  // content for product

                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('PEUGEOT - LR01',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 17.0
                          ),
                        ),
                        const Gap(10),
                        const Text('The LR01 uses the same '
                            'design as the most iconic bikes '
                            'from PEUGEOT Cycles\' 130-year '
                            'history and combines it with agile, '
                            'dynamic performance that\'s perfectly '
                            'suited to navigating today\'s cities. '
                            'As well as a lugged steel frame and iconic '
                            'PEUGEOT black-and-white chequer design, this city bike'
                            ' also features a 16-speed Shimano Claris drivetrain.',
                          style: TextStyle(color: Colors.white,fontSize: 15.0,fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                  ),
                  const Gap(12),
                  Container(
                    height: screenHeight * 0.09,
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [
                          Color(0xFF1C222E), // Start color
                          Color(0xFF1C222E), // End color
                      ]
                      ),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                        ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                           const Text('\$${1999.99}',style: const TextStyle(color: Color(0xFF3D9CEA))),
                        CustomButton(title: 'Add to Cart', onPressed: (){})
                      ]
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
