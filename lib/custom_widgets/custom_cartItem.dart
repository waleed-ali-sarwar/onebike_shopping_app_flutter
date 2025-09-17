import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class CustomCartItem extends StatefulWidget {
  final String title;
  final int price;
  final int quantity;
  final String productImage;

  const CustomCartItem({
    super.key,
    required this.title,
    required this.price,
    required this.quantity,
    required this.productImage,
  });

  @override
  State<CustomCartItem> createState() => _CustomCartItemState();
}

class _CustomCartItemState extends State<CustomCartItem> {
  late int currentQuantity;

  @override
  void initState() {
    super.initState();
    currentQuantity = widget.quantity;
  }

  void incrementQuantity() {
    setState(() {
      currentQuantity++;
    });
  }

  void decrementQuantity() {
    setState(() {
      if (currentQuantity > 1) currentQuantity--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Product Image
                Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    gradient: LinearGradient(
                      colors: [Color(0xFF363E51), Color(0xFF4C5770)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                  child: Image.asset(widget.productImage, fit: BoxFit.fill),
                ),

                // Title & Price
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.title,
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const Gap(25),
                    Text(
                      '\$${widget.price}',
                      style: TextStyle(
                        color: Color(0xFF3C9EEA),
                        fontWeight: FontWeight.w100,
                      ),
                    ),
                  ],
                ),

                const Gap(25),

                // Quantity Controls
                Row(
                  children: [
                    // Minus Button
                    Container(
                      width: 25,
                      height: 25,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: IconButton(
                        icon: Icon(Icons.remove, color: Colors.white),
                        onPressed: decrementQuantity,
                        padding: EdgeInsets.zero,
                        iconSize: 18,
                      ),
                    ),
                    const Gap(8.0),
                    Text(
                      currentQuantity.toString(),
                      style: TextStyle(color: Colors.white),
                    ),
                    const Gap(8.0),
                    // Plus Button
                    Container(
                      width: 25,
                      height: 25,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: IconButton(
                        icon: Icon(Icons.add, color: Colors.white),
                        onPressed: incrementQuantity,
                        padding: EdgeInsets.zero,
                        iconSize: 18,
                      ),
                    ),
                  ],
                ),
              ],
            ),
        ),
        const Divider(color: Color(0xFF363E51),)
      ],
    );
  }
}
