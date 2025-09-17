import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:onebike_shopping_app_flutter/custom_widgets/custom_button.dart';
import 'package:swipeable_button_view/swipeable_button_view.dart';
import '../custom_widgets/custom_cartItem.dart';

import '../custom_widgets/custom_appbar.dart';
import '../data/bike_data.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() {
    return _CartScreenState();
  }
}

class _CartScreenState extends State<CartScreen> {
  late final screenHeight = MediaQuery.of(context).size.height;
  late final screenWidth = MediaQuery.of(context).size.width;
  bool isFinished = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF191E29),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomAppbar(
              icon: const Icon(
                Icons.arrow_back_ios_new,
                color: Colors.white,
                size: 24,
              ),
              text_title: 'My Shopping Cart',
              onPressed: () {},
            ),
            // Cart Item
            SizedBox(
              width: double.infinity,
              height: screenHeight * 0.43,
              child: ListView.builder(
                itemCount: cart.length,
                itemBuilder: (context, index) {
                  return CustomCartItem(
                    title: cart[index]['title'],
                    price: cart[index]['price'],
                    quantity: cart[index]['quantity'],
                    productImage: cart[index]['productImage'],
                  );
                },
              ),
            ),
            // Coupon part as well as totals
            const Gap(20),
            Center(
              child: Text(
                'Your cart qualifies for free shipping',
                style: TextStyle(color: Color(0xFFDADADA)),
              ),
            ),
            const Gap(20),
            Container(
              width: double.infinity,
              height: 50,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFF242C3B), Color(0xFF191E29)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.all(Radius.circular(16)),
              ),
              margin: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: TextEditingController(),
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        hintStyle: TextStyle(color: Color(0xFFDADADA)),
                        hintText: 'Bike30',
                        contentPadding: EdgeInsets.symmetric(horizontal: 16),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  CustomButton(onPressed: () {}, title: 'Apply'),
                ],
              ),
            ),
            // Totals
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Subtotal:',
                        style: TextStyle(color: Color(0xFFD1D1D1)),
                      ),
                      Text(
                        'Delivery Fee:',
                        style: TextStyle(color: Color(0xFFD1D1D1)),
                      ),
                      Text(
                        'Discount:',
                        style: TextStyle(color: Color(0xFFD1D1D1)),
                      ),
                      const Gap(20),
                      Text(
                        'Total:',
                        style: TextStyle(color: Color(0xFFD1D1D1)),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        '\$6119.99',
                        style: TextStyle(color: Color(0xFFD1D1D1)),
                      ),
                      Text('\$0', style: TextStyle(color: Color(0xFFD1D1D1))),
                      Text('30%', style: TextStyle(color: Color(0xFFD1D1D1))),
                      const Gap(20),
                      Text(
                        '\$4,283.99',
                        style: TextStyle(color: Color(0xFF38B8EA)),
                      ),
                    ],
                  ),
                ],
              ),
            ),
      Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 80),
          child: SwipeableButtonView(
            buttonText: "Checkout",
            buttonWidget: Icon(Icons.arrow_forward, color: Color(0xFF526C8F)),
            activeColor: Color(0xFF11161E),
            isFinished: isFinished,
            onWaitingProcess: () {
              Future.delayed(Duration(seconds: 1), () {
                setState(() {
                  isFinished = true; // onFinish triggers
                });
              });
            },
            onFinish: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("Checkout confirmed!")),
              );

              // Reset so it can be swiped again
              setState(() {
                isFinished = false;
              });
            },
          ),
        ),
      ),
            const Gap(20),
      ],
        ),
      ),
    );
  }
}
