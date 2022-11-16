import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartHead extends StatelessWidget {
  final List<dynamic> cartList;
  final VoidCallback buyItems;
  const CartHead({super.key, required this.cartList, required this.buyItems});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      alignment: Alignment.center,
      padding: const EdgeInsets.only(left: 20.0, right: 20.0),
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.black12)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text.rich(
            TextSpan(text: 'Total price: ', children: [
              TextSpan(
                  text: cartList
                      .fold(
                          0.00,
                          (value, item) =>
                              (value! as double) +
                              double.parse(item['basePrice']))
                      .toString())
            ]),
            style: const TextStyle(
                fontWeight: FontWeight.w600, color: Colors.white),
          ),
          const Spacer(),
          TextButton.icon(
            onPressed: buyItems,
            icon: const Icon(Icons.shopping_cart_rounded, color: Colors.white),
            label: Text(
              "lbl_buy".tr,
              style: const TextStyle(
                  fontWeight: FontWeight.w600, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
